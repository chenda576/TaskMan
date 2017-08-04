package org.action;
import org.model.Task;
import org.model.UserInfo;
import org.model.Wanted;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class SearchTaskAction extends ActionSupport{
	private String str;
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			if(str==null){	str="";	}
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			String querString=
			"from Task where (brief like ? or addr like ? or detail like ? or publisher like ?) and publisher<>? and deliver=NULL and refund=0 order by etime";
			Query querytlist=session.createQuery(querString);
			querytlist.setParameter(0, "%"+str+"%");
			querytlist.setParameter(1, "%"+str+"%");
			querytlist.setParameter(2, "%"+str+"%");
			querytlist.setParameter(3, "%"+str+"%");
			querytlist.setParameter(4, user.getNickName());
			List<?> tlist=querytlist.list();		
			if(tlist.size()==0){	throw new Exception("查询不到关于"+str+"的内容");	}
			querString="from Wanted where userId=?";
			Query queryalist=session.createQuery(querString);
			queryalist.setParameter(0, user.getUserId());
			List<?> alist=queryalist.list();		
			ts.commit();  // 提交事务
			HibernateSessionFactory.closeSession();// 关闭Session
			Task t=new Task();
			Wanted w=new Wanted();
			List<Boolean> wlist=new ArrayList<Boolean>();
			for(int i=0;i<tlist.size();i++){
				t=(Task)tlist.get(i);
				for(int j=0;j<alist.size();j++){
					w=(Wanted)alist.get(j);
					wlist.add(false);
					if(w.getId().getTask().getTaskId()==t.getTaskId()){
						wlist.set(i,true);
						break;
					}
				}
			}
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("wlist",wlist);
			request.put("tlist",tlist);
			return SUCCESS;
		}
		catch(Exception e){
			ts.rollback();
			HibernateSessionFactory.closeSession();
			this.setMsg(e.toString());
			if(e.toString()=="查询不到关于"+str+"的内容"){
				return INPUT;
			}
			return ERROR;
		}
	}
}
