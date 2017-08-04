package org.action;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Task;
import org.util.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;
public class DisagreeRefundAction extends ActionSupport{
	private String msg;
	private Integer tid;
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
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			Task task=(Task)session.get(Task.class, tid);
			task.setRefund(0);
			session.update(task);
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
