package org.action;
import org.model.Task;
import org.model.Wanted;
import org.model.WantedId;
import org.model.UserInfo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;
import java.util.Map;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class WillingAction extends ActionSupport{
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
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			Task t=new Task();
			t.setTaskId(tid);
			WantedId Wid=new WantedId(t,user);
			Wanted W=new Wanted(Wid);
			session.save(W);
			ts.commit();  // 提交事务
			HibernateSessionFactory.closeSession();// 关闭Session
			return SUCCESS;
		}
		catch(Exception e){
			ts.rollback();
			this.setMsg(e.toString());
			return ERROR;
		}
	}
}
