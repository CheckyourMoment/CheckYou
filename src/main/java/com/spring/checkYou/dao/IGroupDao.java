package com.spring.checkYou.dao;

import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.dto.GroupMemberDto;

public interface IGroupDao {
	public void addGroup(GroupDto dto);
	public String checkGroup(String groupName, String constructor);
	public GroupDto groupList_owner(String id);
	public GroupDto groupList_member(String id);
	public String searchMember(String id);
	public void addMember(GroupMemberDto dto);
	public GroupMemberDto addMemberCheck(GroupMemberDto dto);
	public GroupMemberDto memberList(GroupMemberDto dto);
	public GroupMemberDto inviteList(GroupMemberDto dto);
}
