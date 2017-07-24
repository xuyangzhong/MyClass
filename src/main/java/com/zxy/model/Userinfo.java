package com.zxy.model;

/**
 * Userinfo entity. @author MyEclipse Persistence Tools
 */

public class Userinfo implements java.io.Serializable {

	// Fields

	private String id;
	private String username;
	private Integer sex;
	private String dorm;
	private String classname;
	private String mobilephone;
	private String address;
	private String homephone;
	private Integer chosen;

	// Constructors

	/** default constructor */
	public Userinfo() {
	}

	/** minimal constructor */
	public Userinfo(String username, Integer sex, String dorm,
			String classname, String mobilephone, String address,
			String homephone) {
		this.username = username;
		this.sex = sex;
		this.dorm = dorm;
		this.classname = classname;
		this.mobilephone = mobilephone;
		this.address = address;
		this.homephone = homephone;
	}

	/** full constructor */
	public Userinfo(String username, Integer sex, String dorm,
			String classname, String mobilephone, String address,
			String homephone, Integer chosen) {
		this.username = username;
		this.sex = sex;
		this.dorm = dorm;
		this.classname = classname;
		this.mobilephone = mobilephone;
		this.address = address;
		this.homephone = homephone;
		this.chosen = chosen;
	}

	// Property accessors

	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getSex() {
		return this.sex;
	}

	public void setSex(Integer sex) {
		this.sex = sex;
	}

	public String getDorm() {
		return this.dorm;
	}

	public void setDorm(String dorm) {
		this.dorm = dorm;
	}

	public String getClassname() {
		return this.classname;
	}

	public void setClassname(String classname) {
		this.classname = classname;
	}

	public String getMobilephone() {
		return this.mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHomephone() {
		return this.homephone;
	}

	public void setHomephone(String homephone) {
		this.homephone = homephone;
	}

	public Integer getChosen() {
		return this.chosen;
	}

	public void setChosen(Integer chosen) {
		this.chosen = chosen;
	}

}