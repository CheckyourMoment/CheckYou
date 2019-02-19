package com.spring.checkYou.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.mail.HtmlEmail;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IGroupDao;
import com.spring.checkYou.dao.IMemberDao;
import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.GroupMemberDto;
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

	// 아이디 중복체크
	public String idCheck(MemberDto dto) {
		// TODO Auto-generated method stub
		String id = dto.getId();
		String alreadyExist;
		System.out.println("MemberService  호출" + dto.getId());

		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);

		String dto1 = dao.idCheck(id);
		// 아이디가 친구목록에 없을 때
		if (dto1 == null)
			alreadyExist = "false";
		else
			// 아이디가 친구목록에 있을때
			alreadyExist = "true";

		return alreadyExist;

	}

	// 로그인
	public String login(MemberDto dto) {
		String id = dto.getId();
		String password = dto.getPassword();
		int loginresult;
		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		MemberDto dto2 = dao.login(id, password);

		String path = null;
		if (dto2 == null) {
			path = "redirect:/";
			loginresult = 0;
			return path;
		} else {
			loginresult = 1;
			session.setAttribute("userId", id);
			path = "redirect:/dailyManagement";
			return path;
		}
	}

	// 계정찾기 : ID
	public void findID(Model model, String id) {
		// TODO Auto-generated method stub
		System.out.println("FindID()");
		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		String findedID = dao.findID(id);
		model.addAttribute("findedID", findedID);
	}

	// 계정찾기 : PW
	public void findPW(HttpServletResponse response, MemberDto dto) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// 임시 비밀번호 생성
		String pw = "";
		for (int i = 0; i < 12; i++) {
			pw += (char) ((Math.random() * 26) + 97);
		}
		dto.setPassword(pw);
		System.out.println("임시비밀번호" + pw);
		IMemberDao dao = sqlSession.getMapper(IMemberDao.class);
		// 비밀번호 변경
		dao.findPW(dto);
		// 비밀번호 변경 메일 발송
		send_mail(dto, "findPW");
		out.print("이메일로 임시 비밀번호를 발송");
		out.close();
	}

	// 이메일 발송
	public void send_mail(MemberDto dto, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com";
		String hostSMTPid = "forever_757@naver.com";
		String hostSMTPpwd = "tjdgus!00";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "forever_757@naver.com";
		String fromName = "Check You Se!ze The Day";
		String subject = "";
		String msg = "";

		System.out.println("Email?" + div);

		if (div.equals("findPW")) {
			subject = "CheckYou 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; >";
			msg += "<h3 style='color: blue;'>";
			msg += "" + "CheckYou" + " 당신의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += dto.getPassword() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = dto.getEmail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			System.out.println("mail" + mail);
			email.setSmtpPort(465);

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();

		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	// 회원정보 수정
	public void modify(Model model, String update) {


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

		if (list == null) {

			alreadyExist = false;
		} else {
			alreadyExist = true;
		}
		return alreadyExist;
	}

	// 친구 목록
	public void friendList(Model model, String id) {

		List<FriendDto> friendList = sqlSession.selectList("friendList", id);
		model.addAttribute("friendList", friendList);
	}

}
