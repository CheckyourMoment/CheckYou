package com.spring.checkYou.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.IGroupDao;
import com.spring.checkYou.dao.IPersonalDao;
import com.spring.checkYou.dto.GroupDto;

@Service
public class GroupService {
	
	@Autowired
	SqlSession sqlSession; 
	
	
	// group 추가
	public void addGroup(GroupDto dto) {
		IGroupDao dao = sqlSession.getMapper(IGroupDao.class);

		// test
		System.out.println(dto.getConstructor());
		System.out.println(dto.getGroupName());
		
		String check = dao.checkGroup(dto.getGroupName(),dto.getConstructor());
		System.out.println("checkwork query test : " + check);

		if (check == null) {
			System.out.println("success adding newWork");
			dao.addGroup(dto);
		} else {
			System.out.println("this workname is already exist");
		}
		
		
	}
	
	
	// 자신이 만든 그룹을 보여준다.
	public void groupList_owner(Model model, String id) {
		List<Object> grouplist_owner = sqlSession.selectList("com.spring.checkYou.dao.IGroupDao.groupList_owner", id);
		
/*		// test
		GroupDto dto = (GroupDto)grouplist_owner.get(0);
		System.out.println(dto.getConstructor());
		System.out.println(dto.getGroupName());
		System.out.println(dto.getGroupType());
		System.out.println(dto.getPurpose());
		
		GroupDto dto2 = (GroupDto)grouplist_owner.get(1);
		System.out.println(dto2.getConstructor());
		System.out.println(dto2.getGroupName());
		System.out.println(dto2.getGroupType());
		System.out.println(dto2.getPurpose());*/
		
		
		model.addAttribute("grouplist_owner", grouplist_owner);
	}
	
	// 자신이 속한(자신은 멤버) 그룹을 보여준다.
	public void groupList_member(Model model, String id) {
		List<Object> grouplist_member = sqlSession.selectList("com.spring.checkYou.dao.IGroupDao.groupList_member", id);
		model.addAttribute("grouplist_member", grouplist_member);
	}
	
	
	
	
	
	
	
	
}
