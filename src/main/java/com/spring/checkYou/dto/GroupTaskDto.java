package com.spring.checkYou.dto;

public class GroupTaskDto {

	String workname;
	String username;
	String groupname;
	String progress; // 진행 상태를 30%단위로 푸쉬알림 보내기
	String completed; // 완료된 task는 목록에 따로 보여주기 위한 field
	
	String mission; // 자신이 등록한 task와 owner가 부여한 mission을 따로 구분하기 위한 field
	String deadline; // mission의 경우 마감일을 등록하여  email로 남은 기한 및 현재 진행상태를 push알림으로 알리기 위한 field
	
	
	public String getWorkname() {
		return workname;
	}
	public void setWorkname(String workname) {
		this.workname = workname;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getGroupname() {
		return groupname;
	}
	public void setGroupname(String groupname) {
		this.groupname = groupname;
	}
	public String getProgress() {
		return progress;
	}
	public void setProgress(String progress) {
		this.progress = progress;
	}
	public String getCompleted() {
		return completed;
	}
	public void setCompleted(String completed) {
		this.completed = completed;
	}
	public String getMission() {
		return mission;
	}
	public void setMission(String mission) {
		this.mission = mission;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	
	
	
	
	
}
