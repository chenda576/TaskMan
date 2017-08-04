package org.action;
import org.model.Task;
import org.model.UserInfo;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;

import java.util.Date; 
import java.util.Map;
import java.text.SimpleDateFormat; 

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class PublishAction extends ActionSupport{
	private Task task;
	private String msg;
	private String addr_detail;
	public Task getTask() {
		return task;
	}
	public void setTask(Task task) {
		this.task = task;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String execute() throws Exception{
		Session session=HibernateSessionFactory.getSession();
		Transaction ts=session.beginTransaction();
		try{
			Map requestUser=(Map)ActionContext.getContext().getSession();
			UserInfo user=(UserInfo)requestUser.get("user");
			if(user.getGold()-task.getMoney()>=0){
				if(addr_detail!=null||addr_detail!=""){
					task.setAddr(task.getAddr()+addr_detail);
				}
				else{
					task.setAddr(task.getAddr());
				}
				user.setGold(user.getGold()-task.getMoney());
				session.update(user);
				task.setDone(0);
				task.setRefund(0);
				Date now = new Date(); 
				SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
				String stime = dateFormat.format( now );
				task.setStime(stime);
				task.setPublisher(user.getNickName());
				session.save(task);
				ts.commit();  // 提交事务
				HibernateSessionFactory.closeSession();// 关闭Session
			}
			else{
				throw new Exception("金额不足");
			}
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
