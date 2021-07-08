package com.care.root.mileage.service;

import java.util.ArrayList;
import java.util.Collections;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mileage.dto.MileageDTO;
import com.care.root.mybatis.mileage.MileageMapper;
import com.care.root.order.dto.OrderDTO;
import com.care.root.order.service.OrderService;

@Service
public class MileageServiceImpl implements MileageService {

	@Autowired MileageMapper mapper;

	@Override
	public void getUserMileageStateList(HttpServletRequest request, Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<String> userMileageStateList = mapper.getUserMileageStateList(LoginUserIdx);
		model.addAttribute("userMileageStateList", userMileageStateList);
		System.out.println(userMileageStateList);
		userMileageStateList.forEach((mileageState)->System.out.println(mileageState));
		
		int usableMileageCount = Collections.frequency(userMileageStateList, "사용가능");
		int usedMileageCount = Collections.frequency(userMileageStateList, "사용됨");
		int unusedMileageCount = Collections.frequency(userMileageStateList, "미가용");
		int refundExpectedMileageCount = Collections.frequency(userMileageStateList, "환불예정");

		model.addAttribute("usableMileageCount", usableMileageCount);
		model.addAttribute("usedMileageCount", usedMileageCount);
		model.addAttribute("unusedMileageCount", unusedMileageCount);
		model.addAttribute("refundExpectedMileageCount", refundExpectedMileageCount);		
	}
		
	@Override
	public void getUserMileages(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<MileageDTO> userMileageList = mapper.getUserMileages(LoginUserIdx);
		model.addAttribute("userMileageList", userMileageList);
		System.out.println(userMileageList);
		userMileageList.forEach((mileage)->System.out.println(mileage.getMileageStatus()));
}

	@Override
	public void getUserTotalMileage(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		int UserTotalMileageCount = mapper.getUserTotalMileage(LoginUserIdx);
		model.addAttribute("UserTotalMileageCount", UserTotalMileageCount);
		System.out.println(UserTotalMileageCount);
	
	}

	@Override
	public void getUnusedUserMileages(Model model, HttpSession session) {
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<MileageDTO> userMileageList = mapper.getUnusedUserMileages(LoginUserIdx);
		model.addAttribute("userMileageList", userMileageList);
		System.out.println(userMileageList);
		userMileageList.forEach((mileage)->System.out.println(mileage.getMileageStatus()));
		
	}
	
}
