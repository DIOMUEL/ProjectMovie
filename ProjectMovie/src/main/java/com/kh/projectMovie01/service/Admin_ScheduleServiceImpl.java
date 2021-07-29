package com.kh.projectMovie01.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.Admin_ScheduleDao;


@Service
public class Admin_ScheduleServiceImpl implements Admin_ScheduleService {

	@Inject
	private Admin_ScheduleDao admin_ScheduleDao;

}
