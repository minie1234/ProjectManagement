package com.project.domain;

import java.io.File;
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
	
	private int fileNo;
	private String fileName;
	private String fileWriter;
	private Date fileDate;
	
	private String report;

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
	
	
	
	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public String getFileWriter() {
		return fileWriter;
	}

	public void setFileWriter(String fileWriter) {
		this.fileWriter = fileWriter;
	}
	
	public Date getFileDate() {
		return fileDate;
	}

	public void setFileDate(Date fileDate) {
		this.fileDate = fileDate;
	}
	
	public String getReport() {
		return report;
	}
	
	public void setReport(String report) {
		this.report = report;
	}
	
}
