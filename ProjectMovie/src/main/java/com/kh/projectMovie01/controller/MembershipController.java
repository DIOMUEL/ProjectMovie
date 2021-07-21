package com.kh.projectMovie01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/membership")
public class MembershipController {
	
	@RequestMapping(value = "/membershipPage", method = RequestMethod.GET)
	public String point() throws Exception{
		return "membership/membershipPage";
	} 
	
//	@RequestMapping(value = "/discount", method = RequestMethod.GET)
//	public String discount() throws Exception{
//		return "membership/discount";
//	} 
//	
//	@RequestMapping(value = "/membership", method = RequestMethod.GET)
//	public String membership() throws Exception{
//		return "membership/membership";
//	} 
//	
//	@RequestMapping(value = "/vip", method = RequestMethod.GET)
//	public String vip() throws Exception{
//		return "membership/vip";
//	} 

}
