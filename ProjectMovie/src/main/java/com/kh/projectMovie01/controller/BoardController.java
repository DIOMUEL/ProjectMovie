package com.kh.projectMovie01.controller;

import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.dao.Admin_MovieDao;
import com.kh.projectMovie01.service.Admin_AreaService;
import com.kh.projectMovie01.service.Admin_MovieService;
import com.kh.projectMovie01.service.MemberService;
import com.kh.projectMovie01.service.NoticeBoardService;
import com.kh.projectMovie01.service.NoticeMessageService;
import com.kh.projectMovie01.vo.AreaVo;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.MovieVo;
import com.kh.projectMovie01.vo.NoticeBoardVo;
import com.kh.projectMovie01.vo.NoticeMessageVo;
import com.kh.projectMovie01.vo.PagingDto;

@Controller
@RequestMapping(value="/board")
public class BoardController {

	@Inject
	private MemberService memberService;
	@Inject
	private NoticeBoardService noticeBoardService;
	@Inject
	private NoticeMessageService noticeMessageService;
	@Inject
	private Admin_MovieService admin_MovieService;
	@Inject
	private Admin_AreaService admin_AreaService;
	@RequestMapping(value = "/mainPage", method = RequestMethod.GET) 
	public String mainPage() { 
		return "board/mainPage"; 
	}

	@RequestMapping(value = "/loginPage", method = RequestMethod.GET)
	public String loginPage() {
		return "board/loginPage"; 
	}
	@RequestMapping(value = "/loginRun", method = RequestMethod.POST)
	public String loginRun(String user_id, String user_pw, HttpSession session, RedirectAttributes rttr) { 
		MemberVo memberVo = memberService.loginMember(user_id, user_pw);
		//System.out.println("memberVo: "+ memberVo);
		String msg = null; 
		String page = null;
		if(memberVo != null) {
			String user_name = memberVo.getUser_name();
			if(user_name.equals("admin")) {
				int notReadCount = noticeMessageService.notReadCount(user_id);
				memberVo.setNotReadCount(notReadCount);
				session.setAttribute("loginVo", memberVo);
				rttr.addFlashAttribute("user_name", user_name);
				msg = "success";
				page = "redirect:/administerPage/administerMainPage";
			}else if(!user_name.equals("admin")) {
				int notReadCount = noticeMessageService.notReadCount(user_id);
				memberVo.setNotReadCount(notReadCount);
				session.setAttribute("loginVo", memberVo);
				rttr.addFlashAttribute("user_name", user_name);
				msg = "success";
				page = "redirect:/board/mainPage";
			}
		}else if (memberVo == null) {
			msg = "fail";
			page = "redirect:/board/loginPage";
		}
		rttr.addFlashAttribute("msgLoginMember", msg);
		return page;
	}
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		session.invalidate();
		return "redirect:/board/loginPage";
	}

	@RequestMapping(value = "/noticeBoardPage", method = RequestMethod.GET)
	public String noticeBoardPage(Model model, PagingDto pagingDto) {
		//MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		//String user_id = memberVo.getUser_id();
		int count = noticeBoardService.getCount(pagingDto);
		pagingDto.setCount(count);
		List<NoticeBoardVo> list = noticeBoardService.noticeBoardPage(pagingDto);
		//model.addAttribute("user_id", user_id);
		model.addAttribute("list", list);
		model.addAttribute("pagingDto", pagingDto);
		//System.out.println(list);
		
		List<NoticeBoardVo> headList = noticeBoardService.noticeBoardHeadList(pagingDto);
		model.addAttribute("headList", headList);
		
		List<NoticeBoardVo> branchList = noticeBoardService.noticeBoardBranchList(pagingDto);
		model.addAttribute("branchList", branchList);
		
		return "board/noticeBoardPage"; 
	}
	//???????????????
	@RequestMapping(value = "/ticketingPage", method = RequestMethod.GET)
	public String ticketingPage(Model model) { 
		List<MovieVo> movieList = admin_MovieService.nameListAll();
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		model.addAttribute("movieList", movieList);
		return "board/ticketingPage"; 
	}
	@RequestMapping(value = "/reserveResult", method = RequestMethod.GET)
	public String reserveResult() { 
		return "board/reserveResult"; 
	}

	@RequestMapping(value = "/registForm", method = RequestMethod.GET)
	public String registForm() {
		return "board/registForm";
	}
	
	@RequestMapping(value="/checkDupId", method=RequestMethod.GET)
	@ResponseBody
	public String checkDupId(String user_id)  throws Exception{
		boolean result = memberService.checkDupId(user_id);
		return String.valueOf(result);
	}

	@RequestMapping(value = "/registRun", method = RequestMethod.POST)
	public String registRun(MemberVo memberVo, HttpSession session) { 
		memberService.insertMember(memberVo);
		session.setAttribute("msgInsertMember", "success");
		return "redirect:/board/loginPage"; 
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String imsiPage(Locale locale, Model model) {
		return "/board/imsi";
	}
}
