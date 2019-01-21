package com.spring.checkYou.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.service.GroupService;

@Controller
public class GroupController {

	// field
	@Autowired
	HttpSession session;
	
	@Autowired
	GroupService service;
	
	
	// method

	
	
	// group 추가
	@RequestMapping("/addGroup")
	public String addGroup(GroupDto dto) {
		String constructor = (String) session.getAttribute("userId");
		dto.setConstructor(constructor);

		service.addGroup(dto);
		return "MakeGroupPage";
	}
	
	
	// goup_home으로 이동 : 현재 세선의 id와 멤버들의 id에 해당하는 그룹을 db에 접근해서 뿌려줘야한다.
		@RequestMapping("/groupHome")
		public String groupHome(Model model) {
			System.out.println("groupHome()");
			
			// 자신이 만든 그룹을 홈에 뿌려줌
			String id = (String) session.getAttribute("userId");
			service.groupList_owner(model, id);
			
			/*
			// 자신이 속한 그룹을 뿌려줌(자신은 멤버)
			service.groupList_member(model, id);
			*/
			
			return "group_home";
	}
		
		@RequestMapping("/selectGroup")
		public String selectGroup(HttpServletRequest request) {
			System.out.println("selectGroup()");
			
			String groupName = request.getParameter("groupName");
			session.setAttribute("selectedGroup", groupName);
			
			
			return "selectedGroup";
		}
		
		
}
