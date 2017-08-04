package org.action;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.util.HibernateSessionFactory;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.model.Task;
import org.model.UserInfo;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class WantListAction extends ActionSupport{
	private String msg;
	private Integer tid;
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
			String querString="from UserInfo as u where u.userId in (select w.id.userInfo.userId from Wanted as w where w.id.task.taskId=?) order by u.credit desc)";
			Query query=session.createQuery(querString);
			query.setParameter(0,tid);
			List<?> wlist=query.list();
			if(wlist.size()==0){
				throw new Exception("没有人愿意做你的任务");
			}
			List<ArrayList<Task>> usersTaskList=new ArrayList<ArrayList<Task>>();
			ArrayList<Task> tList=new ArrayList<Task>();
			String qString="from Task where deliver=? and done=1 order by etime desc";
			Query query_wlist=session.createQuery(qString);
			query_wlist.setMaxResults(5);
			UserInfo userInfo=new UserInfo();
			for(int i=0;i<wlist.size();i++){
				userInfo=(UserInfo)wlist.get(i);
				query_wlist.setParameter(0, userInfo.getNickName());
				tList=(ArrayList<Task>)query_wlist.list();
				usersTaskList.add(tList);
			}
			ts.commit();
			HibernateSessionFactory.closeSession();
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("wlist",wlist);
			request.put("usersTaskList",usersTaskList);
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
