package org.action;
import org.model.UserInfo;
import org.model.Task;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class PersonTaskAction extends ActionSupport{
	private String msg;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			String queryString="from Task where publisher=? order by etime";
			Query query=session.createQuery(queryString);
			query.setParameter(0, user.getNickName());
			List<?> tlist=query.list();
			if(tlist.size()==0){
				throw new Exception("没有发布过任务");
			}
			List<Integer> wlist=new ArrayList<Integer>();
			for(int i=0;i<tlist.size();i++){
				Task task=(Task) tlist.get(i);
				if(task.getDone()==0){
					queryString="select count(userId) from Wanted where taskId=?";
					Query queryCount=session.createQuery(queryString);
					queryCount.setParameter(0,task.getTaskId());
					wlist.add(((Number)queryCount.uniqueResult()).intValue()); 
				}
				else{
					wlist.add(-1);
				}
			}
			ts.commit();  // 提交事务
			HibernateSessionFactory.closeSession();// 关闭Session
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("tlist",tlist);
			request.put("wlist",wlist);
			return SUCCESS;
		}
		catch(Exception e){
			ts.rollback();
			HibernateSessionFactory.closeSession();
			this.setMsg(e.toString());
			return ERROR;
		}
	}
}