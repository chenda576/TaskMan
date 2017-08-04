package org.model;

import java.util.HashSet;
import java.util.Set;

/**
 * UserInfo entity. @author MyEclipse Persistence Tools
 */

public class UserInfo implements java.io.Serializable {

	// Fields

	private Integer userId;
	private String nickName;
	private Integer gender;
	private String mobile;
	private String password;
	private Integer credit;
	private Integer gold;
	private String realName;
	private String birth;
	private String nidn;
	private String photo;
	private Integer black;
	private Set wanteds = new HashSet(0);

	/** default constructor */
	public UserInfo() {
	}

	/** minimal constructor */
	public UserInfo(String nickName, Integer gender, String mobile,
			String password, Integer credit, Integer gold, Integer black) {
		this.nickName = nickName;
		this.gender = gender;
		this.mobile = mobile;
		this.password = password;
		this.credit = credit;
		this.gold = gold;
		this.black = black;
	}

	/** full constructor */
	public UserInfo(String nickName, Integer gender, String mobile,
			String password, Integer credit, Integer gold, String realName,
			String birth, String nidn, String photo, Integer black, Set wanteds) {
		this.nickName = nickName;
		this.gender = gender;
		this.mobile = mobile;
		this.password = password;
		this.credit = credit;
		this.gold = gold;
		this.realName = realName;
		this.birth = birth;
		this.nidn = nidn;
		this.photo = photo;
		this.black = black;
		this.wanteds = wanteds;
	}

	// Property accessors

	public Integer getUserId() {
		return this.userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public Integer getGender() {
		return this.gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public String getMobile() {
		return this.mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Integer getCredit() {
		return this.credit;
	}

	public void setCredit(Integer credit) {
		this.credit = credit;
	}

	public Integer getGold() {
		return this.gold;
	}

	public void setGold(Integer gold) {
		this.gold = gold;
	}

	public String getRealName() {
		return this.realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getBirth() {
		return this.birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getNidn() {
		return this.nidn;
	}

	public void setNidn(String nidn) {
		this.nidn = nidn;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public Integer getBlack() {
		return this.black;
	}

	public void setBlack(Integer black) {
		this.black = black;
	}

	public Set getWanteds() {
		return this.wanteds;
	}

	public void setWanteds(Set wanteds) {
		this.wanteds = wanteds;
	}

}