package com.kh.projectMovie01.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.service.NoticeBoardService;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.NoticeBoardVo;

@Controller
@RequestMapping(value="/noticeBoard")
public class NoticeBoardController {
	
	@Inject
	private NoticeBoardService noticeBoardService;

	
	@RequestMapping(value = "/noticeBoardPage", method = RequestMethod.GET)
	public String noticeBoardPage(Model model) { 
		List<NoticeBoardVo> list = noticeBoardService.noticeBoardPage();
		model.addAttribute("list", list);
		return "board/noticeBoardPage"; 
	}
	
	@RequestMapping(value = "/noticeBoardContentPage", method = RequestMethod.GET)
	public String noticeBoardContentPage() { 
		return "noticeBoard/noticeBoardContentPage"; 
	}

	
}
