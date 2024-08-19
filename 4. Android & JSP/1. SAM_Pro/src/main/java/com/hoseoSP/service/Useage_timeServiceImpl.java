package com.hoseoSP.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hoseoSP.domain.Useage_timeVO;
import com.hoseoSP.domain.sumTimeVO;
import com.hoseoSP.mapper.Useage_timeMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class Useage_timeServiceImpl implements Useage_timeService{
	
	private Useage_timeMapper mapper;

	@Override
	public List<Useage_timeVO> getList() {
		log.info("getList ...........");
		log.info(mapper.getList());
		return mapper.getList();
	}
	
	@Override
	public List<sumTimeVO> Month_Use(){
		//System.out.println("service >> " + mapper.Month_Use());
		return mapper.Month_Use();
	}
	
	@Override
	public List<Useage_timeVO> reshow(String phoneNum){
		log.info("reshow.......");
		
		return mapper.reshow(phoneNum);
		
	}
	
	@Override
	public List<Useage_timeVO> WeekInterval(){
		
		return mapper.WeekInterval();
	}
	
	@Override
	public List<Useage_timeVO> WeekInterval2(){
		
		return mapper.WeekInterval2();
	}
	
	@Override
	public List<Useage_timeVO> WeekInterval3(){
		
		return mapper.WeekInterval3();
	}
	
	@Override
	public List<Useage_timeVO> WeekInterval4(){
		
		return mapper.WeekInterval4();
	}
	@Override
	public List<Useage_timeVO> WeekInterval5(){
		
		return mapper.WeekInterval5();
	}
	@Override
	public List<Useage_timeVO> WeekInterval6(){
		
		return mapper.WeekInterval6();
	}
	@Override
	public List<Useage_timeVO> WeekInterval7(){
		
		return mapper.WeekInterval7();
	}
	
	@Override
	public List<Useage_timeVO> MonInterval(){
		
		return mapper.MonInterval();
	}
	
	/*
	 * @Override public String sumUT() {
	 * 
	 * log.info("sumUT.........");
	 * 
	 * return mapper.sumUT(); }
	 */
	
	
	
}	
