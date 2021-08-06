package com.kh.projectMovie01.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.projectMovie01.dao.BuyFoodDao;
import com.kh.projectMovie01.vo.BuyFoodVo;

@Service
public class BuyFoodServiceImpl implements BuyFoodService {
	@Inject
	private BuyFoodDao buyFoodDao;
	
	@Override
	public List<BuyFoodVo> buyFoodList(String user_id) {
		List<BuyFoodVo> list =buyFoodDao.buyFoodList(user_id);
		return list;
	}

}
