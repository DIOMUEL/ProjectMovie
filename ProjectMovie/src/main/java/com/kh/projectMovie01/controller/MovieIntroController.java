package com.kh.projectMovie01.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/movieintro")
public class MovieIntroController {

	
	//인기 영화
	@RequestMapping(value="/Movie1_1", method=RequestMethod.GET)
	public String Movie1_1() throws Exception{
		return "/movieintro/movie1-1";
	}
	@RequestMapping(value="/Movie1_2", method=RequestMethod.GET)
	public String Movie1_2() throws Exception{
		return "/movieintro/movie1-2";
	}
	@RequestMapping(value="/Movie1_3", method=RequestMethod.GET)
	public String Movie1_3() throws Exception{
		return "/movieintro/movie1-3";
	}
	//상영중인 영화
	@RequestMapping(value="/Movie1", method=RequestMethod.GET)
	public String Movie1() throws Exception{
		return "/movieintro/Movie1";
	}
	@RequestMapping(value="/Movie2", method=RequestMethod.GET)
	public String Movie2() throws Exception{
		return "/movieintro/Movie2";
	}
	@RequestMapping(value="/Movie3", method=RequestMethod.GET)
	public String Movie3() throws Exception{
		return "/movieintro/Movie3";
	}
	@RequestMapping(value="/Movie4", method=RequestMethod.GET)
	public String Movie4() throws Exception{
		return "/movieintro/Movie4";
	}
	@RequestMapping(value="/Movie5", method=RequestMethod.GET)
	public String Movie5() throws Exception{
		return "/movieintro/Movie5";
	}
	@RequestMapping(value="/Movie6", method=RequestMethod.GET)
	public String Movie6() throws Exception{
		return "/movieintro/Movie6";
	}
}
