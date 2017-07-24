package com.zxy.model;

import java.util.List;

public class DetailPeo {
	private int submitnum;
	private int nosubmitnum;
	private List<Submitwork> submitpeo;
	private List<Submitwork> nosubmitpeo;
	public int getSubmitnum() {
		return submitnum;
	}
	public void setSubmitnum(int submitnum) {
		this.submitnum = submitnum;
	}
	public int getNosubmitnum() {
		return nosubmitnum;
	}
	public void setNosubmitnum(int nosubmitnum) {
		this.nosubmitnum = nosubmitnum;
	}
	public List<Submitwork> getSubmitpeo() {
		return submitpeo;
	}
	public void setSubmitpeo(List<Submitwork> submitpeo) {
		this.submitpeo = submitpeo;
	}
	public List<Submitwork> getNosubmitpeo() {
		return nosubmitpeo;
	}
	public void setNosubmitpeo(List<Submitwork> nosubmitpeo) {
		this.nosubmitpeo = nosubmitpeo;
	}
	
}
