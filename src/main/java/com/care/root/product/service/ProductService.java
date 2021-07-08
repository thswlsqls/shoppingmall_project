package com.care.root.product.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.care.root.qna.dto.QnaADTO;

public interface ProductService {
	public void productView(Model model, int num); // 모든 상품 보기
	public void katView(Model model, String kat, int num); // 카테고리 보기
	public void recommendAllView(Model model, int num); // 모든 상품 인기도순 보기
	public void recommendKatView(Model model, String kat, int num); // 카테고리 인기도순 보기
	public void priceAllView(Model model, int num); // 모든 상품 가격순 보기
	public void priceKatView(Model model, String kat, int num); // 카테고리 가격순 보기
	public void scoreAllView(Model model, int num);
	public void productDetail(Model model, String productId); // 상품 상세 보기
	public void selectAllReviewList(Model model, String productId, int num); // 상품 상세 보기 창에서 평점들 출력
	public void updateRecommendCounts(String productId); // 추천 기능
	public void selectAllQnaQList(Model model, String productPostId); // 문의 리스트 출력 
	public QnaADTO selectQnaAList(String productId); // 답변 출력
	public void insertQnaQ(String questionContent, HttpSession session, String productPostId); // 문의하기
	public void relativeProduct(Model model, String kat, String productId, int num); // 관련 상품 가져오기
	public void selectProductPost(Model model, String productId); // 상품 게시글 정보 가져오기
	public String selectPostId(String productId);
	//public void selectProductScore(Model model, String productId); // 상품 평점 점수만 가져오기
	public void insertCart(HttpSession session, String productId, int productCounts);
}
