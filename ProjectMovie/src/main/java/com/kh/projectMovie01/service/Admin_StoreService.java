package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.FoodVo;

public interface Admin_StoreService {

	public void administerStoreRegistRun(FoodVo foodVo);
	public List<FoodVo> getStoreFoodList(int food_subCode);
	public List<FoodVo> getStoreDrinkList(int food_subCode);
	public List<FoodVo> getStoreSetMenuList(int food_subCode);
}
