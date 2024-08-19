package com.hoseoSP.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hoseoSP.service.Join_memberService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/member/*")
public class MemberController {
	
	private Join_memberService service;

	
	@GetMapping("join")
	public String join() {
		
		log.info("join.....");
		
		return "/member/join";
	}
	
	@PostMapping("join")
	public String pJoin() {
		
		log.info("join...");
		
		return "/member/join";
	}
	
	@PostMapping("register")
	public String register() {
		
		log.info("register");
		
		return "/member/register";
	}
	
	@GetMapping("addNum")
	public String addNum() {
		
		log.info("addNum...");
		
		return "/member/addNum";
	}
	
	@PostMapping("addNum")
	public String paddNum() {
		
		log.info("addnum..,..");
		
		return "/member/addNum";
	}
	
	

	
	
}
