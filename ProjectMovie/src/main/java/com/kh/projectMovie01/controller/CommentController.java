package com.kh.projectMovie01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.projectMovie01.service.CommentService;
import com.kh.projectMovie01.vo.CommentVo;
import com.kh.projectMovie01.vo.MemberVo;

@RestController
@RequestMapping(value = "/commentBoard")
public class CommentController {

	@Inject
	private CommentService commentService;
	
	@RequestMapping(value = "/getCommentList/{b_no}", method = RequestMethod.GET)
	public List<CommentVo> getCommentList(@PathVariable("b_no") int b_no) {
		List<CommentVo> list = commentService.getCommentList(b_no);
		return list;
	}
	

	@RequestMapping(value="/insertComment", method=RequestMethod.POST)
	public String insertComment(@RequestBody CommentVo commentVo,
			HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		commentVo.setUser_id(memberVo.getUser_id());
		//System.out.println(commentVo);
		commentService.insertComment(commentVo);
		return "success";
	}
	
	@RequestMapping(value="/updateComment", method=RequestMethod.POST)
	public String updateComment(@RequestBody CommentVo commentVo) throws Exception {
		//System.out.println(commentVo);
		commentService.updateComment(commentVo);
		return "success";
	}
	
	@RequestMapping(value="/deleteComment/{c_no}/{b_no}", method=RequestMethod.GET)
	public String deleteComment(@PathVariable("c_no") int c_no, @PathVariable("b_no") int b_no) throws Exception {
		//System.out.println("c_no:" + c_no);
		commentService.deleteComment(c_no, b_no);
		return "success";
	}
	
}
