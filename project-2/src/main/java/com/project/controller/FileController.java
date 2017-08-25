package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.ProjectVO;
import com.project.mapper.ProjectMapper;

@Controller
public class FileController {
	@RequestMapping("/file")
	public String view() {
		return "file";
	}
}
