package com.kh.projectMovie01.controller;

import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.vo.MemberVo;

@Controller
@RequestMapping(value="/mypage")
public class mypageController {
	
	@Inject
	private MemberService memberService;
	

	@RequestMapping(value="/Management",method=RequestMethod.GET)
	public String Management(Model model, HttpSession session) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//		System.out.println("memberVo:" + memberVo);
		model.addAttribute("memberVo",memberVo);
	
		return "mypage/Management";	
	}
	
	@RequestMapping(value="/Message",method=RequestMethod.GET)
	public String Message() throws Exception{
		return "mypage/Message";
	}
	@RequestMapping(value="/Boardtext",method=RequestMethod.GET)
	public String Boardtext() throws Exception{
		return "mypage/Boardtext";
	}
	@RequestMapping(value="/Point",method=RequestMethod.GET)
	public String Point() throws Exception{
		return "mypage/Point";
		
	}
	@RequestMapping(value="/Purchase_history_Movie",method=RequestMethod.GET)
	public String Purchase_history_Movie() throws Exception{
		return "mypage/Purchase_history_Movie";
		
	}
	@RequestMapping(value="/Purchase_history_Food",method=RequestMethod.GET)
	public String Purchase_history_Food() {
		return "mypage/Purchase_history_Food";
		
	}
}
