package com.hoseoSP.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.hoseoSP.controller.BoardController;
import com.hoseoSP.domain.Useage_timeVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class Useage_timeMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private Useage_timeMapper mapper;
	
	@Test
	public void testGetList() {
		
		mapper.getList().forEach(Useage_time -> log.info(Useage_time));
	}

}
