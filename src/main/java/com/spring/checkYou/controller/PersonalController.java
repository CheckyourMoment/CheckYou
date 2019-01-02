package com.spring.checkYou.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.dto.WorkDto;
import com.spring.checkYou.service.PersonalService;

@Controller
public class PersonalController {

	// field
	@Autowired
	PersonalService service;

	@Autowired
	HttpSession session;

	// method

	// 새로운 작업 추가 로직
	@RequestMapping("/addNewWork")
	public String addNewWork(WorkDto dto) {
		String id = (String) session.getAttribute("userId");
		dto.setId(id);

		service.addNewWork(dto);
		return "addNewWorkPage";
	}

	// manageMyWorkPage 이동 - manageMyWorkPage에서는 내가 추가한 작업들을 삭제 또는 detail 등을 수정해서 내
	// 작업목록을 관리할 수 있음.
	@RequestMapping("/manageMyWorkPage")
	public String manageMyWorkPage(Model model) {
		service.manageMyWorkPage(model);

		return "manageMyWorkPage";
	}

	// 작업 삭제
	@RequestMapping("/deleteWork")
	public String deleteWork(HttpServletRequest request) {
		String workname = request.getParameter("workname");
		String workdetail = request.getParameter("workdetail");
		String userId = (String) session.getAttribute("userId");
		// test
		System.out.println(workname);
		System.out.println(workdetail);
		System.out.println(userId);

		service.deleteWork(workname, workdetail, userId);

		return "redirect:/manageMyWorkPage";
	}

	// 작업 시작
	@RequestMapping("/startWork")
	public void startWork(TimeSheetDto dto) {
		String id = (String) session.getAttribute("userId");
		dto.setId(id);

		service.startWork(dto);
	}

	// 오늘 시간관리표 보기
	@RequestMapping("/viewTable")
	public String viewTable(Model model) {

		service.viewTable(model);

		return "viewTable";
	}

	// 내 task 평가하기
	@RequestMapping("/evaluate")
	public String evaluate(TimeSheetDto dto, HttpServletRequest request) {
		System.out.println("evaluate()");

		String path = "redirect:viewTable";
		String evaluation = dto.getEvaluation();
		String id = (String) session.getAttribute("userId");

		dto.setId(id);
		service.evaluate(dto);

		String str = request.getParameter("this");

		if (str.equals("another")) {
			path = "redirect:searchTimeSheet";
		}

		return path;
	}

	// 내 timeSheet 삭제
	@RequestMapping("/deleteTimeSheet")
	public String deleteTimeSheet(TimeSheetDto dto,HttpServletRequest request) {
		System.out.println("deleteTimeSheet()");

		String path = "redirect:viewTable";

		String id = (String) session.getAttribute("userId");
		dto.setId(id);

		service.deleteTimeSheet(dto);

		String str = request.getParameter("this");
		if (str.equals("another")) {
			path = "redirect:searchTimeSheet";
		}

		return path;
	}

	@RequestMapping("/searchTimeSheet")
	public String searchTimeSheet(Model model, HttpServletRequest request) {
		System.out.println("searchTimeSheet()");

		String Date_TimeSheet = request.getParameter("Date_TimeSheet");
		String id = (String) session.getAttribute("userId");
		String onceSearched = (String) session.getAttribute("Date_TimeSheet");

		// 검색을 한 것이 아니면 == 평가 또는 삭제
		if (Date_TimeSheet == null) {
			Date_TimeSheet = onceSearched;
		}

		session.setAttribute("Date_TimeSheet", Date_TimeSheet);

		service.searchTimeSheet(Date_TimeSheet, id, model);

		return "searchTimeSheet";
	}

}
