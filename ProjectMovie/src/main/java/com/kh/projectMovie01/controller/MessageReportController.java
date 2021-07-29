package com.kh.projectMovie01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/report")
public class MessageReportController {
	
	@RequestMapping(value = "/reportPage", method = RequestMethod.GET)
	public String reportPage(){
		return "report/reportPage"; 
	}

}
