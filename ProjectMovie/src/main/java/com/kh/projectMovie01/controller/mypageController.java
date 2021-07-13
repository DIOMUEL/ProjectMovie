package com.kh.projectMovie01.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.projectMovie01.service.MemberService;

@Controller
@RequestMapping(value="/mypage")
public class mypageController {
	
	@Inject
	private MemberService memberService;
	

	@RequestMapping(value="/Management",method=RequestMethod.GET)
	public String Management() {		
		return "mypage/Management";	
	}
	
	@RequestMapping(value="/Message",method=RequestMethod.GET)
	public String Message() {
		return "mypage/Message";
	}
	@RequestMapping(value="/Boardtext",method=RequestMethod.GET)
	public String Boardtext() {
		return "mypage/Boardtext";
	}
	@RequestMapping(value="/Point",method=RequestMethod.GET)
	public String Point() {
		return "mypage/Point";
		
	}
	@RequestMapping(value="/Purchase_history_Movie",method=RequestMethod.GET)
	public String Purchase_history_Movie() {
		return "mypage/Purchase_history_Movie";
		
	}
	@RequestMapping(value="/Purchase_history_Food",method=RequestMethod.GET)
	public String Purchase_history_Food() {
		return "mypage/Purchase_history_Food";
		
	}
}
