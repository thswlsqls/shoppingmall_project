package com.care.root.wish.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.wish.WishMapper;
import com.care.root.order.dto.OrderDTO;
import com.care.root.wish.dto.WishDTO;

@Service
public class WishServiceImpl implements WishService{
	@Autowired WishMapper mapper;
	
	@Override
	public void getUserWishes(Model model, 
															HttpSession session
															) {
		// TODO Auto-generated method stub
		MemberDTO dto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = dto.getMemberIdx();
		ArrayList<WishDTO> userWishList = mapper.getUserWishes(LoginUserIdx);
		model.addAttribute("userWishList", userWishList);
		userWishList.forEach((wish)->System.out.println(wish.getWishName()));
	
	}

	@Override
	public void deleteUserWishes(String wishId, HttpServletRequest request) {
		// TODO Auto-generated method stub
		System.out.println("wishService");
		System.out.println(wishId);
		
		mapper.deleteUserWishes(wishId);
	}

}
