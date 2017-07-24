package com.zxy.model;

import java.util.List;

public class LeavePeo {
	private int homenum;
	private int travelnum;
	private List<Userinfo> homepeo;
	private List<Userinfo> travelpeo;
	public int getHomenum() {
		return homenum;
	}
	public void setHomenum(int homenum) {
		this.homenum = homenum;
	}
	public int getTravelnum() {
		return travelnum;
	}
	public void setTravelnum(int travelnum) {
		this.travelnum = travelnum;
	}
	public List<Userinfo> getHomepeo() {
		return homepeo;
	}
	public void setHomepeo(List<Userinfo> homepeo) {
		this.homepeo = homepeo;
	}
	public List<Userinfo> getTravelpeo() {
		return travelpeo;
	}
	public void setTravelpeo(List<Userinfo> travelpeo) {
		this.travelpeo = travelpeo;
	}
	
	
}
