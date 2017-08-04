package org.model;

/**
 * WantedId entity. @author MyEclipse Persistence Tools
 */

public class WantedId implements java.io.Serializable {

	// Fields

	private Task task;
	private UserInfo userInfo;

	// Constructors

	/** default constructor */
	public WantedId() {
	}

	/** full constructor */
	public WantedId(Task task, UserInfo userInfo) {
		this.task = task;
		this.userInfo = userInfo;
	}

	// Property accessors

	public Task getTask() {
		return this.task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	public UserInfo getUserInfo() {
		return this.userInfo;
	}

	public void setUserInfo(UserInfo userInfo) {
		this.userInfo = userInfo;
	}

	public boolean equals(Object other) {
		if ((this == other))
			return true;
		if ((other == null))
			return false;
		if (!(other instanceof WantedId))
			return false;
		WantedId castOther = (WantedId) other;

		return ((this.getTask() == castOther.getTask()) || (this.getTask() != null
				&& castOther.getTask() != null && this.getTask().equals(
				castOther.getTask())))
				&& ((this.getUserInfo() == castOther.getUserInfo()) || (this
						.getUserInfo() != null
						&& castOther.getUserInfo() != null && this
						.getUserInfo().equals(castOther.getUserInfo())));
	}

	public int hashCode() {
		int result = 17;

		result = 37 * result
				+ (getTask() == null ? 0 : this.getTask().hashCode());
		result = 37 * result
				+ (getUserInfo() == null ? 0 : this.getUserInfo().hashCode());
		return result;
	}

}