package com.kh.projectMovie01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.Admin_AreaService;
import com.kh.projectMovie01.service.Admin_MovieService;
import com.kh.projectMovie01.service.ChartService;
import com.kh.projectMovie01.vo.ChartPieVo;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieVo;
import com.kh.projectMovie01.vo.Admin_PageingDto;
import com.kh.projectMovie01.vo.AreaTheaterVo;
import com.kh.projectMovie01.vo.AreaVo;

@Controller
@RequestMapping(value="/administerPage")
public class AdminController {
	
	@Inject
	private ChartService chartService;
	@Inject
	private Admin_MovieService admin_MovieService;
	@Inject
	private Admin_AreaService admin_AreaService;
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
	//영화 등록리스트
	@RequestMapping(value="/administerMovieListPage", method = RequestMethod.GET)
	public String movie_list(Model model, Admin_PageingDto admin_PageingDto) throws Exception {
		int count = admin_MovieService.getCountMovie(admin_PageingDto);
		//System.out.println("count :"+ count);
		admin_PageingDto.setTotalCount(count);
		List<MovieVo> movieVo = admin_MovieService.listAll(admin_PageingDto);
		//System.out.println("movieVo"+ movieVo);
		model.addAttribute("movieVo", movieVo);
		model.addAttribute("admin_PageingDto", admin_PageingDto);
		return "/administerPage/administerMovieListPage";
	}
	//영화 등록페이지
	@RequestMapping(value="/administerMovieRegistPage", method = RequestMethod.GET)
	public String administerMovieRegistPage() throws Exception {
		return "/administerPage/administerMovieRegistPage";
	}
	//영화등록실행
	@RequestMapping(value="/administerMovieRegistRun", method = RequestMethod.POST)
	public String administerMovieRegistRun(MovieVo movieVo, RedirectAttributes rttr)throws Exception {
		//System.out.println("MovieVo"+ movieVo);
		admin_MovieService.administerMovieRegistRun(movieVo);
		rttr.addFlashAttribute("msgRegist", "success");
		return "redirect:/administerPage/administerMovieListPage";
	}
	//영화상세보기
	@RequestMapping(value="/administerMovieSelectByMovie", method = RequestMethod.GET)
	public String selectByMovie(String movie_code, Model model) throws Exception {
		//영화 정보(부사진 제외)
		MovieVo movieVo = admin_MovieService.selectByMovie(movie_code);
		//System.out.println("MovieVo"+ movieVo);
		//부사진 정보
		List<MovieImageVo> movieImageVo = admin_MovieService.selectByMovieSubImage(movie_code);
		model.addAttribute("movieImageVo", movieImageVo);
		model.addAttribute("movieVo", movieVo);
		return "/administerPage/administerMovieSelectByMovie";
	}
	//영화 수정하기
	@RequestMapping(value="/administerMovieModifyRun", method = RequestMethod.POST)
	public String administerMovieModifyRun(MovieVo movieVo, RedirectAttributes rttr) throws Exception {
		System.out.println("movieVo"+ movieVo);
		String movie_code = movieVo.getMovie_code();
		admin_MovieService.movieModify(movieVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/administerPage/administerMovieSelectByMovie?movie_code=" + movie_code;
	}
	//삭제하기
	@RequestMapping(value="/administerMovieDeleteRun", method = RequestMethod.GET)
	public String administerMovieDeleteRun(String movie_code, RedirectAttributes rttr) throws Exception {
		System.out.println("movie_code"+ movie_code);
		admin_MovieService.deleteMovie(movie_code);
		rttr.addFlashAttribute("msgDelete", "success");
		return "redirect:/administerPage/administerMovieListPage";
	}
	// --------------- 영화 등록및 조회 삭제 End-----------------------
	// --------------- 영화관 지역 관리 -----------------------
	//지역관리페이지
	@RequestMapping(value="/administerMovieAreaManagement", method = RequestMethod.GET)
	public String administerMovieAreaManagement(Model model) throws Exception {
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		return "/administerPage/administerMovieAreaManagement";
	}
	//지역등록실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaRegistRun", method = RequestMethod.GET)
	public String administerMovieAreaRegist(String area_name, RedirectAttributes rttr) throws Exception {
		admin_AreaService.movieAreaAdd(area_name);
		rttr.addFlashAttribute("msgAreaInsert", "success");
		return "redirect:/administerPage/administerMovieAreaManagement";
	}
	//지역수정실행/ 후 리스트로 생성 및 활성화
	//지역삭제실행/ 후 리스트로 생성 및 활성화
	
	//지역영화관리스트 활성화
	@RequestMapping(value="/administerMovieAreaTheaterList", method = RequestMethod.GET)
	@ResponseBody
	public List<AreaTheaterVo> administerMovieAreaTheaterList(int area_no) throws Exception {
		List<AreaTheaterVo> areaTheaterVo = admin_AreaService.getAllAreaTheaterList(area_no);
		return areaTheaterVo;
	}
	//지역영화관등록실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaTheaterRegistRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterRegist(int area_no, String area_theater_name) throws Exception {
		admin_AreaService.areaTheaterAdd(area_no, area_theater_name);
		return "success";
	}
}
