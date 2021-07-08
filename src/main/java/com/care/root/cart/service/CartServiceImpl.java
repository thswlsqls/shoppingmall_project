package com.care.root.cart.service;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.cart.dto.CartDTO;
import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.cart.CartMapper;
import com.care.root.review.dto.ReviewDTO;

@Service
public class CartServiceImpl implements CartService {
	@Autowired CartMapper mapper;
	@Override
	public String getMessage(int num, HttpServletRequest request) {
		String message = null; //num = mapper.reviewSave(rDto);
		if(num == 1) {
			message = "<script>alert('새 장바구니 상품을 성공적으로 추가 했습니다');";
			//message += "location.href='/root/board/boardAllList';</script>";
			message += 
		"location.href='"+request.getContextPath()+"/mypage/reaWishes';</script>";
		}else {
			message = "<script>alert('새 장바구니 상품 등록에 실패했습니다.');";
			//message += "location.href='/root/board/writeForm';</script>";
			message += 
		"location.href='"+request.getContextPath()+"/mypage/reaWishes'';</script>";
		}
		return message;
	}
	@Override
	public String insertUserCart(HttpServletRequest request, 
														HttpSession session, 
														int cartProductCounts,
														String cartProductId, 
														String cartProductFile1, 
														int cartProductPrice) {
	
		CartDTO cDto = new CartDTO();
		cDto.setCartId(UUID.randomUUID().toString().replace("-", ""));
		MemberDTO mDto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = mDto.getMemberIdx();
		cDto.setMemberId(LoginUserIdx);
		cDto.setCartProductCounts(cartProductCounts);
		cDto.setCartProductFile1(cartProductFile1);
		cDto.setCartProductId(cartProductId);
		cDto.setCartProductPrice(cartProductPrice);
		
		return getMessage(mapper.insertUserCart(cDto), request);
	}
}
