package com.spring.checkYou.dao;

import com.spring.checkYou.dto.GroupDto;

public interface IGroupDao {
	public void addGroup(GroupDto dto);
	public String checkGroup(String groupName, String constructor);
	public GroupDto groupList_owner(String id);
	public GroupDto groupList_member(String id);
}
