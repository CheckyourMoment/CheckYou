package com.spring.checkYou.service;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.checkYou.dao.ICommentDao;
import com.spring.checkYou.dao.IPersonalDao;
import com.spring.checkYou.dto.CommentDto;

@Service
public class CommentService {
	@Autowired
	SqlSession sqlSession;

	// comment 추가
	public void addComment(CommentDto dto) {
		System.out.println("addComment()");
		ICommentDao dao = sqlSession.getMapper(ICommentDao.class);
		dao.addComment(dto);
	}

	// selectedGroup에서 GComment : DB랑 세션 비교
	public void keepComment(Model model, String comment) {

		System.out.println("keepComment()");
		ICommentDao dao = sqlSession.getMapper(ICommentDao.class);
		// String keepedComment = dao.keepComment(comment);
		// model.addAttribute("keepedComment", keepedComment);

		// dao.keepComment(groupName);
		// dao.keepComment(dto.getGroupName(), dto.getGroupComment()); //db에서 받아온 애들

	}
}
