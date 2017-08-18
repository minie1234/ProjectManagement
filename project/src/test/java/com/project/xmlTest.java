package com.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.domain.ProjectVO;
import com.project.mapper.ProjectMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Project2Application.class)
@WebAppConfiguration

public class xmlTest {
	@Autowired
	private ProjectMapper mapper;

	@Test
	public void contextLoads() {
	}

	@Test
	public void testMapper() throws Exception {// 작성

		ProjectVO vo = new ProjectVO();

		vo.setTask("task입니다.");
		vo.setTeam("team입니다.");
		vo.setState("state입니다.");
	

		mapper.ProjectInsert(vo);

	}

}