package com.kh.projectMovie01.controller;

import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.BuyMovieService;
import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.vo.BuyMovieVo;
import com.kh.projectMovie01.vo.MemberVo;

@Controller
@RequestMapping(value="/mypage")
public class mypageController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BuyMovieService buyMovieService;

	@RequestMapping(value="/Management",method=RequestMethod.GET)
	public String Management(Model model, HttpSession session) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//		System.out.println("memberVo:" + memberVo);
		model.addAttribute("memberVo",memberVo);
	
		return "mypage/Management";	
	}
	
	@RequestMapping(value="/ChangePw",method=RequestMethod.POST)
	@ResponseBody
	public String ChangePw(HttpSession session, String user_pw) throws Exception{
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
//		System.out.println("user_id:" + user_id);
//		System.out.println("user_pw:" + user_pw);
		
		memberService.changePw(user_id,user_pw);	
		return "success";
	}
	
	@RequestMapping(value="/ChangeEmail",method=RequestMethod.POST)
	@ResponseBody
	public String ChangeEmail(HttpSession session,String user_email) throws Exception{
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		System.out.println("user_email:"+user_email);
		memberService.changeEmail(user_id, user_email);
		return "success";
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
	public String Purchase_history_Movie(/*Model model,int bm_no*/) throws Exception{
//		
//		BuyMovieVo buyMovieVo = buyMovieService.selectByid(bm_no);
//		model.addAttribute(buyMovieVo);
		return "mypage/Purchase_history_Movie";
		
	}
	@RequestMapping(value="/Purchase_history_Food",method=RequestMethod.GET)
	public String Purchase_history_Food() {
		return "mypage/Purchase_history_Food";
		
	}
}
