package com.kh.projectMovie01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.projectMovie01.service.LikeService;
import com.kh.projectMovie01.vo.LikeVo;
import com.kh.projectMovie01.vo.MemberVo;

@Controller
@RequestMapping("/like")
public class LikeController {
	@Inject
	private LikeService likeService;

	@RequestMapping(value="/sendLike", method=RequestMethod.GET)
	@ResponseBody
	public String sendLike(int b_no, HttpSession session) throws Exception {
		System.out.println("b_no:" + b_no);
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		System.out.println("user_id:" + user_id);
		LikeVo likeVo = new LikeVo(user_id, b_no);
		likeService.sendLike(likeVo);
		int likeCount = getLikeCount(b_no);
		return String.valueOf(likeCount);
	}
	
	@RequestMapping(value="/sendLikeCancel", method=RequestMethod.GET)
	@ResponseBody
	public String sendLikeCancel(int b_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		LikeVo likeVo = new LikeVo(user_id, b_no);
		likeService.sendLikeCancel(likeVo);
		int likeCount = getLikeCount(b_no);
		return String.valueOf(likeCount);
	}
	
	private int getLikeCount(int b_no) {
		return likeService.likeCount(b_no);
	}

}
