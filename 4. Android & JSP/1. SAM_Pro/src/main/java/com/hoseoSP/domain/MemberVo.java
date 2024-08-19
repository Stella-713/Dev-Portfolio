package com.hoseoSP.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVo {
	private String userid;
	private String username;
	private String userpw;
	private Date regdate;
	private Date updatedate;
	private String auth = "ROLE_MANAGER";
	private String phoneNum;

}
