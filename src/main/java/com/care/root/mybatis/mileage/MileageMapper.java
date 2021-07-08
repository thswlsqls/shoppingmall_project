package com.care.root.mybatis.mileage;

import java.util.ArrayList;

import com.care.root.mileage.dto.MileageDTO;
import com.care.root.order.dto.OrderDTO;

public interface MileageMapper {
	public ArrayList<MileageDTO> getUserMileages(String memberIdx);
	public  int getUserTotalMileage(String memberIdx);
	public  ArrayList<String> getUserMileageStateList(String memberIdx);
	public ArrayList<MileageDTO> getUnusedUserMileages(String memberIdx);
}
