package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.BuyFoodVo;


@Repository
public class BuyFoodDaoImpl implements BuyFoodDao {
	private static final String NAMESPACE = "com.kh.projectMovie01.buyFood.";

	@Inject
	SqlSession sqlSession;

	@Override
	public List<BuyFoodVo> buyFoodList(String user_id) {
		List<BuyFoodVo> list = sqlSession.selectList(NAMESPACE+"buyFoodList",user_id);
		
		return list;
	}

}
