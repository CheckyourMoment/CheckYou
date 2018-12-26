
package com.spring.checkYou.util;

import java.text.SimpleDateFormat;
import java.util.Locale;

import org.springframework.stereotype.Component;

@Component
public class Formatter {

	// 시작 시간, 종료 시간을 format할 formatter
	private SimpleDateFormat formatter_Time = new SimpleDateFormat("a hh:mm", Locale.US);

	// 오늘 날짜를 format할 formmater
	private SimpleDateFormat formatter_Date = new SimpleDateFormat("yyyy-MM-dd");

	// 스톱워치
	private SimpleDateFormat hourFormatter = new SimpleDateFormat("HH");
	
	private SimpleDateFormat minuteFormatter = new SimpleDateFormat("mm");
	
	private SimpleDateFormat secondFormatter = new SimpleDateFormat("ss");
	
	// setter getter
	public SimpleDateFormat getFormatter_Time() {
		return formatter_Time;
	}

	public void setFormatter_Time(SimpleDateFormat formatter_Time) {
		this.formatter_Time = formatter_Time;
	}

	public SimpleDateFormat getFormatter_Date() {
		return formatter_Date;
	}

	public void setFormatter_Date(SimpleDateFormat formatter_Date) {
		this.formatter_Date = formatter_Date;
	}

	public SimpleDateFormat getHourFormatter() {
		return hourFormatter;
	}

	public void setHourFormatter(SimpleDateFormat hourFormatter) {
		this.hourFormatter = hourFormatter;
	}

	public SimpleDateFormat getMinuteFormatter() {
		return minuteFormatter;
	}

	public void setMinuteFormatter(SimpleDateFormat minuteFormatter) {
		this.minuteFormatter = minuteFormatter;
	}

	public SimpleDateFormat getSecondFormatter() {
		return secondFormatter;
	}

	public void setSecondFormatter(SimpleDateFormat secondFormatter) {
		this.secondFormatter = secondFormatter;
	}
	
	
	
	
	

}

