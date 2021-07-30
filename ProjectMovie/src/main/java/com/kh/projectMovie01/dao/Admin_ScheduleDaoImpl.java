package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.ScheduleManagementVo;

@Repository
public class Admin_ScheduleDaoImpl implements Admin_ScheduleDao {
	
	private static final String NAMESPACE = "com.kh.projectMovie01.schedule.";
	
	@Inject
	private SqlSession sqlSession;

	
	@Override
	public void addSchedule(ScheduleManagementVo scheduleManagementVo) {
		sqlSession.insert(NAMESPACE + "addSchedule", scheduleManagementVo);
	}	
	
	@Override
	public List<ScheduleManagementVo> todayScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		Map<String, Object> map = new HashMap<>();
		map.put("managerSchedule_year", managerSchedule_year);
		map.put("managerSchedule_month", managerSchedule_month);
		map.put("managerSchedule_date", managerSchedule_date);
		List<ScheduleManagementVo> list = sqlSession.selectList(NAMESPACE + "todayScheduleList", map);
		return list;
	}

	@Override
	public List<ScheduleManagementVo> searchScheduleList(int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		Map<String, Object> map = new HashMap<>();
		map.put("managerSchedule_year", managerSchedule_year);
		map.put("managerSchedule_month", managerSchedule_month);
		map.put("managerSchedule_date", managerSchedule_date);
		List<ScheduleManagementVo> list = sqlSession.selectList(NAMESPACE + "searchScheduleList", map);
		return list;
	}

	@Override
	public void checkBoxClick(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date, String managerSchedule_complete) {
		Map<String, Object> map = new HashMap<>();
		map.put("managerSchedule_no", managerSchedule_no);
		map.put("managerSchedule_year", managerSchedule_year);
		map.put("managerSchedule_month", managerSchedule_month);
		map.put("managerSchedule_date", managerSchedule_date);
		map.put("managerSchedule_complete", managerSchedule_complete);
		sqlSession.update(NAMESPACE + "checkBoxClick", map);	
	}

	@Override
	public void deleteSchedule(int managerSchedule_no, int managerSchedule_year, int managerSchedule_month, int managerSchedule_date) {
		Map<String, Object> map = new HashMap<>();
		map.put("managerSchedule_no", managerSchedule_no);
		map.put("managerSchedule_year", managerSchedule_year);
		map.put("managerSchedule_month", managerSchedule_month);
		map.put("managerSchedule_date", managerSchedule_date);
		sqlSession.delete(NAMESPACE + "deleteSchedule", map);	
	}	
}
