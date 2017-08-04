package org.action;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.Task;
import org.model.UserInfo;
import org.util.HibernateSessionFactory;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class QuitATaskAction extends ActionSupport{
	private String msg;
	private Integer gnum;
	private Integer tid;
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Integer getGnum() {
		return gnum;
	}
	public void setGnum(Integer gnum) {
		this.gnum = gnum;
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
			int gold_punish=gnum/10;
			if(gold_punish==0){
				gold_punish=1;
			}
			if((user.getGold()-gold_punish)<0){
				throw new Exception("您的金币不足以支付申请退款的惩罚金币");
			}
			user.setGold(user.getGold()-gold_punish);
			user.setCredit(user.getCredit()-5);
			if(user.getCredit()<0){
				user.setBlack(user.getBlack()+1);
				user.setCredit(0);
			}
			session.update(user);
			
			Task task=(Task)session.get(Task.class, tid);
			task.setDeliver(null);
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
