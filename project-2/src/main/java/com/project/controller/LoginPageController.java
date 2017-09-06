package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.UserVO;
import com.project.mapper.UserMapper;


@Controller
public class LoginPageController {
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/login/select")
	public ModelAndView selectLogin(@RequestParam("email") String email, @RequestParam("password") String password
			, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		try {
			List<UserVO> userList = userMapper.selectUser(email, password);
			if(userList == null || userList.isEmpty() || userList.size() == 0) {
				mv.setViewName("redirect:/login");
			}else {
				mv.setViewName("redirect:/analysis");
				session.setAttribute("USER", userList.get(0));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
