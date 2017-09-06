package com.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.project.domain.UserVO;

public interface UserMapper {

	public List<UserVO> selectUser(@Param("email") String email, @Param("password") String password) throws Exception;
	public void insertUser(UserVO user) throws Exception;

}
