package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.project.domain.ProjectVO;
import com.project.mapper.ProjectMapper;

@RestController
public class ProjectListController {
	@Autowired
	private ProjectMapper projectMapper;

	@RequestMapping("/project")
	public List<ProjectVO> project() throws Exception {
		List<ProjectVO> project = projectMapper.fileList();
		return project;
	}

}
