package com.kh.projectMovie01.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.projectMovie01.service.TicketingService;

@Controller
@RequestMapping(value="/board")
public class TicketingController {
	
	@Inject
	private TicketingService ticketingService;
	
}