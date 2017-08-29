package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;

import com.project.mapper.ProjectMapper;

@RestController
public class AnalysisDataController {
	@Autowired
	private ProjectMapper projectMapper;

	
}
