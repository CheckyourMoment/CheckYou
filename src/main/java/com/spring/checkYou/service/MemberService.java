package com.spring.checkYou.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IMemberDao;
import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.MemberDto;

@org.springframework.stereotype.Service
public class MemberService {

	@Autowired
	SqlSession sqlSession;

	@Autowired
	HttpSession session;

	// method

	// 회원가입
	public void join(MemberDto dto) {

		String id = dto.getId();
		String password = dto.getPassword();
		String email = dto.getEmail();

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		dao.join(id, password, email);
	}


	// 로그인
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

			path = "redirect:/dailyManagement";
			return path;
		}
	}


	// 메인 화면

	public void dailyManagementPage(Model model, String id) {
		// IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		List<Object> worklist = sqlSession.selectList("com.spring.checkYou.dao.IMemberDao.dailyManagementPage", id);
		model.addAttribute("worklist", worklist);
	}


	// 친구 찾기
	public void searchFriend(Model model, String id) {


		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		String searchedFriend = dao.searchFriend(id);
		model.addAttribute("searchedFriend", searchedFriend);
	}


	// 친구 추가

	public void addFriend(FriendDto dto) {

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);

		dao.addFriend(dto);

	}


	// 친구 추가 중복 체크
	public boolean addFriendCheck(FriendDto dto) {
		boolean alreadyExist;
		
		FriendDto list = sqlSession.selectOne("addFriendCheck", dto);
		
		if(list==null) {

			alreadyExist = false;
		}else {
			alreadyExist = true;
		}
		return alreadyExist;
	}
	

	// 친구 목록
	public void friendList(Model model ,String id) {
		
		List<FriendDto> friendList = sqlSession.selectList("friendList", id);
		
		model.addAttribute("friendList",friendList);
	}

}
