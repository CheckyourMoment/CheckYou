package com.spring.checkYou.dao;
 
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.service.PersonalService;
import com.spring.checkYou.util.Formatter;
 
@Component
public class CanvasjsChartDao{
 
	@Autowired
	SqlSession sqlSession;

	@Autowired
	HttpSession session;

	@Autowired
	Formatter formatter;
	
	
	public List<List<Map<Object, Object>>> getCanvasjsChartData(String Date_graph) {
		System.out.println("getCanvasjsChartData()");
		
		TimeSheetDto dto2 = new TimeSheetDto();
		
		String id = (String)session.getAttribute("userId");
	
		
		dto2.setCreateddate(Date_graph);
		dto2.setId(id);
		
		List<TimeSheetDto> list2 = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.getChartData",dto2);
		
		// ------------------------------------------------------------------------------
		Map<Object,Object> map = null;
		List<List<Map<Object,Object>>> list = new ArrayList<List<Map<Object,Object>>>();
		List<Map<Object,Object>> dataPoints1 = new ArrayList<Map<Object,Object>>();
		
		
		// distinct로 중복 제거 및 진행시간을 /60/24해서 퍼센터로 구하기
		List<TimeSheetDto> myList = list2;
		Iterator iterator = myList.iterator();
				
		while(iterator.hasNext()) {
				
			TimeSheetDto dto = (TimeSheetDto) iterator.next();
			String workType = dto.getWorktype();
			String progessTime = dto.getProgresstime();
			
			if(progessTime==null) {
				System.out.println("progresstime is null...");
				continue;
			}
			
			System.out.println(workType+" = "+progessTime);
			
			int progessTime_int = Integer.parseInt(progessTime);
			
			map = new HashMap<Object,Object>();
			map.put("label", workType);
			map.put("y", progessTime_int);
			dataPoints1.add(map);
	
			
		}
		
		list.add(dataPoints1);
		
		return list;
	}
 
}   







/*
package com.spring.checkYou.dao;
 
 
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.spring.checkYou.service.CanvasjsChartData;
 
@Component
public class CanvasjsChartDao{
 
	public List<List<Map<Object, Object>>> getCanvasjsChartData() {
		return CanvasjsChartData.getCanvasjsDataList();
	}
 
}   
*/