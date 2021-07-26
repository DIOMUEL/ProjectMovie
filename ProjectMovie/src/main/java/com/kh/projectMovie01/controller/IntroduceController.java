package com.kh.projectMovie01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/introduce")
public class IntroduceController {
	
	@RequestMapping(value="/introduce1",method=RequestMethod.GET)
	public String introduce1() throws Exception{
		return "introduce/introduce1";
	}
	@RequestMapping(value="/introduce2",method=RequestMethod.GET)
	public String introduce2() throws Exception{
		return "introduce/introduce2";
	}
	@RequestMapping(value="/introduce3",method=RequestMethod.GET)
	public String introduce3() throws Exception{
		return "introduce/introduce3";
	}
	@RequestMapping(value="/introduce4",method=RequestMethod.GET)
	public String introduce4() throws Exception{
		return "introduce/introduce4";
	}
}
