package com.kh.projectMovie01.dao;

import java.util.List;

import com.kh.projectMovie01.vo.BuyFoodVo;

public interface BuyFoodDao {
	public List<BuyFoodVo> buyFoodList(String user_id);
}
