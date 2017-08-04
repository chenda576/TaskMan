package org.action;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.model.UserInfo;
import org.util.HibernateSessionFactory;
import com.opensymphony.xwork2.ActionSupport;
public class RegisterAction extends ActionSupport{
	private UserInfo user;
	private String msg;
	public UserInfo getUser() {
		return user;
	}
	public void setUser(UserInfo user) {
		this.user = user;
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
			String pw=user.getPassword();
			user.setPassword(MessageDigestUtil.digestByMD5(pw));
			user.setCredit(40);
			user.setGold(15);
			user.setBlack(0);
			session.save(user);
			ts.commit();  // 提交事务
			HibernateSessionFactory.closeSession();// 关闭Session
			return SUCCESS;
		}
		catch(Exception e){
			ts.rollback();
			if(msg==""){
				return INPUT;
			}
			HibernateSessionFactory.closeSession();
			this.setMsg(e.toString());
			return ERROR;
		}
	}
}
