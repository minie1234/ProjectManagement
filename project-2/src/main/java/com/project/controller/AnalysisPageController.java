package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.project.domain.TodoVO;
import com.project.domain.UserVO;
import com.project.mapper.TodoMapper;

@Controller
public class AnalysisPageController {
	@Autowired
	private TodoMapper todoMapper;
	
	@RequestMapping("/analysis")
	public ModelAndView view(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("analysis");
		
		int no = ((UserVO)session.getAttribute("USER")).getNo();
		
		try {
			List<TodoVO> todoListCompleted = todoMapper.TodoListCompleted(no, 1, "completed");
			List<TodoVO> todoListNotCompleted = todoMapper.TodoListCompleted(no, 1, "not completed");
			List<TodoVO> todoListExpired = todoMapper.TodoListCompleted(no, 1, "expired");
			mv.addObject("todoListCompleted", todoListCompleted);
			mv.addObject("todoListNotCompleted", todoListNotCompleted);
			mv.addObject("todoListExpired", todoListExpired);
			mv.addObject("todoListTotalSize", (todoListCompleted.size()+todoListNotCompleted.size()+todoListExpired.size()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}
}
