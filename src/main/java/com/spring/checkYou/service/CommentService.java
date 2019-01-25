package com.spring.checkYou.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.checkYou.dao.ICommentDao;
import com.spring.checkYou.dao.IGroupDao;
import com.spring.checkYou.dto.CommentDto;

@Service
public class CommentService {
	@Autowired
	SqlSession sqlSession;

	// comment 추가
	public void addComment(CommentDto dto) {
		// TODO Auto-generated method stub
		ICommentDao dao = sqlSession.getMapper(ICommentDao.class);

		// test
		System.out.println(dto.getConstructor());
		System.out.println(dto.getGroupName());
		System.out.println(dto.getGroupComment());
		
		String check = dao.checkComment(dto.getConstructor(),dto.getGroupName());
		System.out.println("checkwork query test : " + check);

	}
}
