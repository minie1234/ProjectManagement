package com.project.domain;

import java.sql.Date;

public class TodoVO2 {
	private int no;
	private String team;
	private String task;
	private String todowriter;
	private String projecttitle;
	private Date startdate;
	private Date enddate;
	private String state;
	private String filename;
	private Date writedate;
	private String filewriter;
	
	public TodoVO2(int no, String team, String task, String todowriter, String projecttitle, Date startdate,
			Date enddate, String state, String filename, Date writedate, String filewriter) {
		super();
		this.no = no;
		this.team = team;
		this.task = task;
		this.todowriter = todowriter;
		this.projecttitle = projecttitle;
		this.startdate = startdate;
		this.enddate = enddate;
		this.state = state;
		this.filename = filename;
		this.writedate = writedate;
		this.filewriter = filewriter;
	}

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

	public String getTodowriter() {
		return todowriter;
	}

	public void setTodowriter(String todowriter) {
		this.todowriter = todowriter;
	}

	public String getProjecttitle() {
		return projecttitle;
	}

	public void setProjecttitle(String projecttitle) {
		this.projecttitle = projecttitle;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public String getFilewriter() {
		return filewriter;
	}

	public void setFilewriter(String filewriter) {
		this.filewriter = filewriter;
	}

	@Override
	public String toString() {
		return "TodoVO [no=" + no + ", team=" + team + ", task=" + task + ", todowriter=" + todowriter
				+ ", projecttitle=" + projecttitle + ", startdate=" + startdate + ", enddate=" + enddate + ", state="
				+ state + ", filename=" + filename + ", writedate=" + writedate + ", filewriter=" + filewriter + "]";
	}
}
