package com.kh.projectMovie01.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.Data;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.projectMovie01.service.Admin_AreaService;
import com.kh.projectMovie01.service.Admin_MovieService;
import com.kh.projectMovie01.service.Admin_ScheduleService;
import com.kh.projectMovie01.service.Admin_StoreService;
import com.kh.projectMovie01.service.ChartService;
import com.kh.projectMovie01.service.NoticeMessageService;
import com.kh.projectMovie01.service.ReportService;
import com.kh.projectMovie01.vo.ChartPieVo;
import com.kh.projectMovie01.vo.FoodVo;
import com.kh.projectMovie01.vo.MemberVo;
import com.kh.projectMovie01.vo.MovieImageVo;
import com.kh.projectMovie01.vo.MovieScheduleVo;
import com.kh.projectMovie01.vo.MovieVo;
import com.kh.projectMovie01.vo.NoticeMessageVo;
import com.kh.projectMovie01.vo.PagingDto;
import com.kh.projectMovie01.vo.ReportVo;
import com.kh.projectMovie01.vo.ScheduleManagementVo;
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
	@Inject
	private Admin_ScheduleService admin_ScheduleService;
	@Inject
	private NoticeMessageService noticeMessageService;
	@Inject
	private ReportService reportService;
	//?????? ???????????? ????????? ?????? ??? ???????????? ????????????
	@RequestMapping(value="/administerMainPage", method=RequestMethod.GET)
	public String administerMainPage(HttpSession session, Model model) {
		//?????? ????????? ?????? ??????
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
	//?????????????????? ?????? ???????????? ?????? ???
	@RequestMapping(value="/totalMovieChart", method=RequestMethod.GET)
	public String totalMovieChart(HttpSession session, Model model) {
		return "/administerPage/totalMovieChart";
	}
// --------------- ?????? ????????? ?????? ?????? -----------------------
	//?????? ???????????????
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
	//?????? ???????????????
	@RequestMapping(value="/administerMovieRegistPage", method = RequestMethod.GET)
	public String administerMovieRegistPage() throws Exception {
		return "/administerPage/administerMovieRegistPage";
	}
	//??????????????????
	@RequestMapping(value="/administerMovieRegistRun", method = RequestMethod.POST)
	public String administerMovieRegistRun(MovieVo movieVo, RedirectAttributes rttr)throws Exception {
		//System.out.println("MovieVo"+ movieVo);
		admin_MovieService.administerMovieRegistRun(movieVo);
		rttr.addFlashAttribute("msgRegist", "success");
		return "redirect:/administerPage/administerMovieListPage";
	}
	//??????????????????
	@RequestMapping(value="/administerMovieSelectByMovie", method = RequestMethod.GET)
	public String selectByMovie(String movie_code, Model model) throws Exception {
		//?????? ??????(????????? ??????)
		MovieVo movieVo = admin_MovieService.selectByMovie(movie_code);
		//System.out.println("MovieVo"+ movieVo);
		//????????? ??????
		List<MovieImageVo> movieImageVo = admin_MovieService.selectByMovieSubImage(movie_code);
		model.addAttribute("movieImageVo", movieImageVo);
		model.addAttribute("movieVo", movieVo);
		return "/administerPage/administerMovieSelectByMovie";
	}
	//?????? ????????????
	@RequestMapping(value="/administerMovieModifyRun", method = RequestMethod.POST)
	public String administerMovieModifyRun(MovieVo movieVo, RedirectAttributes rttr) throws Exception {
		//System.out.println("movieVo"+ movieVo);
		String movie_code = movieVo.getMovie_code();
		admin_MovieService.movieModify(movieVo);
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/administerPage/administerMovieSelectByMovie?movie_code=" + movie_code;
	}
	//????????????
	@RequestMapping(value="/administerMovieDeleteRun", method = RequestMethod.GET)
	public String administerMovieDeleteRun(String movie_code, RedirectAttributes rttr) throws Exception {
		//System.out.println("movie_code"+ movie_code);
		admin_MovieService.deleteMovie(movie_code);
		rttr.addFlashAttribute("msgDelete", "success");
		return "redirect:/administerPage/administerMovieListPage";
	}
// --------------- ?????? ????????? ?????? ?????? End-----------------------
// --------------- ????????? ?????? ?????? -----------------------
	//?????????????????????
	@RequestMapping(value="/administerMovieAreaManagement", method = RequestMethod.GET)
	public String administerMovieAreaManagement(Model model) throws Exception {
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		return "/administerPage/administerMovieAreaManagement";
	}
//????????? 	
	//??????????????????/ ??? ???????????? ?????? ??? ?????????
	@RequestMapping(value="/administerMovieAreaRegistRun", method = RequestMethod.GET)
	public String administerMovieAreaRegist(String area_name, RedirectAttributes rttr) throws Exception {
		admin_AreaService.movieAreaAdd(area_name);
		rttr.addFlashAttribute("msgAreaInsert", "success");
		return "redirect:/administerPage/administerMovieAreaManagement";
	}
	//??????????????????/ ??? ???????????? ?????? ??? ?????????
	@RequestMapping(value="/administerMovieAreaModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaModify(int area_no, String area_name) throws Exception {
		admin_AreaService.movieAreaModify(area_no, area_name);
		return "success";
	}
	//??????????????????/ ??? ???????????? ?????? ??? ?????????
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
//?????? ?????????	
	//???????????????????????? ?????????
	@RequestMapping(value="/administerMovieAreaTheaterList", method = RequestMethod.GET)
	@ResponseBody
	public List<AreaTheaterVo> administerMovieAreaTheaterList(int area_no) throws Exception {
		List<AreaTheaterVo> areaTheaterVo = admin_AreaService.getAllAreaTheaterList(area_no);
		return areaTheaterVo;
	}
	//???????????????????????????/ ??? ???????????? ?????? ??? ?????????
	@RequestMapping(value="/administerMovieAreaTheaterRegistRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterRegist(int area_no, String area_theater_name) throws Exception {
		admin_AreaService.areaTheaterAdd(area_no, area_theater_name);
		return "success";
	}
	//???????????????????????????/ ??? ???????????? ?????? ??? ?????????
	@RequestMapping(value="/administerMovieAreaTheaterModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterModify(int area_theater_no, String area_theater_name) throws Exception {
		admin_AreaService.areaTheaterModify(area_theater_no, area_theater_name);
		return "success";
	}
	//??????????????????/ ??? ???????????? ?????? ??? ?????????
	@RequestMapping(value="/administerMovieAreaTheaterDeleteRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerMovieAreaTheaterDelete(int area_theater_no) throws Exception {
		admin_AreaService.areaTheaterDelete(area_theater_no);
		return "success";
	}
// --------------- ????????? ?????? ??????  END-----------------------
// --------------- ????????? ?????? ??? ????????? ??? ?????? -----------------------
	// ??????????????? ????????? ?????? ?????? ??????(??????)
	@RequestMapping(value="/administerMovieTheaterSeatSetting", method = RequestMethod.GET)
	public String administerMovieTheaterSeatSetting(Model model) throws Exception {
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		return "/administerPage/administerMovieTheaterSeatSetting";
	}
	// ??????????????? ?????? ?????? ??????(?????? > ?????????)
	@RequestMapping(value="/seatSetting_callingTheater", method = RequestMethod.GET)
	@ResponseBody
	public List<AreaTheaterVo> callingTheater(int area_no) throws Exception {
		List<AreaTheaterVo> areaTheaterVo = null;
		if(area_no != 0) {
			areaTheaterVo = admin_AreaService.getAllAreaTheaterList(area_no);
			//System.out.println("areaTheaterVo : "+ areaTheaterVo);
		}
		return areaTheaterVo;
	}
	// ?????? ?????? ????????? ??? ??????????????? ???????????? ??? ????????? ??????
	@RequestMapping(value="/callingTheaterRoomList", method = RequestMethod.GET)
	@ResponseBody
	public List<TheaterSeatVo> callingTheaterRoomList(int area_theater_no) throws Exception {
		List<TheaterSeatVo> areaTheaterVo = admin_AreaService.getSeveralTheaterSeatList(area_theater_no);
		return areaTheaterVo;
	}
	// ????????? ?????? ????????????
	@RequestMapping(value="/seatSettingRegist", method = RequestMethod.GET)
	public String seatSettingRegist(int area_theater_no, String theater_name, int theater_seatNum, RedirectAttributes rttr) throws Exception {
		admin_AreaService.seatSettingRegist(area_theater_no, theater_name, theater_seatNum);
		rttr.addFlashAttribute("msgSittingRegist", "success");
		return "redirect:/administerPage/administerMovieTheaterSeatSetting";
	}
	//????????? ?????? ????????????
	@RequestMapping(value="/seatSettingModify", method = RequestMethod.GET)
	@ResponseBody
	public String seatSettingModify(int theater_no, int theater_seatNum) throws Exception {
		admin_AreaService.seatSettingModify(theater_no, theater_seatNum);
		return "success";
	}
	//????????? ?????? ????????????
	@RequestMapping(value="/seatSettingDelete", method = RequestMethod.GET)
	@ResponseBody
	public String seatSettingDelete(int theater_no) throws Exception {
		admin_AreaService.seatSettingDelete(theater_no);
		return "success";
	}
// --------------- ????????? ?????? ??? ????????? ??? ?????? END-----------------------

// --------------- ?????? ?????? ??????-----------------------
	//?????????????????????
	@RequestMapping(value="/administerStoreManagement", method=RequestMethod.GET)
	public String administerStoreManagement(Model model) {
		//?????? ?????? ?????? ??????????????? ????????? ???????????????
		//?????? ??????????????? ?????? ??????
		//?????????:?????? ?????????:??????,?????????,?????????,??????,??????,??????
		List<FoodVo> foodList101 = admin_StoreService.getStoreFoodList(101);
		List<FoodVo> foodList102 = admin_StoreService.getStoreFoodList(102);
		List<FoodVo> foodList103 = admin_StoreService.getStoreFoodList(103);
		List<FoodVo> foodList104 = admin_StoreService.getStoreFoodList(104);
		List<FoodVo> foodList105 = admin_StoreService.getStoreFoodList(105);
		List<FoodVo> foodList106 = admin_StoreService.getStoreFoodList(106);
		//System.out.println("foodList104 : "+foodList104);
		//?????????:?????? ?????????:??????,?????????,??????,??????
		List<FoodVo> drinkList201 = admin_StoreService.getStoreDrinkList(201);
		List<FoodVo> drinkList202 = admin_StoreService.getStoreDrinkList(202);
		List<FoodVo> drinkList203 = admin_StoreService.getStoreDrinkList(203);
		List<FoodVo> drinkList204 = admin_StoreService.getStoreDrinkList(204);

		//?????????:?????? ?????????:??????,??????
		List<FoodVo> setMenuList301 = admin_StoreService.getStoreSetMenuList(301);
		List<FoodVo> setMenuList302 = admin_StoreService.getStoreSetMenuList(302);
		
		model.addAttribute("foodList101", foodList101);
		model.addAttribute("foodList102", foodList102);
		model.addAttribute("foodList103", foodList103);
		model.addAttribute("foodList104", foodList104);
		model.addAttribute("foodList105", foodList105);
		model.addAttribute("foodList106", foodList106);
		
		model.addAttribute("drinkList201", drinkList201);
		model.addAttribute("drinkList202", drinkList202);
		model.addAttribute("drinkList203", drinkList203);
		model.addAttribute("drinkList204", drinkList204);
		
		model.addAttribute("setMenuList301", setMenuList301);
		model.addAttribute("setMenuList302", setMenuList302);
		return "/administerPage/administerStoreManagement";
	}
	//?????????????????????
	@RequestMapping(value="/administerStoreRegist", method=RequestMethod.GET)
	public String administerStoreRegist() {
		return "/administerPage/administerStoreRegist";
	}
	//?????????????????? ??????
	@RequestMapping(value="/administerStoreRegistRun", method = RequestMethod.POST)
	public String administerStoreRegistRun(FoodVo foodVo, RedirectAttributes rttr)throws Exception {
		//System.out.println("FoodVo : "+ foodVo);
		admin_StoreService.administerStoreRegistRun(foodVo);
		rttr.addFlashAttribute("msgFoodRegist", "success");
		return "redirect:/administerPage/administerStoreManagement";
	}
	//?????? ????????? ?????? ??????
	@RequestMapping(value="/administerFoodNameModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerFoodNameModifyRun(int food_num, String food_name) throws Exception {
		admin_StoreService.updateFoodName(food_num, food_name);
		return "success";
	}
	//?????? ?????? ?????? ??????
	@RequestMapping(value="/administerFoodPriceModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerFoodPriceModifyRun(int food_num, int food_price) throws Exception {
		admin_StoreService.updateFoodPrice(food_num, food_price);
		return "success";
	}
	//?????? ?????? ?????? ??????
	@RequestMapping(value="/administerFoodCountModifyRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerFoodCountModifyRun(int food_num, int food_count) throws Exception {
		admin_StoreService.updateFoodCount(food_num, food_count);
		return "success";
	}
	//?????? ?????? ????????????
	@RequestMapping(value="/administerFoodDeleteRun", method = RequestMethod.GET)
	@ResponseBody
	public String administerFoodDeleteRun(int food_num) throws Exception {
		admin_StoreService.deleteFood(food_num);
		return "success";
	}
// --------------- ?????? ?????? ?????? END-----------------------
// --------------- ?????? ????????? ?????? -----------------------
	//?????? ????????? ????????? ?????????
	@RequestMapping(value="/administerMovieScheduleManagementPage", method=RequestMethod.GET)
	public String administerMovieScheduleManagementPage(Model model) throws Exception {
		List<AreaVo> areaVo = admin_AreaService.getAllAreaList();
		model.addAttribute("areaVo", areaVo);
		return "/administerPage/administerMovieScheduleManagementPage";
	}

	//???????????? ????????? ?????????????????? ???????????????
	@RequestMapping(value="/administerGetMovieScheduleList", method=RequestMethod.GET)
	@ResponseBody
	public List<MovieScheduleVo> administerGetMovieScheduleList(int theater_no, String movieSchedule_registTime) throws Exception {
		List<MovieScheduleVo> list = admin_MovieService.getMovieScheduleList(theater_no, movieSchedule_registTime);
//		System.out.println("theater_no : " + theater_no);
//		System.out.println("movieSchedule_registTime : " + movieSchedule_registTime);
//		System.out.println("list : "+ list);
		return list;
	}
	//?????? ????????? ?????? ?????????
	@RequestMapping(value="/administerMovieScheduleRegistPage", method=RequestMethod.GET)
	public String administerMovieScheduleRegistPage(Model model, int theater_seatNum, int theater_no, int area_theater_no) throws Exception {
//		System.out.println("theater_seatNum : "+theater_seatNum);
//		System.out.println("theater_no : "+theater_no);
//		System.out.println("area_theater_no : "+area_theater_no);
		List<MovieVo> movieVo = admin_MovieService.nameListAll();
		MovieScheduleVo movieScheduleVo = admin_MovieService.lastMovieSchedule(theater_no);
		//System.out.println("movieScheduleVo : "+movieScheduleVo);
		model.addAttribute("movieVo", movieVo);
		model.addAttribute("movieScheduleVo", movieScheduleVo);
		//System.out.println("seat : "+seat);
		model.addAttribute("seat", theater_seatNum);
		model.addAttribute("theater_no", theater_no);
		model.addAttribute("area_theater_no", area_theater_no);
		return "/administerPage/administerMovieScheduleRegistPage";
	}
	//??????????????? ?????? ????????? ?????? ??????
	@RequestMapping(value="/administerGetMovieInfo", method=RequestMethod.GET)
	@ResponseBody
	public MovieVo administerGetMovieInfo(String movie_name) throws Exception {
		MovieVo movieVo = admin_MovieService.getMovieInfo(movie_name);
		//System.out.println("movieVo: "+movieVo);
		return movieVo;
	}
	//?????? ????????? ??????????????? ????????????
	@RequestMapping(value="/administerMovieScheduleRegistRun", method=RequestMethod.POST)
	public String administerMovieScheduleRegistRun(MovieScheduleVo movieScheduleVo, RedirectAttributes rttr) throws Exception {
//		System.out.println("movieScheduleVo : "+ movieScheduleVo);
		admin_MovieService.insertMoviSchedule(movieScheduleVo);
		rttr.addFlashAttribute("msgRegist", "success");
		return "redirect:/administerPage/administerMovieScheduleManagementPage";
	}
// --------------- ?????? ????????? ?????? END-----------------------
// --------------- ?????? ????????? ?????? -----------------------
	//????????? ??????????????? ????????? ????????? ?????? ?????? ????????? ?????? ?????? ????????? ?????? ????????????
	@RequestMapping(value="/administerScheduleManagement", method=RequestMethod.POST)
	public String administerScheduleManagement(Model model, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) throws Exception {
//		System.out.println("managerSchedule_year:"+managerSchedule_year);
//		System.out.println("managerSchedule_month:"+managerSchedule_month);
//		System.out.println("managerSchedule_date:"+managerSchedule_date);
		List<ScheduleManagementVo> todaylist = admin_ScheduleService.todayScheduleList(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		//System.out.println("todaylist : " + todaylist);
		model.addAttribute("todaylist", todaylist);
		return "/administerPage/administerScheduleManagement";
	}
	//????????? ??????????????? ????????? ????????? ??????
	@RequestMapping(value="/administerAddSchedule", method=RequestMethod.GET)
	@ResponseBody
	public String administerAddSchedule(ScheduleManagementVo scheduleManagementVo) throws Exception {
		//System.out.println(scheduleManagementVo);
		String YN = scheduleManagementVo.getmanagerSchedule_complete();
		if(YN == null) {
			YN = "N";
		}
		scheduleManagementVo.setmanagerSchedule_complete(YN);
		admin_ScheduleService.addSchedule(scheduleManagementVo);
		return "success";
	}
	//????????? ??????????????? ????????? ?????? ??????????????? ?????? ?????? ????????? ???????????? 
	@RequestMapping(value="/administerSearchSchedule", method=RequestMethod.GET)
	@ResponseBody
	public List<ScheduleManagementVo> administerSearchSchedule(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) throws Exception {
		//System.out.println(managerSchedule_year +","+ managerSchedule_month +","+ managerSchedule_date);
		List<ScheduleManagementVo> thisDateList = admin_ScheduleService.searchScheduleList(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		//System.out.println("thisDateList: " + thisDateList);
		return thisDateList;
	}
	//????????? ??????????????? ????????? ???????????? ????????? ?????? ?????????????????? YN ????????????
	@RequestMapping(value="/administerCheckBoxClick", method=RequestMethod.GET)
	@ResponseBody
	public String administerCheckBoxClick(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date, String managerSchedule_complete) throws Exception {
		System.out.println(managerSchedule_no + "," + managerSchedule_year + "," + managerSchedule_month + "," + managerSchedule_date + "," + managerSchedule_complete);
		admin_ScheduleService.checkBoxClick(managerSchedule_no, managerSchedule_year, managerSchedule_month, managerSchedule_date, managerSchedule_complete);
		return "success";
	}
	//????????? ??????????????? ????????? ????????? ????????????
	@RequestMapping(value="/administerDeleteSchedule", method=RequestMethod.GET)
	@ResponseBody
	public String administerDeleteSchedule(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) throws Exception {
		//System.out.println(managerSchedule_no + "," + managerSchedule_year + "," + managerSchedule_month + "," + managerSchedule_date);
		admin_ScheduleService.deleteSchedule(managerSchedule_no, managerSchedule_year, managerSchedule_month, managerSchedule_date);
		return "success";
	}
	//??????????????? ??????????????? ????????? ?????? ???????????????
	@RequestMapping(value="/administerCompleteSchedulePersent", method=RequestMethod.GET)
	@ResponseBody
	public int administerCompleteSchedulePersent(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) throws Exception {
		//System.out.println(managerSchedule_year + "," + managerSchedule_month + "," + managerSchedule_date);
		int persentage = admin_ScheduleService.completeSchedulePersent(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		//System.out.println("persentage : "+persentage);
		return persentage;
	}
	//??????????????? ????????? ?????????
	@RequestMapping(value="/administerManagerSchedule", method=RequestMethod.GET)
	public String administerManagerSchedule() throws Exception {
		return "/administerPage/administerManagerSchedule";
	}
	//??????????????? ????????? ????????? ??????  ???????????????
	@RequestMapping(value="/administerTodayScheduleList", method=RequestMethod.GET)
	@ResponseBody
	public List<ScheduleManagementVo> administerTodayScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) throws Exception {
//		System.out.println("managerSchedule_year:"+managerSchedule_year);
//		System.out.println("managerSchedule_month:"+managerSchedule_month);
//		System.out.println("managerSchedule_date:"+managerSchedule_date);
		List<ScheduleManagementVo> todaylist = admin_ScheduleService.todayScheduleList(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		return todaylist;
	}
// --------------- ?????? ????????? ?????? END-----------------------
// --------------- ????????? ?????? -----------------------
	//????????? ?????????
	@RequestMapping(value="/administerMessageBox" , method=RequestMethod.GET)
	public String message(Model model, Admin_PageingDto admin_PageingDto, HttpSession session) throws Exception {
		MemberVo memberVo =(MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
//		System.out.println("user_id : " + user_id);
		int count = noticeMessageService.getCountReceive(user_id);
		List<NoticeMessageVo> receiveList = noticeMessageService.messageListReceiveAll(user_id, admin_PageingDto);
		admin_PageingDto.setTotalCount(count);
		model.addAttribute("receiveList", receiveList);
		model.addAttribute("pagingDtoReceive", admin_PageingDto);
		
//		int count1 = noticeMessageService.getCountSend(user_id);
		List<NoticeMessageVo> sendList = noticeMessageService.messageListSendAll(user_id, admin_PageingDto);
//		admin_PageingDto.setTotalCount(count1);
		model.addAttribute("sendList", sendList);
		model.addAttribute("pagingDtoSend", admin_PageingDto);
		
//		int count2 = noticeMessageService.getCountSelf(user_id);
		List<NoticeMessageVo> selfList = noticeMessageService.messageListSelfAll(user_id, user_id, admin_PageingDto);
//		admin_PageingDto.setTotalCount(count2);
		model.addAttribute("selfList", selfList);
		model.addAttribute("pagingDtoSelf", admin_PageingDto);

		return "/administerPage/administerMessageBox";
	}
	//?????? ??????
	@RequestMapping(value= "/administerMessageReadPage", method=RequestMethod.GET)
	public String administerMessageReadPage(int msg_no, HttpSession session, Model model) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		NoticeMessageVo noticeMessageVo = noticeMessageService.messageRead(msg_no);
		int notReadCount = noticeMessageService.notReadCount(user_id);
		memberVo.setNotReadCount(notReadCount);
		
		model.addAttribute("noticeMessageVo", noticeMessageVo);
		model.addAttribute("user_id", user_id);
		
		return "/administerPage/administerMessageReadPage";
	}
	//???????????????
	@RequestMapping(value="/sendMessage", method=RequestMethod.POST)
	@ResponseBody
	public String sendMessage(@RequestBody NoticeMessageVo noticeMessageVo, HttpSession session)throws Exception{
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		noticeMessageVo.setMsg_sender(memberVo.getUser_id());
		noticeMessageService.sendMessage(noticeMessageVo);
		return "success";
	}
	// ?????? ??????
	@RequestMapping(value = "/deleteMessage", method=RequestMethod.GET)
	@ResponseBody
	public boolean deleteMessage(int msg_no, HttpSession session) throws Exception {
		MemberVo memberVo = (MemberVo)session.getAttribute("loginVo");
		String user_id = memberVo.getUser_id();
		//System.out.println("msg_no : "+ msg_no);
		boolean result = noticeMessageService.deleteMessage(msg_no, user_id);
		//System.out.println("result : "+ result);
		return result;
	}
	
// --------------- ????????? ?????? END-----------------------
// --------------- ?????? ????????? ?????? -----------------------
	//????????? ?????? ?????????
	@RequestMapping(value="/administerReportNoticeBoard", method=RequestMethod.GET)
	public String administerReportNoticeBoard(Model model) throws Exception {
		List<ReportVo> list = reportService.selectReportList();
		model.addAttribute("list", list);
		return "/administerPage/administerReportNoticeBoard";
	}
	//????????? ?????? ?????????
	@RequestMapping(value="/administerReportDeleteRun", method=RequestMethod.GET)
	@ResponseBody
	public String administerReportDeleteRun(int rpt_no) throws Exception {
		reportService.reportDeleteRun(rpt_no);
		return "success";
	}
// --------------- ?????? ????????? ??????  END-----------------------
}
