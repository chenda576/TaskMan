package org.model;

import java.util.HashSet;
import java.util.Set;

/**
 * Task entity. @author MyEclipse Persistence Tools
 */

public class Task implements java.io.Serializable {

	// Fields

	private Integer taskId;
	private String brief;
	private String stime;
	private String etime;
	private String addr;
	private String detail;
	private Integer money;
	private String publisher;
	private String deliver;
	private Integer done;
	private Integer refund;
	private Integer rate;
	private Set wanteds = new HashSet(0);

	// Constructors

	/** default constructor */
	public Task() {
	}

	/** minimal constructor */
	public Task(String brief, String detail, String publisher, Integer done,
			Integer refund) {
		this.brief = brief;
		this.detail = detail;
		this.publisher = publisher;
		this.done = done;
		this.refund = refund;
	}

	/** full constructor */
	public Task(String brief, String stime, String etime, String addr,
			String detail, Integer money, String publisher, String deliver,
			Integer done, Integer refund, Integer rate, Set wanteds) {
		this.brief = brief;
		this.stime = stime;
		this.etime = etime;
		this.addr = addr;
		this.detail = detail;
		this.money = money;
		this.publisher = publisher;
		this.deliver = deliver;
		this.done = done;
		this.refund = refund;
		this.rate = rate;
		this.wanteds = wanteds;
	}

	// Property accessors

	public Integer getTaskId() {
		return this.taskId;
	}

	public void setTaskId(Integer taskId) {
		this.taskId = taskId;
	}

	public String getBrief() {
		return this.brief;
	}

	public void setBrief(String brief) {
		this.brief = brief;
	}

	public String getStime() {
		return this.stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getEtime() {
		return this.etime;
	}

	public void setEtime(String etime) {
		this.etime = etime;
	}

	public String getAddr() {
		return this.addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getDetail() {
		return this.detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
	}

	public Integer getMoney() {
		return this.money;
	}

	public void setMoney(Integer money) {
		this.money = money;
	}

	public String getPublisher() {
		return this.publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getDeliver() {
		return this.deliver;
	}

	public void setDeliver(String deliver) {
		this.deliver = deliver;
	}

	public Integer getDone() {
		return this.done;
	}

	public void setDone(Integer done) {
		this.done = done;
	}

	public Integer getRefund() {
		return this.refund;
	}

	public void setRefund(Integer refund) {
		this.refund = refund;
	}

	public Integer getRate() {
		return this.rate;
	}

	public void setRate(Integer rate) {
		this.rate = rate;
	}

	public Set getWanteds() {
		return this.wanteds;
	}

	public void setWanteds(Set wanteds) {
		this.wanteds = wanteds;
	}

}