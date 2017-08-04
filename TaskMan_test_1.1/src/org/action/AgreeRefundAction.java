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
public class AgreeRefundAction extends ActionSupport{
	private String msg;
	private Integer tid;
	private Integer gnum;
	private String uname;
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
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			int gold_recive=gnum/10;
			if(gold_recive==0){
				gold_recive=1;
			}
			user.setGold(user.getGold()+gold_recive);
			user.setCredit(user.getCredit()+5);
			session.update(user);
			String queryUpdateString="update UserInfo set gold=gold+? where nickName=?";
			Query queryUpdate=session.createQuery(queryUpdateString);
			queryUpdate.setParameter(0, gnum);
			queryUpdate.setParameter(1, uname);
			queryUpdate.executeUpdate();
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
