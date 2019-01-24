package com.spring.checkYou.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IGroupDao;
import com.spring.checkYou.dao.IMemberDao;
import com.spring.checkYou.dao.IPersonalDao;
import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.dto.GroupMemberDto;
import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.util.Formatter;

@Service
public class GroupService {

	@Autowired
	SqlSession sqlSession;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	Formatter formatter;

	// group 추가
	public void addGroup(GroupDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);

		// test
		System.out.println(dto.getConstructor());
		System.out.println(dto.getGroupName());

		String check = dao.checkGroup(dto.getGroupName(), dto.getConstructor());
		System.out.println("checkwork query test : " + check);

		if (check == null) {
			System.out.println("success adding newGroup");
			dao.addGroup(dto);
		} else {
			System.out.println("this Groupname is already exist");
		}

		// 자기자신을 그룹에 추가하는 로직
		GroupMemberDto owner = new GroupMemberDto();
		owner.setConstructor(dto.getConstructor());
		owner.setGroupname(dto.getGroupName());
		owner.setGroupmember(dto.getConstructor());
		owner.setAcception("1");
		dao.addMember(owner);

	}

	// 자신이 만든 그룹을 보여준다.
	public void groupList_owner(Model model, String id) {
		List<Object> grouplist_owner = sqlSession.selectList("com.spring.checkYou.dao.IGroupDao.groupList_owner", id);
		model.addAttribute("grouplist_owner", grouplist_owner);
		
		/*// test
		 GroupDto dto = (GroupDto)grouplist_owner.get(0);
		 System.out.println("memocount"+dto.getMemocount());*/
	}

	// 자신이 속한(자신은 멤버) 그룹을 보여준다.
	public void groupList_member(Model model, String id) {
		List<Object> grouplist_member = sqlSession.selectList("com.spring.checkYou.dao.IGroupDao.groupList_member", id);
		model.addAttribute("grouplist_member", grouplist_member);

		/*
		 * // test GroupMemberDto dto = (GroupMemberDto)grouplist_member.get(0);
		 * System.out.println(dto.getConstructor());
		 * System.out.println(dto.getGroupname());
		 * System.out.println(dto.getGroupmember());
		 */
	}

	// 멤버 찾기
	public void searchMember(Model model, String id) {
		System.out.println("searchMember()");
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		String searchedMember = dao.searchMember(id);
		model.addAttribute("searchedMember", searchedMember);
	}

	// 멤버 추가
	public void addMember(GroupMemberDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.addMember(dto);
	}

	// 멤버 추가 중복 체크
	public boolean addMemberCheck(GroupMemberDto dto) {
		boolean alreadyExist;
		GroupMemberDto list = sqlSession.selectOne("addMemberCheck", dto);

		if (list == null) {

			alreadyExist = false;
		} else {
			alreadyExist = true;
		}
		return alreadyExist;
	}

	// 멤버 목록
	public void memberList(Model model, GroupMemberDto dto) {
		List<GroupMemberDto> memberList = sqlSession.selectList("memberList", dto);
		model.addAttribute("memberList", memberList);

	}

	// 초대한 사용자 목록
	public void inviteList(Model model, GroupMemberDto dto) {
		List<GroupMemberDto> inviteList = sqlSession.selectList("inviteList", dto);
		model.addAttribute("inviteList", inviteList);

	}

	// 요청받은 초대목록
	public void requestPage(Model model, GroupMemberDto dto) {
		List<GroupMemberDto> requestList = sqlSession.selectList("requestList", dto);
		model.addAttribute("requestList", requestList);

	}

	// 초대요청 수락
	public void accept(GroupMemberDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.accept(dto);

	}

	// 초대요청 수락
	public void refuse(GroupMemberDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.refuse(dto);

	}

	// 멤버 삭제
	public void deleteMember(GroupMemberDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.deleteMember(dto);

	}

	// 멤버요청 취소
	public void cancelInvite(GroupMemberDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.cancelInvite(dto);
	}

	// 그룹 삭제
	public void deleteGroup(String groupname) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.deleteGroup1(groupname); // grouplist table에서 해당 그룹삭제
		dao.deleteGroup2(groupname); // groupmember table에서 해당 그룹의 멤버삭제
		dao.deleteGroup3(groupname); // groupmemo table에서 해당 그룹의 메모삭제
	}

	// 멤버의 오늘 시간관리표 보기 
	public void viewMemberTable(Model model, String groupmember) {
		Date d = new Date();
		String createddate = formatter.getFormatter_Date().format(d);

		TimeSheetDto dto = new TimeSheetDto();
		dto.setId(groupmember);
		dto.setCreateddate(createddate);

		List<Object> timeSheet_today = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.viewTable", dto);
		model.addAttribute("timeSheet_today", timeSheet_today);
	}
	
	// 그룹의 메모개수 구하는 로직
	public String memoCount(String groupname) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		String memoCount = dao.memoCount(groupname);
		
		return memoCount;
	}
	
	// 그룹의 메모개수 갱신(증가)
	public void increaseMemoCount(String increasedMemoCount, String groupname) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.increaseMemoCount(increasedMemoCount, groupname);
	}

	// 메모저장
	public void saveMemo(ArrayList memoList) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		Iterator iter = memoList.iterator();
		String groupname = (String)session.getAttribute("selectedGroup");
		String i = "1";
		
		while(iter.hasNext()) {
			String memo = (String)iter.next();
			System.out.println(memo);
			dao.saveMemo(groupname,i,memo);
			
			int f=Integer.parseInt(i)+1;
			i = Integer.toString(f);
		}
	}
	
	// 메모로드
	public void loadMemoData(String groupname, String memoCount, Model model) {
		List<String> memoDataList = sqlSession.selectList("loadMemoData", groupname);
		model.addAttribute("memoDataList",memoDataList);
		
		// test
		System.out.println("test");
		Iterator iter = memoDataList.iterator();
		while(iter.hasNext()) {
			String test = (String)iter.next();
			System.out.println(test);
		}
	}
	
	// 갱신을 위한 모든 메모 삭제
	public void deleteMemoForSave(String groupname) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		dao.deleteMemoForSave(groupname);
	}
	
	// 단일 메모 삭제
	public void deleteOneMemo(String deleteNum) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);
		String groupname = (String)session.getAttribute("selectedGroup");
		String memoCount = (String)session.getAttribute("memoCount");
		
		// 해당되는 번호의 메모를 삭제
		dao.deleteOneMemo(groupname, deleteNum);
		
		
		// 삭제된 메모의 뒷 번호 메모들의 번호를 앞으로 당긴다.
		int start = Integer.parseInt(deleteNum);
		int end = Integer.parseInt(memoCount);
		int swap = 0;
		for(int i = 1; start<end ; i++) {
			start = start+i;
			swap = start-1;
			
			String start_str = Integer.toString(start);
			String swap_str = Integer.toString(swap);
			
		dao.swapMemoNum(groupname,start_str,swap_str);
		}
		
		// 전체 메모개수를 줄이는 로직
		String decrease = Integer.toString(end-1);
		
		dao.decreaseMemoCount(decrease,groupname);
		session.setAttribute("memoCount", decrease);
		
	}
	
	
}
