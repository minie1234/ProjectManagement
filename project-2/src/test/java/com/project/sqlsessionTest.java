package com.project;

import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Project2Application.class)
@WebAppConfiguration

public class sqlsessionTest {
	@Autowired
	private CommonsMultipartResolver resolver; // 작성

	@Test
	public void contextLoads() {
	}

	@Test
	public void testResolver() throws Exception {// 작성

		System.out.println("resolver : " + resolver);

	}

}