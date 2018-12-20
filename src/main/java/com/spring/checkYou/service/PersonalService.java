package com.spring.checkYou.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IPersonalDao;
import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.dto.WorkDto;
import com.spring.checkYou.util.Formatter;

@Service
public class PersonalService {
	@Autowired
	SqlSession sqlSession;

	@Autowired
	HttpSession session;

	@Autowired
	Formatter formatter;

	// method

	// 새로운 작업 추가

	public void addNewWork(WorkDto dto) {

		String id = dto.getId();
		String worktype = dto.getWorktype();
		String workname = dto.getWorkname();
		String workdetail = dto.getWorkdetail();

		IPersonalDao dao = sqlSession.getMapper(IPersonalDao.class);


		String check = dao.checkWork(workname);
		System.out.println("checkwork query test : " + check);

		if (check == null) {
			System.out.println("success adding newWork");
			dao.addNewWork(id, worktype, workname, workdetail);
		} else {
			System.out.println("this workname is already exist");
		}

	}

	public void manageMyWorkPage(Model model) {

		String id = (String) session.getAttribute("userId");
		List<Object> ManageWorklist = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.manageMyWorkPage",
				id);
		model.addAttribute("ManageWorklist", ManageWorklist);
	}


	// 작업 삭제

	public void deleteWork(String workname, String workdetail, String id) {

		IPersonalDao dao = sqlSession.getMapper(IPersonalDao.class);
		dao.deleteWork(workname, workdetail, id);
	}


	public void startWork(TimeSheetDto dto) {

		// 오늘 날짜 구하기
		Date d = new Date();
		String today = formatter.getFormatter_Date().format(d);

		System.out.println("오늘 날짜 : " + today);

		// 작업 시작 시간 구하기
		Date start = new Date();

		String startTime = formatter.getFormatter_Time().format(start);
		System.out.println("시작 시각: " + startTime);

		dto.setStarttime(startTime);
		dto.setCreateddate(today);

		IPersonalDao dao = sqlSession.getMapper(IPersonalDao.class);
		dao.startWork(dto);

	}


	public void stopWork() {

		// 작업 종료 시간 구하기
		Date end = new Date();
		String endTime = formatter.getFormatter_Time().format(end);

	}

	public void viewTable(Model model) {
		Date d = new Date();
		String createddate = formatter.getFormatter_Date().format(d);
		
		String id = (String) session.getAttribute("userId");
		System.out.println(id);
		
		TimeSheetDto dto = new TimeSheetDto();
		dto.setId(id);
		dto.setCreateddate(createddate);
		
		List<Object> timeSheet_today = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.viewTable",dto);
		model.addAttribute("timeSheet_today", timeSheet_today);


	}

}
