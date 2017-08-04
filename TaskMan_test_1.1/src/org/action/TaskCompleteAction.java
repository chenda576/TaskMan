package org.action;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Task;
import org.model.UserInfo;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class TaskCompleteAction extends ActionSupport{
	private String msg;
	private Integer tid;
	private	String dname;
	private Integer gnum;
	
	public Integer getGnum() {
		return gnum;
	}
	public void setGnum(Integer gnum) {
		this.gnum = gnum;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getDname() {
		return dname;
	}
	public void setDname(String dname) {
		this.dname = dname;
	}
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			
			UserInfo userR=(UserInfo)session.get(UserInfo.class, user.getUserId());
			userR.setCredit(user.getCredit()+5);
			session.update(userR);
			
			Task task=(Task)session.get(Task.class, tid);
			task.setDone(1);
			task.setRate(5);
			session.update(task);
			
			String queryString="update UserInfo as u set u.gold=u.gold+? , u.credit=u.credit+5 where u.nickName=?";
			Query query=session.createQuery(queryString);
			query.setParameter(0, gnum);
			query.setParameter(1, dname);
			query.executeUpdate();
			
			String queryDeleteString="delete Wanted where taskId=?";
			Query queryDelete=session.createQuery(queryDeleteString);
			queryDelete.setParameter(0, tid);
			queryDelete.executeUpdate();
			
			ts.commit();
			HibernateSessionFactory.closeSession();
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
