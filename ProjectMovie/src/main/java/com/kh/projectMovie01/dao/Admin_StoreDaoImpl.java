package com.kh.projectMovie01.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

	@Override
	public void updateFoodName(int food_num, String food_name) {
		Map<String, Object> map = new HashMap<>();
		map.put("food_num", food_num);
		map.put("food_name", food_name);
		sqlSession.update(NAMESPACE + "updateFoodName", map);
		
	}

	@Override
	public void updateFoodPrice(int food_num, int food_price) {
		Map<String, Object> map = new HashMap<>();
		map.put("food_num", food_num);
		map.put("food_price", food_price);
		sqlSession.update(NAMESPACE + "updateFoodPrice", map);
	}

	@Override
	public void updateFoodCount(int food_num, int food_count) {
		Map<String, Object> map = new HashMap<>();
		map.put("food_num", food_num);
		map.put("food_count", food_count);
		sqlSession.update(NAMESPACE + "updateFoodCount", map);
	}

	@Override
	public void deleteFood(int food_num) {
		sqlSession.delete(NAMESPACE + "deleteFood", food_num);
	}
}
