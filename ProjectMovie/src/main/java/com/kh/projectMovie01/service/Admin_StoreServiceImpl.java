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


}
