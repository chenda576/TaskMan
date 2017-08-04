package org.action;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Task;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionSupport;

public class CancelTaskAction extends ActionSupport{
	private Integer tid;
	private String msg;
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
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
			String queryDeleteString="delete Wanted where taskId=?";
			Query queryDelete=session.createQuery(queryDeleteString);
			queryDelete.setParameter(0, tid);
			queryDelete.executeUpdate();
			Task task=(Task)session.get(Task.class, tid);
			session.delete(task);
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
