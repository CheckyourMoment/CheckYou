package com.spring.checkYou.dao;

import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.dto.WorkDto;
//개인 일일 시간관리 쿼리 인터페이스
public interface IPersonalDao {
	public void addNewWork(String id, String worktype, String workname, String workdetail);
	public String checkWork(String workname);
	public WorkDto manageMyWorkPage(String id);
	public void deleteWork(String workname, String workdetail, String id);
	public void startWork(TimeSheetDto dto);
	public TimeSheetDto viewTable(TimeSheetDto dto);
	public void stopWork(TimeSheetDto dto);
	public void evaluate(TimeSheetDto dto);
}
