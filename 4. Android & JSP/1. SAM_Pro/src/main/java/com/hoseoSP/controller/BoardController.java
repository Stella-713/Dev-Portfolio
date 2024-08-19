package com.hoseoSP.controller;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hoseoSP.domain.MemberVo;
import com.hoseoSP.domain.Useage_timeVO;
import com.hoseoSP.service.MemberService;
import com.hoseoSP.service.Useage_timeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private Useage_timeService service;
	private MemberService mservice;

	
	@RequestMapping("/home")
	public void home(){
		log.info("home");
	}
	
	@RequestMapping("/idCheck")
	public void idCheck(MemberVo member){
		log.info("idCheck");
	}
	
	@GetMapping("join")
	@PreAuthorize("isAuthenticated()")
	public void join() {
		
		log.info("get join.");

	}
	
	@PostMapping("join")
	public String join(MemberVo member, HttpServletResponse response) {
		
		log.info("join "+member);
		try {
			mservice.join(member);
			mservice.auth(member);
		}catch(Exception e){
			System.out.println("회占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 : "+e.getMessage());
			response.setContentType("text/html; charset=UTF-8");
			 
			PrintWriter out;
			try {
				out = response.getWriter();
				out.println("<script>alert('以묐났�솗�씤.'); location.href='/board/home';</script>");
				out.flush();
			}catch (Exception e1) {
			}
		}
		
		log.info("join"+member);
		
		return "redirect:/board/home";
	}
	
	@PostMapping("useage_time")
	public void useage_time(HttpServletRequest request, Model model) {
		
		String phoneNum = request.getParameter("pNumber");
		String Interval = request.getParameter("Interval");
		UserDetails userDetails =
				(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

				System.out.println(userDetails.getUsername());
		if(phoneNum == null)
		{
			log.info("null!!!!!!!!");
			log.info(service.getList());
			if(Interval == null)
			{
				model.addAttribute("useage_time", service.getList());
				model.addAttribute("Month_Use",service.Month_Use());
			}
			if(Interval == "1")
			{
				log.info(service.WeekInterval());
				model.addAttribute("useage_time",service.WeekInterval());
			}
			
		}
		if(phoneNum != null)
		{
			log.info("not nul!!!");
			model.addAttribute("useage_time",service.reshow(phoneNum));
		}
			
	}
	
	@GetMapping("/test")
	public String test(HttpServletRequest request) {
//NCSGSNRNQP1SLLRL
		//URTNYNPX1RLYWCOWV86KJ7VLT733V0UQ
		String api_key = "NCSXRNVCVZYLJO6P";
	    String api_secret = "5WPEQBM2IK11YR2O0KVAZNLW0WEMFNLN";
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", "01076500350");
	    params.put("from", "01076500350");
	    params.put("type", "SMS");
	    params.put("text", "6시간 이상 사용!!");
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
		  
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
		
		
		return "redirect:/board/useage_time";
	}
	
	
	@GetMapping("useage_time")
	public void useage_timee(HttpServletRequest request,Model model) {
		
		String phoneNum = request.getParameter("phoneNum");
		String Interval = request.getParameter("Interval");
		UserDetails userDetails =
				(UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal();

				System.out.println(userDetails.getUsername());

		System.out.printf("Interval = "+Interval);
		
		
		log.info("get useage_time .... ");
		if(Interval == null)
		{
			log.info("Interval : null!! \n");
			//model.addAttribute("useage_time",service.getList());
			model.addAttribute("Month_Use",service.Month_Use());
			System.out.println("boardContorller : " + service.Month_Use());
		}
			
		if("0".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time",service.WeekInterval());
		}
		if("1".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time2",service.WeekInterval2());
		}
		if("2".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time3",service.WeekInterval3());
		}
		if("3".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time4",service.WeekInterval4());
		}
		if("4".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time5",service.WeekInterval5());
		}
		if("5".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time6",service.WeekInterval6());
		}
		if("6".equals(Interval))
		{
			model.addAttribute("Month_Use",service.Month_Use());

			model.addAttribute("useage_time7",service.WeekInterval7());
		}
		
		
			
	}
	
	@GetMapping("phoneNum")
	public String phoneNum() {
		
		log.info("get phoneNum....");
		
		return "/board/phoneNum";
	}
	
	
	
	
}
