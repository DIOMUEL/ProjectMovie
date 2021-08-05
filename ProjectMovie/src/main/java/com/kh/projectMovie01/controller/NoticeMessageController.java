package com.kh.projectMovie01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.NoticeMessageService;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.NoticeMessageVo;

@Controller
@RequestMapping(value="/noticeMessage")
public class NoticeMessageController {
	
	@Inject
	private NoticeMessageService noticeMessageService;
	
	//쪽지보내기
	@RequestMapping(value="/sendMessage", method=RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestBody NoticeMessageVo noticeMessageVo, HttpSession session)throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		noticeMessageVo.setMsg_sender(memberVo.getUser_id());
		noticeMessageService.sendMessage(noticeMessageVo);
		return "success";
	}
	
	    //안읽은 메시지 
		@RequestMapping(value="/messageListNotRead", method=RequestMethod.GET)
		@ResponseBody
		public List<NoticeMessageVo> messageListNotRead(HttpSession session) throws Exception {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			List<NoticeMessageVo> list = noticeMessageService.messageListNotRead(memberVo.getUser_id());
			return list;
		}
	
		//메시지목록
		@RequestMapping(value="/messageList", method=RequestMethod.GET)
		public String messageListReceive(HttpSession session, Model model) throws Exception {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			
			List<NoticeMessageVo> receiveList = noticeMessageService.messageListReceive(user_id);
			model.addAttribute("receiveList", receiveList);
			
			List<NoticeMessageVo> sendList = noticeMessageService.messageListSend(user_id);
			model.addAttribute("sendList", sendList);
			
			List<NoticeMessageVo> selfList = noticeMessageService.messageListSelf(user_id, user_id);
			model.addAttribute("selfList", selfList);
			
			return "mypage/message";
		}
		
		
		
		// 받은 메시지 목록
//		@RequestMapping(value="/messageListReceive", method=RequestMethod.GET)
//		public String messageListReceive(HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String msg_receiver = memberVo.getUser_id();
//			List<NoticeMessageVo> receiveList = noticeMessageService.messageListReceive(msg_receiver);
//			model.addAttribute("receiveList", receiveList);
//			return "mypage/message";
//		}
		
		// 보낸 메시지 목록
//		@RequestMapping(value="/messageListSend", method=RequestMethod.GET)
//		public String messageListSend(HttpSession session, Model model) throws Exception {
//			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//			String msg_sender= memberVo.getUser_id();
//			List<NoticeMessageVo> sendList = noticeMessageService.messageListSend(msg_sender);
//			model.addAttribute("sendList", sendList);
//			return "mypage/message";
//		}
	
		
		// 쪽지 읽기
		@RequestMapping(value= "/messageRead", method=RequestMethod.GET)
		public String messageRead(int msg_no, HttpSession session, Model model) throws Exception {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			NoticeMessageVo noticeMessageVo = noticeMessageService.messageRead(msg_no);
			model.addAttribute("noticeMessageVo", noticeMessageVo);
			int notReadCount = noticeMessageService.notReadCount(user_id);
			//int user_point = memberService.getUserPoint(user_id);
			memberVo.setNotReadCount(notReadCount);
			//memberVo.setUser_point(user_point);
			model.addAttribute("user_id", user_id);
			return "mypage/messageRead";
		}
		
		
		// 쪽지 삭제
		@RequestMapping(value = "/deleteMessage", method=RequestMethod.GET)
		public String deleteMessage(int msg_no, HttpSession session,RedirectAttributes rttr) throws Exception {
			MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
			String user_id = memberVo.getUser_id();
			boolean result = noticeMessageService.deleteMessage(msg_no, user_id);
			rttr.addFlashAttribute("msg_delete", String.valueOf(result));
			return "redirect:/noticeMessage/messageList";
		}
		
}