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

	// ���ο� �۾� �߰�
	public void addNewWork(WorkDto dto) {

		String id = dto.getId();
		String worktype = dto.getWorktype();
		String workname = dto.getWorkname();
		String workdetail = dto.getWorkdetail();

		IPersonalDao dao = sqlSession.getMapper(IPersonalDao.class);
		/*
		 * // �۾��� �ߺ� test String check = dao.checkWork(workname);
		 * System.out.println("checkwork query test : "+check);
		 * 
		 * if(check==null) { System.out.println("success adding newWork");
		 * dao.addNewWork(id,worktype,workname,workdetail); }else {
		 * System.out.println("this workname is already exist"); }
		 */
		dao.addNewWork(id, worktype, workname, workdetail);

	}

	// �� �۾� ���� ������
	public void manageMyWorkPage(Model model) {

		String id = (String) session.getAttribute("userId");
		List<Object> ManageWorklist = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.manageMyWorkPage",
				id);
		model.addAttribute("ManageWorklist", ManageWorklist);
	}

	// �۾� ����
	public void deleteWork(String workname, String workdetail, String id) {

		IPersonalDao dao = sqlSession.getMapper(IPersonalDao.class);
		dao.deleteWork(workname, workdetail, id);
	}

	// �۾� ����
	public void startWork() {
		String startTime = null;
		String today = null;

		// ���� ��¥ ���ϱ�
		Date d = new Date();
		today = formatter.getFormatter_Date().format(d);
		System.out.println("���� ��¥ : " + today);

		// �۾� ���� �ð� ���ϱ�
		Date start = new Date();
		startTime = formatter.getFormatter_Time().format(start);
		System.out.println("���� �ð� : " + startTime);

	}

	// �۾� ����
	public void stopWork() {

		// �۾� ���� �ð� ���ϱ�
		Date end = new Date();
		String endTime = formatter.getFormatter_Time().format(end);
		System.out.println("���� �ð� : " + endTime);
	}

}
