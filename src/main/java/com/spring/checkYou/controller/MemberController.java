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
	

		// 회원가입

	@RequestMapping("/join")
	public String join(MemberDto dto) {		// HttpServletRequest request
		service.join(dto);
		return "login";
	}
	
	// 로그인
	@RequestMapping("/login")
	public String login(Model model, MemberDto dto) {
		String path="null";
		path = service.login(dto);
		
		return path;
	}
	

	// 메인 화면 : 내가 추가한 work list들이 있기 때문에 DB접근 필요, 작업종류와 작업이름을 뽑아와서 + 2. main.jsp에서 뿌린다.
	@RequestMapping("/dailyManagement")
	public String dailyManagementPage(Model model) {
		String id = (String)session.getAttribute("userId");
		
		service.dailyManagementPage(model, id);
		
		return "main";
	}
	

	// 친구 찾기 

	@RequestMapping("/searchFriend")
	public String searchFriend(Model model, HttpServletRequest request) {
		
		String id = request.getParameter("searchFriend");
		
		service.searchFriend(model, id);
		
		return "searchFriendPage";
	}
	
	// 친구 추가
	@RequestMapping("/addFriend")
	public String addFriend(FriendDto dto) {
		String userId = (String)session.getAttribute("userId");
		dto.setId(userId);
		

		// test
		System.out.println("현재 회원명: "+dto.getId());
		System.out.println("추가하려는 아이디 : "+dto.getFriend());
		
		boolean alreadyExist = service.addFriendCheck(dto);
		
		if(alreadyExist==true) {
			System.out.println("추가하려는 친구는 이미 친구목록에 있습니다.");
		}else {
			service.addFriend(dto);
			System.out.println("친구추가 완료되었습니다.");

		}
		
		return "searchFriendPage";
	}
	
	// 친구 목록
	@RequestMapping("/friendList")
	public String friendList(Model model) {
		String userId = (String)session.getAttribute("userId");
		
		service.friendList(model ,userId);
		
		return "friendList";
	}
	
	// timeContainerTest
	@RequestMapping("/timeContainerTest")
	public String timeContainerTest(HttpServletRequest request) {
		
		String hour = request.getParameter("hour");
		String minute = request.getParameter("minute");
		String second = request.getParameter("second");
		String mapping = request.getParameter("mapping");
		// test
		System.out.println(hour+":"+minute+":"+second+"mapping = "+mapping);
		
		session.setAttribute("timeContainer_hour", hour);
		session.setAttribute("timeContainer_minute", minute);
		session.setAttribute("timeContainer_second", second);
		
		return "redirect:"+ mapping;
	}
	
	
}
