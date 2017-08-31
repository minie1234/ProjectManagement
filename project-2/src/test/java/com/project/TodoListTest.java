package com.project;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.project.mapper.TodoMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Project2Application.class)
@WebAppConfiguration

public class TodoListTest {
	@Autowired
	private TodoMapper mapper;

	@Test
	public void contextLoads() {
	}

	@Test
	public void testSelectTodoList() throws Exception { // 작성
		System.out.println("Test Start");
		System.out.println(mapper.TodoListCompleted(1, 1, "completed"));
		System.out.println(mapper.TodoListNotCompleted(1, 1, "not completed"));
		System.out.println(mapper.TodoListExpired(1, 1, "expired"));
	}

}