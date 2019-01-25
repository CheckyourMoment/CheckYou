package com.spring.checkYou.controller;

import java.util.ArrayList;
import java.util.Iterator;

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
	public String addGroup(GroupDto dto, Model model) {
		String constructor = (String) session.getAttribute("userId");
		dto.setConstructor(constructor);
		dto.setMemocount("0");
		service.addGroup(dto,model);
		return "MakeGroupPage";
	}

	// goup_home으로 이동 : 현재 세선의 id와 멤버들의 id에 해당하는 그룹을 db에 접근해서 뿌려줘야한다.
	@RequestMapping("/groupHome")
	public String groupHome(Model model) {
		System.out.println("groupHome()");

		// 자신이 만든 그룹을 홈에 뿌려줌
		String id = (String) session.getAttribute("userId");
		service.groupList_owner(model, id);

		// 자신이 속한 그룹을 뿌려줌(자신은 멤버)
		service.groupList_member(model, id);

		return "group_home";
	}

	// Group 선택
	@RequestMapping("/selectGroup")
	public String selectGroup(HttpServletRequest request, Model model) {
		System.out.println("selectGroup()");

		String groupName = request.getParameter("groupName");
		String constructor = request.getParameter("constructor");
		
		if (groupName != null && constructor != null) {
			session.setAttribute("selectedGroup", groupName);
			session.setAttribute("constructor", constructor);
		}
		
		// 선택된 그룹의 메모개수를 세션에 저장하는 로직(selectedGroup에 올때 마다 갱신)
		String memocount = memoCount();
		System.out.println((String)session.getAttribute("selectedGroup")+"의 메모개수는"+memocount+"개 입니다.");
		session.setAttribute("memoCount", memocount);
		
		// 선택된 그룹의 메모의 데이터를 session에 저장한 후 메모 Element.value에 넣어 wholeMemo()호출하여 메모를 유지시키기 위해
		loadMemoData(model);

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
	public String addMember(GroupMemberDto dto, Model model) {
		String userId = (String) session.getAttribute("constructor");
		dto.setConstructor(userId);
		String groupName = (String) session.getAttribute("selectedGroup");
		dto.setGroupname(groupName);
		dto.setAcception("0");

		boolean alreadyExist = service.addMemberCheck(dto);

		if (alreadyExist == true) {
			System.out.println("추가하려는 멤버는 이미 목록에 있거나, 수락을 기다리는 중 입니다.");
			model.addAttribute("invite", "fail");
		} else {
			service.addMember(dto);
			System.out.println("초대하였습니다.");
			model.addAttribute("invite", "success");
		}

		return "addMemberPage";
	}

	// 그룹 멤버 목록
	@RequestMapping("/MemberList")
	public String MemberList(Model model, GroupMemberDto dto) {

		String constructor = (String) session.getAttribute("constructor");
		String groupName = (String) session.getAttribute("selectedGroup");

		// 그룹에 속해있는 사용자
		dto.setConstructor(constructor);
		dto.setGroupname(groupName);
		dto.setAcception("1");
		service.memberList(model, dto);

		// 그룹에 초대했지만 아직 수락하지 않은 사용자
		dto.setAcception("0");
		service.inviteList(model, dto);

		return "MemberList";
	}

	// 요청받은 초대목록을 보여주는 로직
	@RequestMapping("/requestPage")
	public String requestPage(Model model, GroupMemberDto dto) {

		String constructor = (String) session.getAttribute("constructor");
		String groupName = (String) session.getAttribute("selectedGroup");
		String groupmember = (String) session.getAttribute("userId");

		dto.setConstructor(constructor);
		dto.setGroupname(groupName);
		dto.setGroupmember(groupmember);
		dto.setAcception("0");

		service.requestPage(model, dto);

		return "requestPage";
	}

	// 초대요청 수락
	@RequestMapping("/accept")
	public String accept(HttpServletRequest request, GroupMemberDto dto) {
		System.out.println("accept()");

		service.accept(dto);

		return "redirect:requestPage";
	}

	// 초대요청 거절
	@RequestMapping("/refuse")
	public String refuse(HttpServletRequest request, GroupMemberDto dto) {
		System.out.println("refuse()");

		service.refuse(dto);

		return "redirect:requestPage";
	}

	// 멤버 삭제
	@RequestMapping("/deleteMember")
	public String deleteMember(HttpServletRequest request, GroupMemberDto dto) {
		System.out.println("deleteMember() in controller");

		String constructor = (String) session.getAttribute("constructor");
		String groupName = (String) session.getAttribute("selectedGroup");
		String groupmember = request.getParameter("groupmember");

		dto.setConstructor(constructor);
		dto.setGroupname(groupName);
		dto.setGroupmember(groupmember);
		dto.setAcception("1");

		service.deleteMember(dto);

		return "redirect:MemberList";
	}

	// 초대요청 취소
	@RequestMapping("/cancelInvite")
	public String cancelInvite(HttpServletRequest request, GroupMemberDto dto) {
		System.out.println("cancelInvite() in controller");

		String constructor = (String) session.getAttribute("constructor");
		String groupName = (String) session.getAttribute("selectedGroup");
		String groupmember = request.getParameter("groupmember");

		dto.setConstructor(constructor);
		dto.setGroupname(groupName);
		dto.setGroupmember(groupmember);
		dto.setAcception("0");

		service.cancelInvite(dto);

		return "redirect:MemberList";
	}

	// 그룹 삭제
	@RequestMapping("/deleteGroup")
	public String deleteGroup(HttpServletRequest request) {
		System.out.println("deleteGroup() in controller");

		String groupname = request.getParameter("groupname");
		service.deleteGroup(groupname);

		return "redirect:groupHome";
	}

	// 멤버들의 오늘 시간관리표 보기 : 현재 무엇을 하고있고 무엇을 했는지 파악하기 위함
	@RequestMapping("/viewMemberTable")
	public String viewMemberTable(Model model, HttpServletRequest request) {
		String member = request.getParameter("groupmember");
		
		service.viewMemberTable(model,member);

		return "viewTable";
	}

	// 해당 그룹에 메모가 몇개 등록되어 있는지 확인하기 위한 로직
	public String memoCount() {
		System.out.println("memoCount() in controller");
		
		String groupname = (String)session.getAttribute("selectedGroup");
		System.out.println(groupname);
		
		String memocount = service.memoCount(groupname);
		
		return memocount;
	}
	
	// 새로운 메모를 추가하면 그룹의 메모개수를 1개 증가하여 데이터베이스에 update시키는 로직
	@RequestMapping("/increaseMemoCount")
	public String increaseMemoCount(HttpServletRequest request) {
		System.out.println("increaseMemoCount() in controller");
		
		String groupname = (String)session.getAttribute("selectedGroup");
		String increasedMemoCount = request.getParameter("increasedMemoCount");
		System.out.println("increasedMemoCount : "+increasedMemoCount);
		
		service.increaseMemoCount(increasedMemoCount,groupname);
		
		// 메모 저장
		String count = request.getParameter("count");
		int j = Integer.parseInt(count);
		ArrayList memoList = new ArrayList();
		ArrayList colorList = new ArrayList();
		
		for(int i = 1; i<=j ; i++) {
			String memo = request.getParameter("memo"+i);
			String memoColor = request.getParameter("memoColor"+i);
			memoColor = "#"+memoColor;
			//test
			System.out.println("colorList의 색상들 입니다. : "+memoColor);
			
			memoList.add(memo);
			colorList.add(memoColor);
		}
		deleteMemoForSave();
		service.saveMemo(memoList);
		
		service.saveColor(colorList);
		
		// 실제로 빈 메모를 생성
		addNewMemo(groupname, increasedMemoCount);
		
		return "redirect:selectGroup";
	}
	
	// 새로운 메모생성버튼 클릭시 DB에서 그룹의 메모개수는 갱신되지만 실제 메모가 생성되진않는 문제가 발생. 이를 위해 실제로 새로운 빈 메모를 DB에 생성하는 로직
	public void addNewMemo(String groupname, String newMemoNum) {
		service.addNewMemo(groupname, newMemoNum);
	}
	
	
	// 메모 저장
	@RequestMapping("/saveMemo")
	public String saveMemo(HttpServletRequest request) {
		System.out.println("saveMemo() in controller");
		
		String moveTo = request.getParameter("moveTo");
		
		String count = request.getParameter("count");
		int j = Integer.parseInt(count);
		
		ArrayList memoList = new ArrayList();
		ArrayList colorList = new ArrayList();
		
		for(int i = 1; i<=j ; i++) {
			String memo = request.getParameter("memo"+i);
			String memoColor = request.getParameter("memoColor"+i);
			memoColor = "#"+memoColor;
			//test
			System.out.println("colorList의 색상들 입니다. : "+memoColor);
			
			memoList.add(memo);
			colorList.add(memoColor);
		}
		deleteMemoForSave();
		service.saveMemo(memoList);
		
		service.saveColor(colorList);
		
		return "redirect:"+moveTo;
	}
	
	// 해당 그룹의 메모 데이터를 로드해오는 로직
	@RequestMapping("/loadMemoData")
	public void loadMemoData(Model model) {
		System.out.println("loadMemoData() in controller");
		
		String groupname = (String)session.getAttribute("selectedGroup");
		String memoCount = (String)session.getAttribute("memoCount");
		
		service.loadMemoData(groupname,memoCount,model);
		
	}
	
	// 모든 모든 메모삭제 로직 : 메모를 갱신하기 위해선 모든 메모를 삭제하고 다시 저장해야한다.
	public void deleteMemoForSave() {
		System.out.println("deleteMemoForSave() in controller");
		
		String groupname = (String)session.getAttribute("selectedGroup");
		service.deleteMemoForSave(groupname);
	}
	
	// 하나의 메모삭제
	@RequestMapping("/deleteOneMemo")
	public String deleteOneMemo(HttpServletRequest request) {
		System.out.println("deleteOneMemo() in controller");
		
		// 메모 데이터 및 색상 저장
		String count = request.getParameter("count");
		int j = Integer.parseInt(count);
		ArrayList memoList = new ArrayList();
		ArrayList colorList = new ArrayList();
				
		for(int i = 1; i<=j ; i++) {
			String memo = request.getParameter("memo"+i);
			String memoColor = request.getParameter("memoColor"+i);
			memoColor = "#"+memoColor;
			//test
			System.out.println("colorList의 색상들 입니다. : "+memoColor);
					
			memoList.add(memo);
			colorList.add(memoColor);
		}
		deleteMemoForSave();
		service.saveMemo(memoList);
		service.saveColor(colorList);
		// 메모삭제
		String deleteNum = request.getParameter("deleteNum");
		service.deleteOneMemo(deleteNum);
		
		return "redirect:selectGroup";
	}
	
	// 메모 색상 변경
	@RequestMapping("/changeMemoColor")
	public String changeMemoColor(HttpServletRequest request) {
		System.out.println("changeMemoColor() in controller");
		
		// 메모 데이터 및 색상 저장
		String count = request.getParameter("count");
		int j = Integer.parseInt(count);
		ArrayList memoList = new ArrayList();
		ArrayList colorList = new ArrayList();
		
		for(int i = 1; i<=j ; i++) {
			String memo = request.getParameter("memo"+i);
			String memoColor = request.getParameter("memoColor"+i);
			memoColor = "#"+memoColor;
			//test
			System.out.println("colorList의 색상들 입니다. : "+memoColor);
			
			memoList.add(memo);
			colorList.add(memoColor);
		}
		deleteMemoForSave();
		service.saveMemo(memoList);
		
		service.saveColor(colorList);
		
		
		// 메모 색 바꾸기
		String changeNum = request.getParameter("changeNum");
		String color = request.getParameter("color");
		String memoColor = "#"+color;
		System.out.println(memoColor);
		
		service.changeMemoColor(changeNum, memoColor);
		
		return "redirect:selectGroup";
	}
	
	
	
}
