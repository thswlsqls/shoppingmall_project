package com.care.root.review.service;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.care.root.board.service.BoardFileService;
import com.care.root.board.service.BoardFileServiceImpl;
import com.care.root.member.dto.MemberDTO;
import com.care.root.mybatis.review.ReviewMapper;
import com.care.root.mybatis.wish.WishMapper;
import com.care.root.review.dto.ReviewDTO;

@Service
public class ReviewServiceImpl implements ReviewService{
	@Autowired ReviewMapper mapper;

	@Override
	public String reviewSave(MultipartHttpServletRequest mul, 
													  HttpServletRequest request,
													  @RequestParam(value="orderProductId", defaultValue="ProductId") String orderProductId) {
		ReviewDTO rDto = new ReviewDTO();
		HttpSession session = request.getSession();
		rDto.setReviewId(UUID.randomUUID().toString().replace("-", ""));
		rDto.setReviewTitle(mul.getParameter("title"));
		rDto.setProductScore(Integer.parseInt(mul.getParameter("score")));
		rDto.setProductDegree(mul.getParameter("degree"));
		rDto.setReviewContent(mul.getParameter("content"));
		rDto.setProductId((String)session.getAttribute("orderProductId"));
		rDto.setProductName((String)session.getAttribute("orderProductName"));
		
		System.out.println("------------------");
		System.out.println((String)session.getAttribute("orderProductId"));
		System.out.println((String)session.getAttribute("orderProductName"));
		
		MemberDTO mDto = (MemberDTO) session.getAttribute("userSessionData");
		String LoginUserIdx = mDto.getMemberIdx();
		rDto.setReviewWriterIdx(LoginUserIdx);
		
		MultipartFile file = mul.getFile("image_file_name");
		ReviewFileService rfs = new ReviewFileServiceImpl();
		
		if( file.isEmpty() ) { // 파일이 비워있으면 true
			rDto.setProductFile1("nan");
		}else { //파일이 존재하는 경우
			rDto.setProductFile1( rfs.saveFile(file) );
		}
		/*
		int result = mapper.writeSave(dto);
		String message = bfs.getMessage(result, request);
		return message;
		*/
		System.out.println(rDto);
		System.out.println("ReviewWriterIdx" + rDto.getReviewWriterIdx());
		System.out.println(rDto.getReviewTitle());
		System.out.println(rDto.getReviewId());
		System.out.println(rDto.getReviewContent());
		System.out.println(rDto.getProductScore());
		System.out.println(rDto.getProductName()); //null 들어옴
		System.out.println(rDto.getProductId()); //null 들어옴
		System.out.println(rDto.getProductDegree());
		System.out.println(rDto.getProductFile1()); //20210703101228-흡수혁명 애견패드 소형 50매2.jpg
		
		return rfs.getMessage(mapper.reviewSave(rDto), request);
	}

}
