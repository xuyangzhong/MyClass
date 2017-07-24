package com.zxy.model;

import java.util.Date;

/**
 * Submitwork entity. @author MyEclipse Persistence Tools
 */

public class Submitwork implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userid;
	private String username;
	private Integer workid;
	private Date subdate;
	private Integer issub;

	// Constructors

	/** default constructor */
	public Submitwork() {
	}

	/** full constructor */
	public Submitwork(String userid, String username, Integer workid,
			Date subdate, Integer issub) {
		this.userid = userid;
		this.username = username;
		this.workid = workid;
		this.subdate = subdate;
		this.issub = issub;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserid() {
		return this.userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public Integer getWorkid() {
		return this.workid;
	}

	public void setWorkid(Integer workid) {
		this.workid = workid;
	}

	public Date getSubdate() {
		return this.subdate;
	}

	public void setSubdate(Date subdate) {
		this.subdate = subdate;
	}

	public Integer getIssub() {
		return this.issub;
	}

	public void setIssub(Integer issub) {
		this.issub = issub;
	}

}