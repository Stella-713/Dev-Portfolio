package com.hoseoSP.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/android/*")
@Log4j
public class AndoridController {

	@GetMapping("androidDB")
	public String androidDB() {
		
		return "/android/androidDB";
	}
	
	@PostMapping("androidDB")
	public String PandroidDB() {
		
		return "/android/androidDB";
	}
	
	@PostMapping("test")
	public String test()
	{
		
		log.info("test");
		
		return "/android/test";
	}
	
	@GetMapping("test")
	public String Gtest()
	{
		log.info("testget");
		
		return "/android/test";
	}
}
