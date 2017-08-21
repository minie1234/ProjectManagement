package com.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AnalysisPageController {
	@RequestMapping("/analysis")
	public String view() {
		return "analysis";
	}
}
