package com.spring.checkYou.dao;


import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.MemberDto;
import com.spring.checkYou.dto.WorkDto;

public interface IMemberDao {

	public void join(String id, String password, String email);
	public MemberDto login(String id, String password);
	public WorkDto dailyManagementPage(String id);
	public String searchFriend(String id);
	public void addFriend(FriendDto dto);
	public FriendDto addFriendCheck(FriendDto dto);
	public FriendDto friendList(String id);
	
}
