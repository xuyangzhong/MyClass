package com.zxy.model;

import java.util.Date;

/**
 * Work entity. @author MyEclipse Persistence Tools
 */

public class Work implements java.io.Serializable {

	// Fields

	private Integer id;
	private String workname;
	private Date workbegintime;
	private Date workendtime;

	// Constructors

	/** default constructor */
	public Work() {
	}

	/** full constructor */
	public Work(String workid, String workname, Date workbegintime,
			Date workendtime) {
		this.workname = workname;
		this.workbegintime = workbegintime;
		this.workendtime = workendtime;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getWorkname() {
		return this.workname;
	}

	public void setWorkname(String workname) {
		this.workname = workname;
	}

	public Date getWorkbegintime() {
		return this.workbegintime;
	}

	public void setWorkbegintime(Date workbegintime) {
		this.workbegintime = workbegintime;
	}

	public Date getWorkendtime() {
		return this.workendtime;
	}

	public void setWorkendtime(Date workendtime) {
		this.workendtime = workendtime;
	}

}