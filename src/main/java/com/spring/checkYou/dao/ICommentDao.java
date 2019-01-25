package com.spring.checkYou.dao;

import com.spring.checkYou.dto.CommentDto;

public interface ICommentDao {
	public void addComment(CommentDto dto);
	
	public String checkComment(String constructor, String groupName);
	

}
