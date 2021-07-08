package com.care.root.wish.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.product.service.ProductService;
import com.care.root.wish.service.WishService;

@RestController
@RequestMapping("/wish")
public class WishController {
	@Autowired WishService ws;
	@GetMapping("/readWishes")
	public String createReview() {
		return "eunbin/readWishes";
	}
	
	@ResponseBody
	@PostMapping(value="deleteUserWishes", produces = "application/json; charset=utf-8")
	public String deleteUserWishes(
												@RequestBody Map<String, String> map,
												HttpServletRequest request) {
		try {
			System.out.println("wishController");
			System.out.println(map.get("wishId"));
			ws.deleteUserWishes(map.get("wishId"), request);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "eunbin/readWishes";
	}
}
