package com.care.root.mypage.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.member.dto.MemberDTO;
import com.care.root.member.service.MemberService;
import com.care.root.mileage.service.MileageService;
import com.care.root.mybatis.product.ProductMapper;
import com.care.root.order.service.OrderService;
import com.care.root.product.service.ProductService;
import com.care.root.review.service.ReviewService;
import com.care.root.wish.service.WishService;

@Controller
@RequestMapping("mypage")
public class MypageController {
	@Autowired MemberService ms;
	@Autowired OrderService os;
	@Autowired WishService ws;
	@Autowired MileageService mls;
	@Autowired ReviewService rs;
	@Autowired ProductMapper mapper;
	/* 마이페이지 컨트롤러 */
	@GetMapping("mypage")
	public String mypage() {
		return "mypage/mypage";
	}
	
	@GetMapping("cart")
	public String cart(HttpSession session, Model model, HttpServletRequest re) {
		//System.out.println(re.getParameterValues("chtest"));
		//String[] str = re.getParameterValues("chtest");
		/*
		for(String productId : str) {
			System.out.println(productId);
		}
		*/
		String memberId = (String)session.getAttribute("loginUser");
		String memberIdx = mapper.selectMemberIdx(memberId);
		model.addAttribute("cart", mapper.selectCart(memberIdx));
		return "mypage/cart";
	}
//	myPage

	@GetMapping("readOrders")
	public String readOrders(MemberDTO dto,
														HttpServletRequest request, 
													    Model model, 
													    HttpSession session) {
		os.getUserOrdersDeleveryStates(request, model, session);
		os.getUserOrders(model, session);
		
		return "eunbin/readOrders";
	}
	
	@GetMapping("readWishes")
	public String readWishes(MemberDTO dto,
														HttpServletRequest request, 
													    Model model, 
													    HttpSession session) {
		ws.getUserWishes(model, session);
		return "eunbin/readWishes";
	}

	@GetMapping("readMileage")
	public String readMileage(MemberDTO dto,
														HttpServletRequest request, 
													    Model model, 
													    HttpSession session) {
		mls.getUserMileages(model, session);
		mls.getUserTotalMileage(model, session);
		mls.getUserMileageStateList(request, model, session);
		return "eunbin/readMileage";
	}
	
	@GetMapping("readUnusedMileage")
	public String readUnusedMileage(MemberDTO dto,
														HttpServletRequest request, 
													    Model model, 
													    HttpSession session) {
		mls.getUnusedUserMileages(model, session);
		mls.getUserTotalMileage(model, session);
		mls.getUserMileageStateList(request, model, session);
		return "eunbin/readMileage";
	}
	
	@GetMapping("/createReview")
	public String createReview(MemberDTO dto, 
															MultipartHttpServletRequest mul,
															HttpServletRequest request,
															HttpServletResponse response,
															@RequestParam(name= "orderProductId", required = false) String orderProductId,
															@RequestParam(name="orderProductName", required = false) String orderProductName
															) throws Exception
															{
		
		HttpSession session = request.getSession();
		session.setAttribute("orderProductId", orderProductId );														
		session.setAttribute("orderProductName", orderProductName );
		
		return "eunbin/createReview";
	}
	
	@PostMapping("saveReview")
	public void saveReview(MemberDTO dto, 
			MultipartHttpServletRequest mul,
			HttpServletRequest request,
			HttpServletResponse response) throws Exception{
		
		String message = rs.reviewSave(mul, request, "test");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(message);
		
	}
}
