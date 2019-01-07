package com.spring.checkYou.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.spring.checkYou.dao.CanvasjsChartDao;

@Service
public class CanvasjsChartService{
 
	@Autowired
	CanvasjsChartDao canvasjsChartDao;
 
	public void setCanvasjsChartDao(CanvasjsChartDao canvasjsChartDao) {
		this.canvasjsChartDao = canvasjsChartDao;
	}
 
	public List<List<Map<Object, Object>>> getCanvasjsChartData(String Date_graph) {
		System.out.println("getCanvasjsChartData() in service");
		return canvasjsChartDao.getCanvasjsChartData(Date_graph);
	}
 
}
