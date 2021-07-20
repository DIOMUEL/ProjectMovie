package com.kh.projectMovie01.controller;

import java.util.List;
import java.util.logging.Logger;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.BuyMovieService;
import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.service.MessageService;
import com.kh.projectMovie01.vo.BuyMovieVo;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.MessageVo;
import com.kh.projectMovie01.vo.NoticeBoardVo;

@Controller
@RequestMapping(value="/mypage")
public class mypageController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BuyMovieService buyMovieService;

	@Inject
	private MessageService messageService;
	
	@RequestMapping(value="/management",method=RequestMethod.GET)
	public String management(Model model, HttpSession session) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//		System.out.println("memberVo:" + memberVo);
		model.addAttribute("memberVo",memberVo);
	
		return "mypage/management";	
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
	
	
	@RequestMapping(value="/boardtext",method=RequestMethod.GET)
	public String Boardtext() throws Exception{
		return "mypage/boardtext";
	}
	@RequestMapping(value="/point",method=RequestMethod.GET)
	public String Point() throws Exception{
		return "mypage/point";
		
	}
	@RequestMapping(value="/purchase_History_Movie",method=RequestMethod.GET)
	public String purchase_History_Movie(Model model,HttpSession session) throws Exception{	
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		List<BuyMovieVo> list = buyMovieService.buyMovieList(user_id);
		model.addAttribute("list", list);
		return "mypage/purchase_History_Movie";
		
	}	
		
	@RequestMapping(value="/message" , method=RequestMethod.GET)
	public String message(Model model, HttpSession session) throws Exception {
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		System.out.println("user_id : " + user_id);

		// 받은 메시지함
		List<MessageVo> receive_MessageList = messageService.receive_MessageList(user_id);
		model.addAttribute("receive_MessageList" , receive_MessageList);
		System.out.println(receive_MessageList);
		// 보낸 메시지함
		List<MessageVo> send_MessageList = messageService.send_MessageList(user_id);
		model.addAttribute("send_MessageList" , send_MessageList);
		
	
		return "mypage/message";
	}
	
	@RequestMapping(value="/purchase_History_Food",method=RequestMethod.GET)
	public String purchase_History_Food() {
		return "mypage/purchase_History_Food";
		
	}
}
