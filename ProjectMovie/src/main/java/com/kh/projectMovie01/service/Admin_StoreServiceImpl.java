package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.Admin_StoreDao;
import com.kh.projectMovie01.vo.FoodVo;

@Service
public class Admin_StoreServiceImpl implements Admin_StoreService {

	@Inject
	private Admin_StoreDao admin_StoreDao;
	
	@Override
	public void administerStoreRegistRun(FoodVo foodVo) {
		admin_StoreDao.administerStoreRegistRun(foodVo);
	}

	@Override
	public List<FoodVo> getStoreFoodList(int food_subCode) {
		List<FoodVo> list = admin_StoreDao.getStoreFoodList(food_subCode);
		return list;
	}

	@Override
	public List<FoodVo> getStoreDrinkList(int food_subCode) {
		List<FoodVo> list = admin_StoreDao.getStoreDrinkList(food_subCode);
		return list;
	}

	@Override
	public List<FoodVo> getStoreSetMenuList(int food_subCode) {
		List<FoodVo> list = admin_StoreDao.getStoreSetMenuList(food_subCode);
		return list;
	}

	@Override
	public void updateFoodName(int food_num, String food_name) {
		admin_StoreDao.updateFoodName(food_num, food_name);
	}

	@Override
	public void updateFoodPrice(int food_num, int food_price) {
		admin_StoreDao.updateFoodPrice(food_num, food_price);
	}

	@Override
	public void updateFoodCount(int food_num, int food_count) {
		admin_StoreDao.updateFoodCount(food_num, food_count);
	}

	@Override
	public void deleteFood(int food_num) {
		admin_StoreDao.deleteFood(food_num);
	}


}
