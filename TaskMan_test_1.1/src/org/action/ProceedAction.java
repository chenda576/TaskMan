package org.action;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.UserInfo;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class ProceedAction extends ActionSupport{
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
			String queryString="from Task where deliver=?";
			Query query=session.createQuery(queryString);
			query.setParameter(0,user.getNickName());
			List<?> plist=query.list();
			if(plist.size()==0){	throw new Exception("目前还没有接到任务");	}
			ts.commit();
			HibernateSessionFactory.closeSession();
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("plist", plist);
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
