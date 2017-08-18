package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.mapper.ProjectMapper;

@Controller
public class AnalysisController {
	@Autowired
	private ProjectMapper projectMapper;

	@RequestMapping("/")
	public String view() {
		return "main";
	}
}
