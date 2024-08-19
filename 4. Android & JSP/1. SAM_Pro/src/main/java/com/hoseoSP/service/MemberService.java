package com.hoseoSP.service;

import java.util.Map;

import com.hoseoSP.domain.MemberVo;

public interface MemberService {
	
	public void join(MemberVo member);
	
	public void auth(MemberVo member);

	/* int selectUserID(Map<String, Object> map) throws Exception; */
}
