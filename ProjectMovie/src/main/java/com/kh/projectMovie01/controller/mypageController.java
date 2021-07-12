package com.kh.projectMovie01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/mypage")
public class mypageController {
	
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
	@RequestMapping(value="/Ticketing",method=RequestMethod.GET)
	public String Ticketing() {
		return "mypage/Ticketing";
		
	}
}
