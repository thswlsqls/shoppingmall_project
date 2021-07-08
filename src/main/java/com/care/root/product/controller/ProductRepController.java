package com.care.root.product.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.care.root.product.service.ProductService;
import com.care.root.qna.dto.QnaADTO;

@RestController
public class ProductRepController {
	@Autowired ProductService ps;
	@PostMapping(value="qnaaview", 
			produces = "application/json; charset=utf-8")
	@ResponseBody
	public QnaADTO qnaAView(@RequestBody Map<String,Object> questionId) { // 문의 글 누르면 답변 가져오기
		System.out.println(questionId.get("questionId"));
		return ps.selectQnaAList((String)questionId.get("questionId"));
	}
}
