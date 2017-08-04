package org.action;
import org.model.Task;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;
public class ChooseAction extends ActionSupport{
	private String msg;
	private String username;
	private Integer tid;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
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
			//检测用户是否还在列表中，并抛出异常。
			String queryDeleteString="delete Wanted where taskId=?";
			Query queryDelete=session.createQuery(queryDeleteString);
			queryDelete.setParameter(0, tid);
			queryDelete.executeUpdate();
			Task task=(Task)session.get(Task.class, tid);
			task.setDeliver(username);
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
