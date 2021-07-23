package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.FoodVo;

public interface Admin_StoreDao {
	//제품등록
	public void administerStoreRegistRun(FoodVo foodVo);
	//각 제품 소분류 리스트
	public List<FoodVo> getStoreFoodList(int food_subCode);
	public List<FoodVo> getStoreDrinkList(int food_subCode);
	public List<FoodVo> getStoreSetMenuList(int food_subCode);
	//수정
	public void updateFoodName(int food_num, String food_name);
	public void updateFoodPrice(int food_num, int food_price);
	public void updateFoodCount(int food_num, int food_count);
	//삭제
	public void deleteFood(int food_num);
}
