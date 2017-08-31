package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SchedulerController {
	@RequestMapping("/scheduler")
	public String scheduler() {
		return "scheduler";
	}
}
