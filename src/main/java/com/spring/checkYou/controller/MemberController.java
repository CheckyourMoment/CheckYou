package com.spring.checkYou.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.checkYou.dto.FriendDto;
import com.spring.checkYou.dto.MemberDto;
import com.spring.checkYou.dto.TimeSheetDto;
import com.spring.checkYou.dto.WorkDto;
import com.spring.checkYou.service.MemberService;
import com.spring.checkYou.service.PersonalService;
import com.spring.checkYou.util.Formatter;

@Controller
public class MemberController {

	// field
	@Autowired
	MemberService service;
	
	@Autowired
	PersonalService personalService;

	@Autowired
	HttpSession session;
	
	@Autowired
	Formatter formatter;

	// method

	// 회원가입
	@RequestMapping("/join")
	public String join(MemberDto dto) { // HttpServletRequest request
		service.join(dto);
		return "login";
	}

	// 로그인
	@RequestMapping("/login")
	public String login(Model model, MemberDto dto) {
		String path = "null";
		path = service.login(dto);
		
		return path;
	}
	 @ResponseBody
	    @RequestMapping(value="/checkId.do",method = RequestMethod.POST)
	    public String idCheck(Model model, MemberDto dto) {
	        System.out.println("Controller.idCheck() 호출");
	        int result=0;
	       
	     
	    	String alreadyExist = service.idCheck(dto);
	    	
	    	System.out.println(alreadyExist);
			if (alreadyExist == "false") {
				System.out.println("아이디 사용하셔도 됩니다.");
				result = 1;
			} else {
				System.out.println("아이디는 이미 친구목록에 있습니다.");
			}
	        
	        return String.valueOf(result);
	    }
	 
	// 메인 화면 : 내가 추가한 work list들이 있기 때문에 DB접근 필요, 작업종류와 작업이름을 뽑아와서 + 2. main.jsp에서 뿌린다.
	@RequestMapping("/dailyManagement")
	public String dailyManagementPage(Model model) {
		System.out.println("dailyManagementPage()");
		String id = (String) session.getAttribute("userId");
		service.dailyManagementPage(model, id);
		
		// 검색 한 세션 초기화
		String Date_TimeSheet = (String)session.getAttribute("Date_TimeSheet");
		if(Date_TimeSheet != null) {
			session.setAttribute("Date_TimeSheet", "NOT");
		}
		
		// main 페이지 돌아온 시간을 session에 저장
		Date date = new Date();
		String hour = formatter.getHourFormatter().format(date);
		System.out.println("main 페이지 돌아온 hour : "+hour);
		String minute = formatter.getMinuteFormatter().format(date);
		System.out.println("main 페이지 돌아온 minute : "+minute);
		String second = formatter.getSecondFormatter().format(date);
		System.out.println("main 페이지 돌아온 second : "+second);
		session.setAttribute("hourReturnedMain", hour);
		session.setAttribute("minuteReturnedMain", minute);
		session.setAttribute("secondReturnedMain", second);
		
		if(session.getAttribute("startstopwatch_hour")==null) {
			session.setAttribute("startstopwatch_hour", "0");	
	   		session.setAttribute("startstopwatch_minute", "0");	
	   		session.setAttribute("startstopwatch_second", "0");
		}
		
		return "main";
	}
	
	@RequestMapping("/startTime")
	public String startTime(HttpServletRequest request, TimeSheetDto dto) {
		System.out.println("startTime()");
		String runningconfirm = request.getParameter("runningconfirm");
		System.out.println("runningconfirm : "+runningconfirm);
		session.setAttribute("runningconfirm", runningconfirm);
		
		// 스톱워치 시작상태로 변경
			Date date = new Date();
	    	Formatter formatter = new Formatter();
	    	String hour = formatter.getHourFormatter().format(date);
	    	String minute = formatter.getMinuteFormatter().format(date);
	    	String second = formatter.getSecondFormatter().format(date);
	    	
	    	session.setAttribute("startstopwatch_hour", hour);	
	   		session.setAttribute("startstopwatch_minute", minute);	
	   		session.setAttribute("startstopwatch_second", second);
	    	
	    	System.out.println("start hour : "+hour);
	    	System.out.println("start minute : "+minute);
	    	System.out.println("start second : "+second);
	    	
	    	System.out.println(dto.getWorktype());
	    	System.out.println(dto.getWorkname());
	    	System.out.println(dto.getWorkdetail());
	    	
	    	session.setAttribute("Worktype", dto.getWorktype());
	    	session.setAttribute("Workname", dto.getWorkname());
	    	session.setAttribute("Workdetail", dto.getWorkdetail());
	    	
	    	String id = (String)session.getAttribute("userId");
			dto.setId(id);
			
			personalService.startWork(dto);
		
		return "redirect:dailyManagement";
	}
	
	@RequestMapping("/stopTime")
	public String stopTime(HttpServletRequest request, TimeSheetDto dto) {
		System.out.println("stopTime()");
		String runningconfirm = request.getParameter("runningconfirm");
		System.out.println("runningconfirm : "+runningconfirm);
		session.setAttribute("runningconfirm", runningconfirm);
		
		// 스톱워치 정지상태로 변경
	    	session.setAttribute("startstopwatch_hour", "0");	
	   		session.setAttribute("startstopwatch_minute", "0");	
	   		session.setAttribute("startstopwatch_second", "0");
	   		
	   	// 
	   		String worktype = (String)session.getAttribute("Worktype");
	   		String workname = (String)session.getAttribute("Workname");
	   		String workdetail = (String)session.getAttribute("Workdetail");
	    	String id = (String)session.getAttribute("userId");
	    	String progresstime = request.getParameter("progresstime");
	    	
	    	int time1 = Integer.parseInt(progresstime)/10;
	    	int minute = time1/60;
	    	int second = time1-minute*60;
	    	
	    	progresstime = Integer.toString(minute);
	    	
	    	dto.setProgresstime(progresstime);
	    	dto.setId(id);
	    	dto.setWorktype(worktype);
	    	dto.setWorkname(workname);
	    	dto.setWorkdetail(workdetail);
	    	
	    	personalService.stopWork(dto);
		
		return "redirect:dailyManagement";
	}
	
	

	// 친구 찾기
	@RequestMapping("/searchFriend")
	public String searchFriend(Model model, HttpServletRequest request) {

		String id = request.getParameter("searchFriend");

		service.searchFriend(model, id);

		return "searchFriendPage";
	}

	// 친구 추가
	@RequestMapping("/addFriend")
	public String addFriend(FriendDto dto) {
		String userId = (String) session.getAttribute("userId");
		dto.setId(userId);

		// test
		System.out.println("현재 회원명: " + dto.getId());
		System.out.println("추가하려는 아이디 : " + dto.getFriend());

		boolean alreadyExist = service.addFriendCheck(dto);

		if (alreadyExist == true) {
			System.out.println("추가하려는 친구는 이미 친구목록에 있습니다.");
		} else {
			service.addFriend(dto);
			System.out.println("친구추가 완료되었습니다.");

		}

		return "searchFriendPage";
	}

	// 친구 목록
	@RequestMapping("/friendList")
	public String friendList(Model model) {
		String userId = (String) session.getAttribute("userId");

		service.friendList(model, userId);

		return "friendList";
	}
	@RequestMapping("/test")
	public String test(Model model) {
		String userId = (String) session.getAttribute("userId");

		return "test";
	}

}
