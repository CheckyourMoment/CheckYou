package com.spring.checkYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.checkYou.dto.CommentDto;
import com.spring.checkYou.service.CommentService;

@Controller
public class CommentController {
	// field
	@Autowired
	HttpSession session;

	@Autowired
	CommentService service;

	// method
	//comment 추가
	@RequestMapping("/addComment")
	public String addComment(CommentDto dto, HttpServletRequest request) {
		String constructor = (String) session.getAttribute("userId");
		dto.setConstructor(constructor);
		
		service.addComment(dto);
		return "GComment";
	}
	
	

}
