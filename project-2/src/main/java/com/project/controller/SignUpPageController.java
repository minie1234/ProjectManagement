package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.domain.UserVO;
import com.project.mapper.UserMapper;


@Controller
public class SignUpPageController {
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/signUp")
	public String login() {
		return "signUp";
	}
	
	@RequestMapping("/signUp/insert")
	public String selectLogin(@ModelAttribute("UserVO")UserVO user) {
		try {
			userMapper.insertUser(user);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/login";
	}
}
