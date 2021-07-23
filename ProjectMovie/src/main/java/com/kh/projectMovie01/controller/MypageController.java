package com.kh.projectMovie01.controller;

import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.BuyMovieService;
import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.service.MessageService;
import com.kh.projectMovie01.service.NoticeBoardService;
import com.kh.projectMovie01.vo.BuyMovieVo;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.MessageVo;
import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

@Controller
@RequestMapping(value="/mypage")
public class MypageController {
	
	@Inject
	private MemberService memberService;
	
	@Inject
	private BuyMovieService buyMovieService;

	@Inject
	private MessageService messageService;
	
	@Inject
	private NoticeBoardService noticeBoardService;
	
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
		//System.out.println("user_email:"+user_email);
		memberService.changeEmail(user_id, user_email);
		return "success";
	}
	@RequestMapping(value = "/boardtext", method = RequestMethod.GET)
	public String boardtext(@ModelAttribute("pagingDto") PagingDto pagingDto,
			NoticeBoardVo noticeBoardVo, HttpSession session, Model model){
		int count = noticeBoardService.getCount(pagingDto);
		pagingDto.setCount(count);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		List<NoticeBoardVo> list = noticeBoardService.myNoticeBoard(user_id, pagingDto);
		model.addAttribute("list", list);
		return "mypage/boardtext";
	}
	

	@RequestMapping(value="/point",method=RequestMethod.GET)
	public String point() throws Exception{
		return "mypage/point";
		
	}
	@RequestMapping(value="/purchase_history_movie",method=RequestMethod.GET)
	public String purchase_history_movie(Model model,HttpSession session) throws Exception{	
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		List<BuyMovieVo> list = buyMovieService.buyMovieList(user_id);
		model.addAttribute("list", list);
		return "mypage/purchase_history_movie";
		
	}	
	
	@RequestMapping(value="/message_receiver_content",method=RequestMethod.GET)
	public String message_receiver_content(Model model, HttpSession session,int msg_no) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute(
				"loginVo");
		String user_id = memberVo.getUser_id();
		MessageVo messageVo = messageService.messageRead(
				msg_no, user_id);
		model.addAttribute("messageVo", messageVo);
		
		
		return "mypage/message_receiver_content";
	}
	
	@RequestMapping(value="/message_send_content",method=RequestMethod.GET)
	public String message_send_content(Model model, HttpSession session,int msg_no) throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute(
				"loginVo");
		String user_id = memberVo.getUser_id();
		MessageVo messageVo = messageService.messageRead(
				msg_no, user_id);
		model.addAttribute("messageVo", messageVo);
		
		return "mypage/message_send_content";
	}
	
	
	@RequestMapping(value="/message" , method=RequestMethod.GET)
	public String message(@ModelAttribute("pagingDto") PagingDto pagingDto,Model model, HttpSession session) throws Exception {
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		//System.out.println("user_id : " + user_id);

		
		List<MessageVo> receive_MessageList = messageService.receive_MessageList(user_id);
		model.addAttribute("receive_MessageList" , receive_MessageList);
		System.out.println(receive_MessageList);
		
		List<MessageVo> send_MessageList = messageService.send_MessageList(user_id);
		model.addAttribute("send_MessageList" , send_MessageList);
		
	
		return "mypage/message";
	}
	
	@RequestMapping(value="/sendMessage", method=RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestBody MessageVo messageVo,
			HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		messageVo.setMsg_receiver(memberVo.getUser_id());
		System.out.println("messageVo:" + messageVo);
		messageService.sendMessage(messageVo);
		return "success";
	}
	@RequestMapping(value = "/deleteMessage", method=RequestMethod.GET)
	public String deleteMessage(int msg_no, HttpSession session,
			RedirectAttributes rttr) throws Exception {
		MemberVo memberVo = 
				(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		boolean result = messageService.deleteMessage(msg_no, user_id);
		rttr.addFlashAttribute("msg_delete", String.valueOf(result));
		return "redirect:/mypage/message";
	}
	@RequestMapping(value="/message_send",method=RequestMethod.GET)
	public String message_send() {
		return "mypage/message_send";
	}
	@RequestMapping(value="/inquiry_list",method=RequestMethod.GET)
	public String inquiry_list() {
		return "mypage/inquiry_list";
	}
	
	
	@RequestMapping(value="/purchase_history_food",method=RequestMethod.GET)
	public String purchase_history_food() {
		return "mypage/purchase_history_food";
		
	}
}
