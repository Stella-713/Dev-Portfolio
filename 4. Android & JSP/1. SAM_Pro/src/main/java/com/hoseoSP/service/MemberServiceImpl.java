package com.hoseoSP.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoseoSP.domain.MemberVo;
import com.hoseoSP.mapper.MemberMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class MemberServiceImpl implements MemberService{
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;
	
	@Override
	public void join(MemberVo member) {
		
		log.info("join....." + member);
		
		mapper.join(member);
		
	}

	
	 @Override public void auth(MemberVo member) {
	 
		 log.info("auth....." + member);
	 
		 mapper.auth(member);
	 
	 }
	
	
	/*
	 * @Override public int selectUserID(Map<String, Object> map) throws Exception {
	 * return MemberVo.setUserid(map); }
	 */



}
