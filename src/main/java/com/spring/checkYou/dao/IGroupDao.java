package com.spring.checkYou.dao;

import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.GroupDto;
import com.spring.checkYou.dto.GroupMemberDto;

public interface IGroupDao {
	public void addGroup(GroupDto dto);
	public String checkGroup(String groupName, String constructor);
	public GroupDto groupList_owner(String id);
	public GroupMemberDto groupList_member(String id);
	public String searchMember(String id);
	public void addMember(GroupMemberDto dto);
	public GroupMemberDto addMemberCheck(GroupMemberDto dto);
	public GroupMemberDto memberList(GroupMemberDto dto);
	public GroupMemberDto inviteList(GroupMemberDto dto);
	public GroupMemberDto requestList(GroupMemberDto dto);
	public void accept(GroupMemberDto dto);
	public void refuse(GroupMemberDto dto);
	public void deleteMember(GroupMemberDto dto);
	public void cancelInvite(GroupMemberDto dto);
	public void deleteGroup1(String groupname);
	public void deleteGroup2(String groupname);
	public String memoCount(String groupname);
	public void increaseMemoCount(String increasedMemoCount, String groupname);
	public void saveMemo(String groupname, String memonumber, String memo);
}
