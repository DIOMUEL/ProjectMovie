package com.kh.projectMovie01.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_ScheduleDaoImpl implements Admin_ScheduleDao {
	
	private static final String NAMESPACE = "com.kh.projectMovie01.schedule.";
	
	@Inject
	private SqlSession sqlSession;	
}
