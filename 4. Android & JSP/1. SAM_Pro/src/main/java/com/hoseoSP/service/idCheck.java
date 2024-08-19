package com.hoseoSP.service;

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
public class idCheck implements CheckService{

	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public MemberVo Check(String userid) {
		
		log.info("get............" + userid);
		
		
		return mapper.read(userid);
	}

}
