package com.care.root.mybatis.product;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.care.root.cart.dto.CartDTO;
import com.care.root.product.dto.ProductDTO;
import com.care.root.productPost.dto.ProductPostDTO;
import com.care.root.qna.dto.QnaADTO;
import com.care.root.qna.dto.QnaQDTO;
import com.care.root.review.dto.ReviewDTO;

public interface ProductMapper {
	public ArrayList<ProductDTO> selectAllProductList(@Param("s") int start, @Param("e") int end); // 모든 상품 가져오기
	public int selectProductCount(); // 상품 총 개수 가져오기
	public ArrayList<ProductDTO> selectAllKategorieList(@Param("k") String kat, @Param("s") int start, @Param("e") int end); // 선택된 카테고리 모두 가져오기
	public int selectKategorieCount(String kat); // 선택된 카테고리 총 개수 가져오기
	public ArrayList<ProductDTO> selectRecommendAllProductList(@Param("s") int start, @Param("e") int end); // 모든 상품 인기도순 가져오기
	public ArrayList<ProductDTO> selectRecommendAllKategorieList(@Param("k") String kat, @Param("s") int start, @Param("e") int end); // 카테고리 인기도순 가져오기
	public ArrayList<ProductDTO> selectPriceAllProductList(@Param("s") int start, @Param("e") int end); // 모든 상품 가격순 가져오기
	public ArrayList<ProductDTO> selectPriceAllKategorieList(@Param("k") String kat, @Param("s") int start, @Param("e") int end); // 카테고리 가격순 가져오기
	public ArrayList<ProductDTO> selectScoreAllProductList(@Param("s") int start, @Param("e") int end);
	public ProductDTO selectAllProductDetail(@Param("p") String productId); // 상품 상세 보기
	public ArrayList<ReviewDTO> selectAllReviewList(@Param("p") String postId, @Param("s") int start, @Param("e") int end); // 상품 상세보기 창에서 평점들 출력
	public Map<String, Object> selectProductScore(@Param("p") String postId); // 상품 평점 점수만 가져오기
	public int selectScoreCount(@Param("p") String productId); // 평점 개수 가져오기
	public int selectRelProductCount(@Param("k") String kat);
	public String selectPostId(@Param("p") String productId); // postId 값 가져오기
	public void updateRecommendCounts(@Param("p") String productId); // 추천 기능
	public ArrayList<QnaQDTO> selectAllQnaQList(@Param("p") String postId); // 문의 리스트 출력 
	public QnaADTO selectQnaAList(@Param("q") String questionId); // 답변 가져오기
	public void insertQnaQ(QnaQDTO dto); // 문의하기
	public ArrayList<ProductDTO> selectRelativeProduct(@Param("p") String productId, @Param("k") String kat, @Param("s") int start, @Param("e") int end); // 관련 상품 가져오기
	public ProductPostDTO selectProductPost(@Param("p") String productId); // 상품 게시글 정보 가져오기
	public ArrayList<CartDTO> selectCart(@Param("x") String memberIdx); // 장바구니 모두 가져오기
	public String selectMemberIdx(@Param("m") String memberId);
	public int checkCart(@Param("x") String memberIdx, @Param("p") String productId);
	public void updateCart(@Param("c") int productCounts, @Param("x") String memberIdx, @Param("p") String productId);
	public void deleteCart(@Param("x") String memberIdx, @Param("p") String productId);
	public void insertCart(CartDTO dto);
	public String selectFile(@Param("n") String productName);
	public int selectPrice(@Param("n") String productName);
	public String selectProductName(@Param("p") String productId);
}
