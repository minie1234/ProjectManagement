package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TaskController {
	
	@RequestMapping("/task")
	public String taskview() {
		return "task/addTeam";
	}
	
	@RequestMapping("/popup")
	public String taskpopup() {
		return "task/popup";
	}
}
