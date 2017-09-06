package com.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SchedulerController {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@RequestMapping(value="/scheduler")
	public String scheduler() { 
		return "scheduler";
	}
    
    @RequestMapping(value = "/schedulerIframe", method = RequestMethod.GET)
	public String schedulerIframe() {
    	
    	return "schedulerIframe";
    }
    
    @RequestMapping(value = "/schedulerIframeAjax")
    @ResponseBody
	public List<Object> schedulerIframeAjax() {
    	List<Object> list = sqlSession.selectList("SchedulerMapper.project_and_team");
		System.out.println(list);
		
		return list;
    }
	
	@RequestMapping(value="/todoList")
	@ResponseBody
	public List<Object> todoList() throws Exception { 
		List<Object> list = sqlSession.selectList("SchedulerMapper.todo_info_list");
		System.out.println(list);

		return list;
	}
    
    @RequestMapping(value = "/todoListByName")
    @ResponseBody
	public List<Object> todoListByName(int pId, String parentName, String name) {
    	System.out.println(pId);
    	System.out.println(parentName);
    	System.out.println(name);
    	List<Object> list = null;
    	if(pId == 0)
    		list = sqlSession.selectList("SchedulerMapper.todo_info_list");
    	else if(pId == 1)
    		list = sqlSession.selectList("SchedulerMapper.todo_info_list_projectname", name);
    	else{
    		Map<String, Object> map = new HashMap<String, Object>();
        	map.put("parentName", parentName);
        	map.put("name", name);
        	list = sqlSession.selectList("SchedulerMapper.todo_info_list_team", map);
    	}
		System.out.println(list);
		
		return list;
    }
	
	@RequestMapping(value="/projectAndTeamList")
	@ResponseBody
	public List<Object> projectAndTeamList() throws Exception { 
		List<Object> list = new ArrayList<Object>();
		List<Object> list1 = sqlSession.selectList("SchedulerMapper.project_info_project_list");
		List<Object> list2 = sqlSession.selectList("SchedulerMapper.todo_info_team_list");
		list.add(list1);
		list.add(list2);
		System.out.println(list);

		return list;
	}
    
    @RequestMapping(value = "/saveTodoList")
    @ResponseBody
	public int saveTodoList(HttpServletRequest request) {
    	Map<String, Object> map = new HashMap<String, Object>();
    	map.put("no", request.getParameter("no"));
    	map.put("team", request.getParameter("team"));
    	map.put("title", request.getParameter("title"));
    	map.put("todowriter", request.getParameter("todowriter"));
    	map.put("projecttitle", request.getParameter("projecttitle"));
    	map.put("start", request.getParameter("start"));
    	map.put("end", request.getParameter("end"));
    	map.put("state", request.getParameter("state"));
    	map.put("filename", request.getParameter("filename"));
    	map.put("writedate", request.getParameter("writedate"));
    	map.put("filewriter", request.getParameter("filewriter"));
		System.out.println(map);
		//int result = 0;
		int result = sqlSession.update("SchedulerMapper.update_todo_info", map);
		System.out.println(result);
		
		return result;
    }
}
