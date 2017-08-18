package com.project.domain;

import java.util.Date;

public class ProjectVO {
	private int no;
	private String team;
	private String task;
	private int UserNo;
	private int ProjectNo;
	private Date startDate;
	private Date endDate;
	private String state;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTeam() {
		return team;
	}

	public void setTeam(String team) {
		this.team = team;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	public int getUserNo() {
		return UserNo;
	}

	public void setUserNo(int userNo) {
		UserNo = userNo;
	}

	public int getProjectNo() {
		return ProjectNo;
	}

	public void setProjectNo(int projectNo) {
		ProjectNo = projectNo;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

}
