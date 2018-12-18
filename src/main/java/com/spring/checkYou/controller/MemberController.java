package com.spring.checkYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.MemberDto;
import com.spring.checkYou.dto.WorkDto;
import com.spring.checkYou.service.MemberService;

@Controller
public class MemberController {

	// field
	@Autowired
	MemberService service;
	
	@Autowired
	HttpSession session;
	
	
	// method
	
	// ȸ������
	@RequestMapping("/join")
	public String join(MemberDto dto) {		// HttpServletRequest request
		service.join(dto);
		return "login";
	}
	
	// �α���
	@RequestMapping("/login")
	public String login(Model model, MemberDto dto) {
		String path="null";
		path = service.login(dto);
		
		return path;
	}
	
	// ���� ȭ�� : ���� �߰��� work list���� �ֱ� ������ DB���� �ʿ�, �۾������� �۾��̸��� �̾ƿͼ� + 2. main.jsp���� �Ѹ���.
	@RequestMapping("/dailyManagement")
	public String dailyManagementPage(Model model) {
		String id = (String)session.getAttribute("userId");
		
		service.dailyManagementPage(model, id);
		
		return "main";
	}
	
	// ģ�� ã�� 
	@RequestMapping("/searchFriend")
	public String searchFriend(Model model, HttpServletRequest request) {
		
		String id = request.getParameter("searchFriend");
		
		service.searchFriend(model, id);
		
		return "searchFriendPage";
	}
	
	// ģ�� �߰�
	@RequestMapping("/addFriend")
	public String addFriend(FriendDto dto) {
		String userId = (String)session.getAttribute("userId");
		dto.setId(userId);
		
		// test
		System.out.println("���� ȸ���� : "+dto.getId());
		System.out.println("�߰��Ϸ��� ���̵� : "+dto.getFriend());
		
		boolean alreadyExist = service.addFriendCheck(dto);
		
		if(alreadyExist==true) {
			System.out.println("�߰��Ϸ��� ģ���� �̹� ģ����Ͽ� �ֽ��ϴ�.");
		}else {
			service.addFriend(dto);
			System.out.println("ģ���߰� �Ϸ�Ǿ����ϴ�.");
		}
		
		return "searchFriendPage";
	}
	
	// ģ�� ���
	@RequestMapping("/friendList")
	public String friendList(Model model) {
		String userId = (String)session.getAttribute("userId");
		
		service.friendList(model ,userId);
		
		return "friendList";
	}
	
	
}
