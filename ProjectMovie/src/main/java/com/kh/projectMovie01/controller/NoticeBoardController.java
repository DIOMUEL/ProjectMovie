package com.kh.projectMovie01.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.service.NoticeBoardService;
import com.kh.projectMovie01.vo.CommentVo;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.PagingDto;

@Controller
@RequestMapping(value="/noticeBoard")
public class NoticeBoardController {
	
	@Inject
	private NoticeBoardService noticeBoardService;
	
	@RequestMapping(value = "/noticeBoardContentPage", method = RequestMethod.GET)
	public String noticeBoardContentPage(
			@ModelAttribute("pagingDto") PagingDto pagingDto, Model model, int b_no) {
		NoticeBoardVo noticeBoardVo = noticeBoardService.noticeBoardContentPage(b_no);
		model.addAttribute(noticeBoardVo);
		return "noticeBoard/noticeBoardContentPage"; 
	}
	
	@RequestMapping(value = "/noticeBoardWritePage", method = RequestMethod.GET)
	public String noticeBoardWirtePage(){
		return "noticeBoard/noticeBoardWritePage"; 
	}
	
	@RequestMapping(value = "/noticeBoardWriteRun", method = RequestMethod.POST)
	public String noticeBoardWirteRun(NoticeBoardVo noticeBoardVo, HttpSession session) {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		noticeBoardVo.setUser_id(memberVo.getUser_id());
		noticeBoardService.noticeBoardWirteRun(noticeBoardVo);
		return "redirect:/board/noticeBoardPage"; 
	}
	
	@RequestMapping(value = "/noticeBoardModifyRun", method = RequestMethod.POST)
	public String noticeBoardModifyRun(NoticeBoardVo noticeBoardVo) {
		noticeBoardService.noticeBoardModifyRun(noticeBoardVo);
		return "redirect:/board/noticeBoardPage?b_no=" + noticeBoardVo.getB_no();
	}

	@RequestMapping(value = "/noticeBoardDeleteRun", method = RequestMethod.GET)
	public String noticeBoardDeleteRun(int b_no) {
		noticeBoardService.noticeBoardDeleteRun(b_no);
		return "redirect:/board/noticeBoardPage"; 
	}
	
//	//내가쓴게시물
//	@RequestMapping(value = "/myNoticeBoard", method = RequestMethod.GET)
//	@ResponseBody
//	public String myNoticeBoard(@RequestBody NoticeBoardVo noticeBoardVo, HttpSession session, Model model){
//		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
//		noticeBoardVo.setUser_id(memberVo.getUser_id());
//		List<NoticeBoardVo> list = noticeBoardService.myNoticeBoard(noticeBoardVo);
//		model.addAttribute("list", list);
//		return "/mypage";
//	}
	
	
}
