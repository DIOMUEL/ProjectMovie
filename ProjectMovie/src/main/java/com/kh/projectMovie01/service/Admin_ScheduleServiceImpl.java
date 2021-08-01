package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.projectMovie01.dao.Admin_ScheduleDao;
import com.kh.projectMovie01.vo.ScheduleManagementVo;

@Service
public class Admin_ScheduleServiceImpl implements Admin_ScheduleService {

	@Inject
	private Admin_ScheduleDao admin_ScheduleDao;

	
	@Override
	public void addSchedule(ScheduleManagementVo scheduleManagementVo) {
		admin_ScheduleDao.addSchedule(scheduleManagementVo);
	}

	@Override
	public List<ScheduleManagementVo> todayScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		List<ScheduleManagementVo> list = admin_ScheduleDao.todayScheduleList(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		return list;
	}

	@Override
	public List<ScheduleManagementVo> searchScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		List<ScheduleManagementVo> list = admin_ScheduleDao.searchScheduleList(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		return list;
	}

	@Override
	public void checkBoxClick(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date, String managerSchedule_complete) {
		admin_ScheduleDao.checkBoxClick(managerSchedule_no, managerSchedule_year, managerSchedule_month, managerSchedule_date, managerSchedule_complete);
	}

	@Override
	public void deleteSchedule(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		admin_ScheduleDao.deleteSchedule(managerSchedule_no, managerSchedule_year, managerSchedule_month, managerSchedule_date);	
	}

	@Transactional
	@Override
	public int completeSchedulePersent(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		int totalCount = admin_ScheduleDao.totalScheduleCount(managerSchedule_year, managerSchedule_month, managerSchedule_date);
		int yCount = admin_ScheduleDao.yScheduleCount(managerSchedule_year, managerSchedule_month, managerSchedule_date);
//		System.out.println("totalCount :"+totalCount);
//		System.out.println("yCount :"+yCount);
		int persentage = (yCount*100)/(totalCount);
		return persentage;
	}

	
}
