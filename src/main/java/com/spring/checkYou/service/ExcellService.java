package com.spring.checkYou.service;

import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.spring.checkYou.dto.TimeSheetDto;

@Service("excellService")
public class ExcellService {
	@Autowired
	private SqlSessionFactory sqlSessionFactory;

	@Transactional
	public void selectExcelList(HttpServletResponse response, TimeSheetDto dto) {
		System.out.println("selectExcelList()");
		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		// 메모리에 100개의 행을 유지합니다. 행의 수가 넘으면 디스크에 적습니다.
		SXSSFWorkbook wb = new SXSSFWorkbook(100);
		final Sheet sheet = wb.createSheet();
		
		try {
			System.out.println(dto.getId());
			System.out.println(dto.getCreateddate());
			
			List<Object> list = sqlSession.selectList("com.spring.checkYou.dao.IPersonalDao.excellDownload",dto);
			Iterator iterator = list.iterator();
			
			Row row = sheet.createRow(0);
			Cell cell = null;
			cell = row.createCell(0);
			cell.setCellValue("Name:");
			cell = row.createCell(1);
			cell.setCellValue(dto.getId());
			
			row = sheet.createRow(1);
		    cell = null;
			cell = row.createCell(0);
			cell.setCellValue("Date:");
			cell = row.createCell(1);
			cell.setCellValue(dto.getCreateddate());
			
			row = sheet.createRow(3);
			cell = row.createCell(0);
			cell.setCellValue("작업 종류");
			cell = row.createCell(1);
			cell.setCellValue("작업 이름");
			cell = row.createCell(2);
			cell.setCellValue("작업 내용");
			cell = row.createCell(3);
			cell.setCellValue("시작 시간");
			cell = row.createCell(4);
			cell.setCellValue("종료 시간");
			cell = row.createCell(5);
			cell.setCellValue("진행 시간(분)");
			cell = row.createCell(6);
			cell.setCellValue("평가");
			
			int i = 4;
			while(iterator.hasNext()) {
				row = sheet.createRow(i);
				cell = null;
				TimeSheetDto dto2 = (TimeSheetDto)iterator.next();
				
				cell = row.createCell(0);
				cell.setCellValue(dto2.getWorktype());
				cell = row.createCell(1);
				cell.setCellValue(dto2.getWorkname());
				cell = row.createCell(2);
				cell.setCellValue(dto2.getWorkdetail());
				cell = row.createCell(3);
				cell.setCellValue(dto2.getStarttime());
				cell = row.createCell(4);
				cell.setCellValue(dto2.getEndtime());
				cell = row.createCell(5);
				cell.setCellValue(dto2.getProgresstime());
				cell = row.createCell(6);
				cell.setCellValue(dto2.getEvaluation());
				
				i++;
			}

			response.setHeader("Set-Cookie", "fileDownload=true; path=/");
			response.setHeader("Content-Disposition", String.format("attachment; filename=\""+dto.getId()+" - "+dto.getCreateddate()+"'s "+"TimeSheett.xlsx\""));
			wb.write(response.getOutputStream());

		} catch (Exception e) {
			System.out.println("예외 발생..");
			response.setHeader("Set-Cookie", "fileDownload=false; path=/");
			response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
			response.setHeader("Content-Type", "text/html; charset=utf-8");

			OutputStream out = null;
			try {
				out = response.getOutputStream();
				byte[] data = new String("fail..").getBytes();
				out.write(data, 0, data.length);
			} catch (Exception ignore) {
				ignore.printStackTrace();
			} finally {
				if (out != null)
					try {
						out.close();
					} catch (Exception ignore) {
					}
			}

		} finally {
			sqlSession.close();

			// 디스크 적었던 임시파일을 제거합니다.
			wb.dispose();

			try {
				wb.close();
			} catch (Exception ignore) {
			}
		}

	}
}
