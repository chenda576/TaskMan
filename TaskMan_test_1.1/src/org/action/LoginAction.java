package org.action;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.Query;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;
import org.model.UserInfo;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class LoginAction extends ActionSupport{
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
			Query query=session.createQuery("from UserInfo where mobile=?");
			query.setParameter(0, user.getMobile());
			query.setMaxResults(1);
			UserInfo ui=(UserInfo)query.uniqueResult();
			if(ui==null){	throw new Exception("�û�������"); }
			if(ui.getPassword().equals(MessageDigestUtil.digestByMD5(user.getPassword()))){
				Map request=(Map)ActionContext.getContext().getSession();
				request.put("user",ui);
				ts.commit();  // �ύ����
				HibernateSessionFactory.closeSession();// �ر�Session
				return SUCCESS;
			}
			else{	throw new Exception("���벻��ȷ"); }
		}
		catch(Exception e){
			ts.rollback();
			HibernateSessionFactory.closeSession();
			this.setMsg(e.toString());
			return ERROR;
		}
	}
}
