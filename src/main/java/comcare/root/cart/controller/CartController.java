package comcare.root.cart.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.cart.service.CartService;
import com.care.root.member.dto.MemberDTO;
import com.care.root.review.service.ReviewService;

@Controller
@RequestMapping("cart")
public class CartController {
	@Autowired CartService cs;
	
	@PostMapping("insertUserCart")
	public void insertUserCart(MemberDTO dto,
			HttpSession session,
			HttpServletRequest request,
			@RequestParam(value="cartProductCounts", defaultValue="cartProductCounts") int cartProductCounts,
			@RequestParam(value="cartProductId", defaultValue="cartProductId") String cartProductId, 
			@RequestParam(value="cartProductFile1", defaultValue="cartProductFile1") String cartProductFile1, 
			@RequestParam(value="cartProductPrice", defaultValue="cartProductPrice") int cartProductPrice,
			HttpServletResponse response) throws Exception{
		
		System.out.println(cartProductCounts);
		System.out.println(cartProductId);
		System.out.println(cartProductFile1);
		System.out.println(cartProductPrice);
		
//		String message = cs.insertUserCart(request, 
//																				session, 
//																				cartProductCounts, 
//																				cartProductId, 
//																				cartProductFile1, 
//																				cartProductPrice);
//		response.setContentType("text/html; charset=utf-8");
//		PrintWriter out = response.getWriter();
//		out.print(message);
	}
}
