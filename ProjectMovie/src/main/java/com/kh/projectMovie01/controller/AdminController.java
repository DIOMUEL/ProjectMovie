package com.kh.projectMovie01.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.projectMovie01.service.ChartService;
import com.kh.projectMovie01.vo.ChartPieVo;
import com.kh.projectMovie01.vo.admin_movie_list_Dto;

@Controller
@RequestMapping(value="/administerPage")
public class AdminController {
	
	@Inject
	private ChartService chartService;
	//메인 페이지로 왔을때 차트 값 디비에서 받아오기
	@RequestMapping(value="/administerMainPage", method=RequestMethod.GET)
	public String administerMainPage(HttpSession session, Model model) {
		//원형 그래프 차트 원료
		ChartPieVo chartPieVo = chartService.chartPie20();
		int label_rate20 = chartPieVo.getLabel_rate();
		ChartPieVo chartPieVo1 = chartService.chartPie30();
		int label_rate30 = chartPieVo1.getLabel_rate();
		ChartPieVo chartPieVo2 = chartService.chartPie40();
		int label_rate40 = chartPieVo2.getLabel_rate();
		ChartPieVo chartPieVo3 = chartService.chartPie50();
		int label_rate50 = chartPieVo3.getLabel_rate();
		ChartPieVo chartPieVo4 = chartService.chartPie60();
		int label_rate60 = chartPieVo4.getLabel_rate();
		model.addAttribute("label_rate20", label_rate20);
		model.addAttribute("label_rate30", label_rate30);
		model.addAttribute("label_rate40", label_rate40);
		model.addAttribute("label_rate50", label_rate50);
		model.addAttribute("label_rate60", label_rate60);
		return "/administerPage/administerMainPage";
	}
	//여기서부터는 왼쪽 목록에서 가는 것
	@RequestMapping(value="/totalMovieChart", method=RequestMethod.GET)
	public String totalMovieChart(HttpSession session, Model model) {
		return "/administerPage/totalMovieChart";
	}
	// --------------- 영화 등록및 조회 삭제 -----------------------
	@RequestMapping(value="/administerMovieListPage", method = RequestMethod.GET)
	public String movie_list(Model model, admin_movie_list_Dto admin_movie_list_Dto) throws Exception {
		admin_movie_list_Dto.setPerPage(5);
		admin_movie_list_Dto.setPageInfo();
//		int count = jmhMovieService.getCountMovie(admin_movie_list_Dto);
//		jmhPagingDto.setTotalCount(count);
//		List<JmhMovieVo> jmhMovieVo = jmhMovieService.moviePagingList(jmhPagingDto);
//		model.addAttribute("jmhMovieVo", jmhMovieVo);
		model.addAttribute("admin_movie_list_Dto", admin_movie_list_Dto);
		return "/administerPage/administerMovieListPage";
	}
	
	@RequestMapping(value="/administerMovieRegistPage", method = RequestMethod.GET)
	public String administerMovieRegistPage() throws Exception {
		return "/administerPage/administerMovieRegistPage";
	}
//	
//	@RequestMapping(value="/admin_movie_register", method = RequestMethod.POST)
//	public String movie_registerPost(JmhMovieVo jmhMovieVo,RedirectAttributes rttr )throws Exception {
//		jmhMovieService.movieRegister(jmhMovieVo);
//		
//		rttr.addFlashAttribute("msg", "success");
//		return "redirect:/admin/admin_movie_list";
//	}
//	
//	@RequestMapping(value="/admin_movie_selectByMovie", method = RequestMethod.GET)
//	public String selectByMovie(String movie_code, Model model) throws Exception {
//		JmhMovieVo jmhMovieVo = jmhMovieService.selectByMovie(movie_code);
//		List<JmhMovieImageVo> jmhMovieImageVo = jmhMovieService.selectByMovieSubImage(movie_code);
//		model.addAttribute("jmhMovieImageVo", jmhMovieImageVo);
//		model.addAttribute("jmhMovieVo", jmhMovieVo);
//		return "/admin/admin_movie_selectByMovie";
//	}
//	
//	// �쁺�솕 �닔�젙
//	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.GET)
//	public String movie_modify(String movie_code, Model model) throws Exception {
//		JmhMovieVo jmhMovieVo = jmhMovieService.selectByMovie(movie_code);
//		List<JmhMovieImageVo> jmhMovieImageVo = jmhMovieService.selectByMovieSubImage(movie_code);
//		model.addAttribute("jmhMovieImageVo", jmhMovieImageVo);
//		model.addAttribute("jmhMovieVo", jmhMovieVo);
//		return "/admin/admin_movie_modify";
//	}
//	
//	@RequestMapping(value="/admin_movie_modify", method = RequestMethod.POST)
//	public String movie_modifyPost(JmhMovieVo jmhMovieVo) throws Exception {
//		String movie_code = jmhMovieVo.getMovie_code();
//		jmhMovieService.movieModify(jmhMovieVo);
//		return "redirect:/admin/admin_movie_selectByMovie?movie_code=" + movie_code;
//	}
	// --------------- 영화 등록및 조회 삭제 End-----------------------
}
