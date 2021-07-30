package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.ScheduleManagementVo;

public interface Admin_ScheduleService {
	
	//특정날짜 스케줄 리스트 추가
	public void addSchedule(ScheduleManagementVo scheduleManagementVo);
	//오늘날짜 스케줄 리스트 호출
	public List<ScheduleManagementVo> todayScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date);
	//특정날짜 스케줄 리스트 호출
	public List<ScheduleManagementVo> searchScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date);
	//특정날짜 체크박스 업데이트YN
	public void checkBoxClick(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date, String managerSchedule_complete);
}
