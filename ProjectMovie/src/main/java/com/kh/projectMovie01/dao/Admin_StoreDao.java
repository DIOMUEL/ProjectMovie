package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.FoodVo;

public interface Admin_StoreDao {
	
	public void administerStoreRegistRun(FoodVo foodVo);
	public List<FoodVo> getStoreFoodList(int food_subCode);

	public List<FoodVo> getStoreDrinkList(int food_subCode);
	public List<FoodVo> getStoreSetMenuList(int food_subCode);
}
