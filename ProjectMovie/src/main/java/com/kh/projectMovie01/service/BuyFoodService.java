package com.kh.projectMovie01.service;

import java.util.List;

import com.kh.projectMovie01.vo.BuyFoodVo;


public interface BuyFoodService {
	public List<BuyFoodVo> buyFoodList(String user_id);
}
