package com.kh.projectMovie01.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.projectMovie01.vo.FoodVo;

@Repository
public class Admin_StoreDaoImpl implements Admin_StoreDao {

	private static final String NAMESPACE = "mappers.store-mapper.";
	
	@Inject
	private SqlSession sqlSession;	
	
	@Override
	public void administerStoreRegistRun(FoodVo foodVo) {
		sqlSession.insert(NAMESPACE + "administerStoreRegistRun", foodVo);
	}
	
	@Override
	public List<FoodVo> getStoreFoodList(int food_subCode) {
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getStoreFoodList", food_subCode);
		return list;
	}
	@Override
	public List<FoodVo> getStoreDrinkList(int food_subCode) {
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getStoreDrinkList", food_subCode);
		return list;
	}
	@Override
	public List<FoodVo> getStoreSetMenuList(int food_subCode) {
		List<FoodVo> list = sqlSession.selectList(NAMESPACE + "getStoreSetMenuList", food_subCode);
		return list;
	}
}
