package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.TodoVO;

public interface TodoMapper {

	public List<TodoVO> TodoListCompleted(@Param("userNo") int userNo, @Param("projectNo") int projectNo, @Param("state") String state) throws Exception; // 추가
	public List<TodoVO> TodoListNotCompleted(@Param("userNo") int userNo, @Param("projectNo") int projectNo, @Param("state") String state) throws Exception; // 추가
	public List<TodoVO> TodoListExpired(@Param("userNo") int userNo, @Param("projectNo") int projectNo, @Param("state") String state) throws Exception; // 추가

}
