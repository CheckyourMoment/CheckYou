package com.spring.checkYou.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IMemberDao;
import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.MemberDto;
import com.spring.checkYou.dto.WorkDto;

@org.springframework.stereotype.Service
public class MemberService {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	HttpSession session;

	// method

	// ȸ������
	public void join(MemberDto dto) {

		String id = dto.getId();
		String password = dto.getPassword();
		String email = dto.getEmail();

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		dao.join(id, password, email);
	}

	// �α���
	public String login(MemberDto dto) {
		String id = dto.getId();
		String password = dto.getPassword();

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		MemberDto dto2 = dao.login(id, password);

		String path = null;
		if (dto2 == null) {
			path = "redirect:/";
			return path;
		} else {
			session.setAttribute("userId", id);

			// �̸��� ����ó�� �ؾ��ϳ�..? or ���̺� ��¥�÷� �߰��ؼ� db�ʱ�ȭ ��Ű�� ����?

			path = "redirect:/dailyManagement";
			return path;
		}
	}

	// ���� ȭ��
	public void dailyManagementPage(Model model, String id) {
		// IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		List<Object> worklist = sqlSession.selectList("com.spring.checkYou.dao.IMemberDao.dailyManagementPage", id);
		model.addAttribute("worklist", worklist);
	}

	// ģ�� ã��
	public void searchFriend(Model model, String id) {

		System.out.println("ģ�� ã�� : " + id);

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		String searchedFriend = dao.searchFriend(id);
		model.addAttribute("searchedFriend", searchedFriend);
	}

	// ģ�� �߰�
	public void addFriend(FriendDto dto) {

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);

		dao.addFriend(dto);

	}

	// ģ�� �߰� �ߺ� üũ
	public boolean addFriendCheck(FriendDto dto) {
		boolean alreadyExist;
		
		FriendDto list = sqlSession.selectOne("addFriendCheck", dto);
		// test
		if(list==null) {
			System.out.println("�ߺ����� �ʽ��ϴ�.");
			alreadyExist = false;
		}else {
			System.out.println("�ߺ� �˴ϴ�.");
			alreadyExist = true;
		}
	
		return alreadyExist;
	}
	
	// ģ�� ���
	public void friendList(Model model ,String id) {
		
		List<FriendDto> friendList = sqlSession.selectList("friendList", id);
		
		model.addAttribute("friendList",friendList);
	}

}
