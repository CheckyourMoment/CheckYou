package com.spring.checkYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.dto.GroupMemberDto;
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
		 * // 자신이 속한 그룹을 뿌려줌(자신은 멤버) service.groupList_member(model, id);
		 */

		return "group_home";

	}

	// Group 선택
	@RequestMapping("/selectGroup")
	public String selectGroup(HttpServletRequest request) {
		System.out.println("selectGroup()");
		String groupName = request.getParameter("groupName");
		session.setAttribute("selectedGroup", groupName);
		String constructor = request.getParameter("constructor");
		session.setAttribute("constructor", constructor);
		return "selectedGroup";
	}

	// 멤버 찾기
	@RequestMapping("/searchMember")
	public String searchMember(Model model, HttpServletRequest request) {
		String id = request.getParameter("searchMember");
		service.searchMember(model, id);
		return "addMemberPage";
	}

	// 멤버 추가
	@RequestMapping("/addMember")
	public String addMember(GroupMemberDto dto) {
		String userId = (String) session.getAttribute("constructor");
		dto.setConstructor(userId);
		String groupName = (String) session.getAttribute("selectedGroup");
		dto.setGroupname(groupName);
		dto.setAcception("0");
		// test
		System.out.println("constructor: " + dto.getConstructor());
		System.out.println("invite " + dto.getGroupmember());
		System.out.println("groupName : " + dto.getGroupname());

		boolean alreadyExist = service.addMemberCheck(dto);

		if (alreadyExist == true) {
			System.out.println("추가하려는 멤버는 이미 목록에 있거나, 수락을 기다리는 중 입니다.");
		} else {
			service.addMember(dto);
			System.out.println("초대하였습니다.");

		}

		return "addMemberPage";
	}

	// 그룹 멤버 목록
	@RequestMapping("/MemberList")
	public String MemberList(Model model, GroupMemberDto dto) {

		String constructor = (String) session.getAttribute("constructor");
		String groupName = (String) session.getAttribute("selectedGroup");

		dto.setConstructor(constructor);
		dto.setGroupname(groupName);
		dto.setAcception("1");
		service.memberList(model, dto);

		dto.setAcception("0");
		service.inviteList(model, dto);

		return "MemberList";
	}

	// 그룹에 초대했지만 아직 수락하지 않은 사용자


}
