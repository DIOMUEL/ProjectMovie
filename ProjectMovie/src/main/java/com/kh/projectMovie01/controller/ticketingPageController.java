package com.kh.projectMovie01.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.projectMovie01.service.Admin_MovieService;
import com.kh.projectMovie01.vo.MovieScheduleVo;

@Controller
@RequestMapping(value="/ticketingPage")
public class ticketingPageController {
	
	@Inject
	private Admin_MovieService admin_MovieService;
	
	//영화 이름을통해 스케줄에 있는 지역 불러오기
	@RequestMapping(value="/ticketingArea", method=RequestMethod.GET)
	@ResponseBody
	public List<MovieScheduleVo> ticketingArea(String movie_name) throws Exception {
		List<MovieScheduleVo> list = admin_MovieService.getMovieScheduleListTikecting(movie_name);
		return list;
	}
}
