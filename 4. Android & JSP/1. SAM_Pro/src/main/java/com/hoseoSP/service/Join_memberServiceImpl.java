package com.hoseoSP.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.hoseoSP.domain.Join_memberVO;
import com.hoseoSP.mapper.Join_memberMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


 @Log4j
 
 @Service
 
 @AllArgsConstructor public class Join_memberServiceImpl implements
 Join_memberService {
 
 private Join_memberMapper mapper;
	 
	 @Override 
	 public List<Join_memberVO> getList(){
	 
	 log.info("join_memberservice.....");
	 
	 return mapper.getList(); 
	 }
	 
 }

