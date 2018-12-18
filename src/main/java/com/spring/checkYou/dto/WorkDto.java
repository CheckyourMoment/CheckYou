package com.spring.checkYou.dto;

public class WorkDto {
	
	private String id;
	private String worktype;
	private String workname;
	private String workdetail;
	
	public WorkDto() {
		
	}
	
	public WorkDto(String id, String worktype, String workname, String workdetail) {
		super();
		this.id = id;
		this.worktype = worktype;
		this.workname = workname;
		this.workdetail = workdetail;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWorktype() {
		return worktype;
	}

	public void setWorktype(String worktype) {
		this.worktype = worktype;
	}

	public String getWorkname() {
		return workname;
	}

	public void setWorkname(String workname) {
		this.workname = workname;
	}

	public String getWorkdetail() {
		return workdetail;
	}

	public void setWorkdetail(String workdetail) {
		this.workdetail = workdetail;
	}
	
	
	
	
	
}
