package com.care.root.product.controller;

import java.io.File;
import java.io.FileInputStream;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.care.root.product.service.ProductService;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired ProductService ps;
	@GetMapping("allview") // 모든 상품 보기
	public String allView(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.productView(model, num);
		return "product/allView";
	}
	@GetMapping("dogview/{kat}") // 강아지 카테고리 보기
	public String dogView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.katView(model, kat, num);
		return "product/dogView";
	}
	@GetMapping("catview/{kat}") // 고양이 카테고리 보기
	public String catView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.katView(model, kat, num);
		return "product/catView";
	}
	@GetMapping("recommendallview") // 모든 상품 인기도순 보기
	public String recommendAllView(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.recommendAllView(model, num);
		return "product/recommendAllView";
	}
	@GetMapping("recommenddogview/{kat}") // 강아지 인기도순 보기
	public String recommendDogView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.recommendKatView(model, kat, num);
		return "product/recommendDogView";
	}
	@GetMapping("recommendcatview/{kat}") // 고양이 인기도순 보기
	public String recommendCatView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.recommendKatView(model, kat, num);
		return "product/recommendCatView";
	}
	@GetMapping("priceallview") // 모든 상품 가격순 보기
	public String priceAllView(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.priceAllView(model, num);
		return "product/priceAllView";
	}
	@GetMapping("pricedogview/{kat}") // 강아지 가격순 보기
	public String priceDogView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.priceKatView(model, kat, num);
		return "product/priceDogView";
	}
	@GetMapping("pricecatview/{kat}") // 고양이 가격순 보기
	public String priceCatView(Model model, @PathVariable String kat, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.priceKatView(model, kat, num);
		return "product/priceCatView";
	}
	@GetMapping("scoreallview")
	public String scoreAllView(Model model, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.scoreAllView(model, num);
		return "product/scoreAllView";
	}
	@GetMapping("productdetail/{productId}/{productCategory}/{productName}") // 상품 상세 보기
	public String productDetail(Model model, @PathVariable String productId, @PathVariable String productCategory, @PathVariable String productName, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.relativeProduct(model, productCategory, productName, num);
		System.out.println("ps.relativeProduct 성공");
		ps.productDetail(model, productId);
		System.out.println("ps.productDetail 성공");
		ps.selectAllReviewList(model, productId, num);
		System.out.println("ps.selectAllReviewList 성공");
		String postId = ps.selectPostId(productId);
		System.out.println("controller_postId : "+postId+", productId : "+productId);
		ps.selectAllQnaQList(model, productId);
		System.out.println("ps.selectAllQnaQList 성공");
		ps.selectProductPost(model, productId);
		System.out.println("ps.selectProductPost 성공");
		return "product/productDetail";
	}
	@GetMapping("download") // 상품 이미지 가져오기
	public void download(@RequestParam("file") String fileName,
									HttpServletResponse response) 
											throws Exception {
		/*
		response.addHeader("Content-disposition", "attachment; fileName="+fileName);
		File file = new File("c:\\kgitbank\\image_repo\\"+fileName);
		FileInputStream in = new FileInputStream(file);
		FileCopyUtils.copy(in, response.getOutputStream());
		in.close();
		*/
	}
	@GetMapping("updaterecommend/{productId}/{productCategory}/{productName}") // 추천하고 상품 상세 창 다시 띄우기
	public String updaterecommend(Model model, @PathVariable String productId, @PathVariable String productCategory, @PathVariable String productName, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.relativeProduct(model, productCategory, productName, num);
		System.out.println("ps.relativeProduct 성공");
		ps.updateRecommendCounts(productId);
		System.out.println("ps.updateRecommendCounts 성공");
		ps.productDetail(model, productId);
		System.out.println("ps.productDetail 성공");
		ps.selectAllReviewList(model, productId, num);
		System.out.println("ps.selectAllReviewList 성공");
		ps.selectAllQnaQList(model, productId);
		System.out.println("ps.selectAllQnaQList 성공");
		ps.selectProductPost(model, productId);
		System.out.println("ps.selectProductPost 성공");
		return "product/productDetail";
	}
	@PostMapping("addqnaq/{productId}/{productCategory}/{productName}") // 문의하기
	public String addQnaQ(Model model, @PathVariable String productId, @RequestParam String questionContent, HttpSession session, @PathVariable String productCategory, @PathVariable String productName, @RequestParam(value="num", required=false, defaultValue="1") int num) {
		ps.relativeProduct(model, productCategory, productName, num);
		System.out.println("ps.relativeProduct 성공");
		ps.productDetail(model, productId);
		System.out.println("ps.productDetail 성공");
		ps.selectAllReviewList(model, productId, num);
		System.out.println("ps.selectAllReviewList 성공");
		ps.insertQnaQ(questionContent, session, productId);
		System.out.println("ps.insertQnaQ 성공");
		ps.selectAllQnaQList(model, productId);
		System.out.println("ps.selectAllQnaQList 성공");
		ps.selectProductPost(model, productId);
		System.out.println("ps.selectProductPost 성공");
		return "product/productDetail";
	}
	@GetMapping("insertcart/{productId}/{productCnt}")
	public String insertCart(HttpSession session, 
													@PathVariable String productId, 
													@PathVariable String productCnt) {
		System.out.println("String - "+productCnt);
		int productCounts = Integer.parseInt(productCnt);
		System.out.println("int - "+productCounts);
		ps.insertCart(session, productId, productCounts);
		return "redirect:/mypage/cart";
	}
}
