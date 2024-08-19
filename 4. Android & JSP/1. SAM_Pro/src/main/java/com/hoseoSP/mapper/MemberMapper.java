package com.hoseoSP.mapper;

import com.hoseoSP.domain.MemberVo;

public interface MemberMapper {

	public void join(MemberVo member);
	
	public void auth(MemberVo member);
	
	public MemberVo read(String userid);
	
	/* public void idCheck(MemberVo member); */

}
