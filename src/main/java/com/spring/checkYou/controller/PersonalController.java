package com.spring.checkYou.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	// ���ο� �۾� �߰� ����
	@RequestMapping("/addNewWork")
	public String addNewWork(WorkDto dto) {
		String id = (String) session.getAttribute("userId");
		dto.setId(id);
		
		service.addNewWork(dto);
		return "addNewWorkPage";
	}
	
	// manageMyWorkPage �̵� - manageMyWorkPage������ ���� �߰��� �۾����� ���� �Ǵ� detail ���� �����ؼ� �� �۾������ ������ �� ����.
	@RequestMapping("/manageMyWorkPage")
	public String manageMyWorkPage(Model model) {
	
		service.manageMyWorkPage(model);
		
		return "manageMyWorkPage";
	}
	
	// �۾� ����
	@RequestMapping("/deleteWork")
	public String deleteWork(HttpServletRequest request) {
		String workname = request.getParameter("workname");
		String workdetail = request.getParameter("workdetail");
		String userId = (String)session.getAttribute("userId");
		// test
		System.out.println(workname);
		System.out.println(workdetail);
		System.out.println(userId);
		
		service.deleteWork(workname,workdetail,userId);
		
		return "redirect:/manageMyWorkPage";
	}
	
	// �۾� ����
	@RequestMapping("/startWork")
	public void startWork() {
		service.startWork();
		
	}
	
	@RequestMapping("/stopWork")
	public void stopWork() {
		service.stopWork();
	}
	
	
	
}
