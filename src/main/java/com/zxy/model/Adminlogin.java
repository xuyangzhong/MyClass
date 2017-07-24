package com.zxy.model;

/**
 * Adminlogin entity. @author MyEclipse Persistence Tools
 */

public class Adminlogin implements java.io.Serializable {

	// Fields

	private Integer id;
	private String adminname;
	private String password;

	// Constructors

	/** default constructor */
	public Adminlogin() {
	}

	/** full constructor */
	public Adminlogin(String adminname, String password) {
		this.adminname = adminname;
		this.password = password;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAdminname() {
		return this.adminname;
	}

	public void setAdminname(String adminname) {
		this.adminname = adminname;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}