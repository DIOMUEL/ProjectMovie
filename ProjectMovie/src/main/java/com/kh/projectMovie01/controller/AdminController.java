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
import com.kh.projectMovie01.service.Admin_StoreService;
import com.kh.projectMovie01.service.ChartService;
import com.kh.projectMovie01.vo.ChartPieVo;
import com.kh.projectMovie01.vo.FoodVo;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieVo;
import com.kh.projectMovie01.vo.TheaterSeatVo;
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
	@Inject
	private Admin_StoreService admin_StoreService;
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
//지역명 	
	//지역등록실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaRegistRun", method = RequestMethod.GET)
	public String administerMovieAreaRegist(String area_name, RedirectAttributes rttr) throws Exception {
		admin_AreaService.movieAreaAdd(area_name);
		rttr.addFlashAttribute("msgAreaInsert", "success");
		return "redirect:/administerPage/administerMovieAreaManagement";
	}
	//지역수정실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaModify(int area_no, String area_name) throws Exception {
		admin_AreaService.movieAreaModify(area_no, area_name);
		return "success";
	}
	//지역삭제실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaDeleteRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaDelete(int area_no){
		try {
			admin_AreaService.movieAreaDelete(area_no);
		} catch (Exception e) {
			return "false";
		}
		return "success";
	}
//지역 영화관	
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
	//지역영화관수정실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaTheaterModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterModify(int area_theater_no, String area_theater_name) throws Exception {
		admin_AreaService.areaTheaterModify(area_theater_no, area_theater_name);
		return "success";
	}
	//지역삭제실행/ 후 리스트로 생성 및 활성화
	@RequestMapping(value="/administerMovieAreaTheaterDeleteRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterDelete(int area_theater_no) throws Exception {
		admin_AreaService.areaTheaterDelete(area_theater_no);
		return "success";
	}
	// --------------- 영화관 지역 관리  END-----------------------
	// --------------- 영화관 좌석 및 영화관 관 관리 -----------------------
	// 싯팅페이지 입장시 필요 자원 호출(지역)
	@RequestMapping(value="/administerMovieTheaterSeatSetting", method = RequestMethod.GET)
	public String administerMovieTheaterSeatSetting(Model model) throws Exception {
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		return "/administerPage/administerMovieTheaterSeatSetting";
	}
	// 지역세팅시 필요 자원 호출(지역 > 영화관)
	@RequestMapping(value="/seatSetting_callingTheater", method = RequestMethod.GET)
	@ResponseBody
	public List<AreaTheaterVo> callingTheater(int area_no, Model model) throws Exception {
		List<AreaTheaterVo> areaTheaterVo = null;
		if(area_no != 0) {
			areaTheaterVo = admin_AreaService.getAllAreaTheaterList(area_no);
			//System.out.println("areaTheaterVo : "+ areaTheaterVo);
		}
		return areaTheaterVo;
	}
	// 조회 버튼 누를시 그 영화관안에 들어있는 관 리스트 호출
	@RequestMapping(value="/callingTheaterRoomList", method = RequestMethod.GET)
	@ResponseBody
	public List<TheaterSeatVo> callingTheaterRoomList(int area_theater_no, Model model) throws Exception {
		List<TheaterSeatVo> areaTheaterVo = admin_AreaService.getSeveralTheaterSeatList(area_theater_no);
		return areaTheaterVo;
	}
	// 영화관 좌석 등록하기
	@RequestMapping(value="/seatSettingRegist", method = RequestMethod.GET)
	public String seatSettingRegist(int area_theater_no, String theater_name, int theater_seatNum, RedirectAttributes rttr) throws Exception {
		admin_AreaService.seatSettingRegist(area_theater_no, theater_name, theater_seatNum);
		rttr.addFlashAttribute("msgSittingRegist", "success");
		return "redirect:/administerPage/administerMovieTheaterSeatSetting";
	}
	//영화관 좌석 수정하기
	@RequestMapping(value="/seatSettingModify", method = RequestMethod.GET)
	@ResponseBody
	public String seatSettingModify(int theater_no, int theater_seatNum) throws Exception {
		admin_AreaService.seatSettingModify(theater_no, theater_seatNum);
		return "success";
	}
	//영화관 좌석 삭제하기
	@RequestMapping(value="/seatSettingDelete", method = RequestMethod.GET)
	@ResponseBody
	public String seatSettingDelete(int theater_no) throws Exception {
		admin_AreaService.seatSettingDelete(theater_no);
		return "success";
	}
	// --------------- 영화관 좌석 및 영화관 관 관리 END-----------------------
	// --------------- 영화관 상품 스케줄 관리-----------------------
	// --------------- 영화관 상품 스케줄 관리 END-----------------------
	// --------------- 영화 매점 관리-----------------------
	//매점관리페이지
	@RequestMapping(value="/administerStoreManagement", method=RequestMethod.GET)
	public String administerStoreManagement(Model model) {
		//처음 매점 관리 들어갔을떄 호출할 음식리스트
		List<FoodVo> foodList = admin_StoreService.getStoreFoodList();
		List<FoodVo> drinkList = admin_StoreService.getStoreDrinkList();
		List<FoodVo> setMenuList = admin_StoreService.getStoreSetMenuList();
		model.addAttribute("foodList", foodList);
		model.addAttribute("drinkList", drinkList);
		model.addAttribute("setMenuList", setMenuList);
		//System.out.println("foodlist : "+foodlist);
		return "/administerPage/administerStoreManagement";
	}
	//매점등록페이지
	@RequestMapping(value="/administerStoreRegist", method=RequestMethod.GET)
	public String administerStoreRegist() {
		return "/administerPage/administerStoreRegist";
	}
	//매점음식등록 실행
	@RequestMapping(value="/administerStoreRegistRun", method = RequestMethod.POST)
	public String administerStoreRegistRun(FoodVo foodVo, RedirectAttributes rttr)throws Exception {
		//System.out.println("FoodVo : "+ foodVo);
		admin_StoreService.administerStoreRegistRun(foodVo);
		rttr.addFlashAttribute("msgFoodRegist", "success");
		return "redirect:/administerPage/administerStoreManagement";
	}
	// --------------- 영화 매점 관리 END-----------------------
}
