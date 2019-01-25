package com.spring.checkYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.checkYou.dto.CommentDto;
import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.service.CommentService;

@Controller
public class CommentController {
	// field
	@Autowired
	HttpSession session;

	@Autowired
	CommentService service;

	// method
	// 내용유지
	@RequestMapping("/comment")
	public String comment(Model model, HttpServletRequest request) {
		String groupName = (String) session.getAttribute("selectedGroup");
		// String content = request.getParameter("groupComment");
		// service.keepComment(model, content);
		return "GComment";
	}

	// 추가
	@RequestMapping("/addComment")
	public String GComment(CommentDto dto) {
		String groupName = (String) session.getAttribute("selectedGroup");
		String constructor = (String) session.getAttribute("constructor");
		service.addComment(dto);
		return "GComment";
	}
}
