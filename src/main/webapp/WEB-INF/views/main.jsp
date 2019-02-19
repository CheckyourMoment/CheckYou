<%@page import="org.springframework.context.annotation.Primary"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession"%>
<%@ page import="com.spring.checkYou.util.Formatter"%>
<%@ page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="https://fonts.googleapis.com/css?family=East+Sea+Dokdo|Gaegu|Gamja+Flower&amp;subset=korean"
	rel="stylesheet">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Karla"
	rel="stylesheet">
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Home</title>
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css"
	media="all">

<!--  스톱워치 함수  -->
<script>
var time = 0;
var running = 0;	//  0:정지상태 	1:스톱워치 실행상태

function startPause(continueTime){	// 시작 정지 버튼 클릭 이벤트 처리 메소드
    if(running == 0){	// start
    	time = continueTime*10;
    	 running = 1;	// 스톱워치가 정지상태이면 실행상태로 변경한 후
        var runningconfirm = document.getElementById("runningconfirm");
        
        
        // main page에서 start버튼 눌럿을 경우
        if(runningconfirm.value==0){
        	
        	var size = document.getElementsByName("work").length;
           	for(var i = 0; i < size; i++) {
               if(document.getElementsByName("work")[i].checked) {
              		var workType = document.getElementsByName("workType")[i].value;
              		var workName = document.getElementsByName("workName")[i].value;
              		var workDetail = document.getElementsByName("workDetail")[i].value;
                    break;
               }
          } 	
           	// test
           	
           	// if workType!=undefined
           	if(workType!=undefined){
        		location.href = "startTime?runningconfirm="+running+"&worktype="+workType+"&workname="+workName+"&workdetail="+workDetail;
           	}
        	//if workType==undefined
        	else{
        		window.alert("수행 할 작업을 선택 후 시작하세요.");
        		location.href = "dailyManagement";
        	}
        	
        }
        
    	increment();	// increment()메소드 실행
   	 document.getElementById("start").innerHTML = "Pause";	// start버튼을 pause버튼으로 변경
   	 document.getElementById("startPause").style.backgroundColor ="red";
   	 document.getElementById("startPause").style.borderColor ="red";
	 	
    }
    
    else{ // stop
        running = 0;	// 스톱워치가 실행상태이면 정지상태로 변경한 후 
        location.href = "stopTime?runningconfirm="+running+"&progresstime="+time;
        
        document.getElementById("start").innerHTML = "start"; // start버튼을 start버튼으로 변경
      	 document.getElementById("startPause").style.backgroundColor ="green";
       	 document.getElementById("startPause").style.borderColor ="green";
    
    }
}

function increment(){
    if(running == 1){
        setTimeout(
        		function(){
            time++;
            var mins = Math.floor(time/10/60);
            var secs = Math.floor(time/10 % 60);
            var hours = Math.floor(time/10/60/60);
            var tenths = time % 10;
            if(mins < 10){
                mins = "0" + mins;
            }
            if(secs < 10){
                secs = "0" + secs;
            }
            /* output element에 진행된 시간을 뿌림  */
            document.getElementById("output").innerHTML = hours + ":" + mins + ":" + secs + ":" + tenths + "0";
            
            if(running == 0){ // 정지를 눌럿을 경우 즉, running=0일 경우 -> 진행시간과 endtime을 가지고 controller로 보내서 db에 저장 
            }
            increment();
        },100)
    }
   
}

function continueTime(){
	var runningconfirm = document.getElementById("runningconfirm");
	continueTime
	var continueHour = document.getElementById("continueHour");
	var continueMinute = document.getElementById("continueMinute");
	var continueSecond = document.getElementById("continueSecond");
	var continueTime = document.getElementById("continueTime");
	
	/* window.alert("continueHour : "+continueHour.value);
	window.alert("continueMinute : "+continueMinute.value);
	window.alert("continueSecond : "+continueSecond.value);
	window.alert("continueTime : "+continueTime.value);  */
	
	if(runningconfirm.value==1){
		startPause(continueTime.value);
	}			
}

</script>
<!-- 스톱워치 함수 끝  -->
</head>

<body onload="continueTime();">

	<header class="header_area">
		<div class="top_menu">
			<div class="container"></div>
		</div>
		<div class="main_menu" id="mainNav">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.html">
					<img src="img/i" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">

						<ul class="nav navbar-nav menu_nav ml-auto">

							<li class="nav-item active"><a class="nav-link"
								href="dailyManagement"> Home <img src="https://img.icons8.com/color/45/000000/dog-house.png"></a></li>

							<!--personal menubar!-->
							<li class="nav-item submenu dropdown"><a
								href="dailyManagement" class="nav-link dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Personal<img src="https://img.icons8.com/color/48/000000/mental-state.png"></a>
                    	<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"

										href="dailyManagement">Daily Management </a></li>
									<li class="nav-item"><a class="nav-link" href="viewTable">daily
											time sheet</a></li>

									<li class="nav-item"><a class="nav-link"
										href="canvasjschart">View Graph</a></li>
										
									<li class="nav-item"><a class="nav-link"

										href="searchTimeSheetPage">searchTimeSheet</a></li>
								</ul></li>

							<!--Group menubar!-->
							<li class="nav-item submenu dropdown"><a href="groupHome"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Group
									<img src="https://img.icons8.com/color/48/000000/groups.png">
							</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="groupHome">Invite</a></li>
								 
								</ul></li>

						 
							<!-- mypage -->
							<li class="nav-item submenu dropdown"><a href="logout"

								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">My Page<img src="https://img.icons8.com/color/48/000000/light.png">
							</a>

								<ul class="dropdown-menu">

									<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
									<li class="nav-item"><a class="nav-link" href="MyPage">MyPage</a></li>

								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>

	
		<div class="container text-center">
			<div class="row">
				<div class="col-lg-10 mx-auto" style="margin-top: 200px">
					<div>
						<h3>Daily Management</h3>
					</div>
					<div class="todo">
					 
						<span class="watch">
						<img src="img/watch.gif" /></span>

					</div>
					<div>
						<div class="worklist">
							<h2>
								WORKLIST <a href="javascript:popupOpen();"><img alt=""

									src="img/plus1.png"> </a> 
									
									
									<a href="javascript:popupOpen1();"><img

									alt="" src="img/minus.png"> </a>
								<!-- <input type="image" src="img/plus.png" onclick="window.openlocation.href='addNewWorkPage'"/>
					 -->

							</h2>
						</div>
					</div>

					<div class="col-lg-6 mx-auto" id="table" style="margin-top: 15px">
						<table align="center" width="300" cellpadding="0" cellspacing="0"
							border="0">
							<thead>
								<tr >
								<th></th>
								<th>type</th>
								<th>name</th>
								<th>detail</th>
								</tr>
								</thead>
			<tbody>
							<c:forEach items="${worklist}" var="dto">
							
								<input type="radio" id="radio1" name="workType"
									value="${dto.worktype}" 	style="display: none" />
								<div></div>
								<input type="radio" name="workName" value="${dto.workname}"
									style="display: none" />
								<input type="radio" name="workDetail" value="${dto.workdetail}"
									style="display: none" /></input>
							
								<tr>

									<td>
									 
									<input type="radio"class="w3-radio" name="work" id="work"
										value="worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">
									 
										</td>
									
									<td>${dto.worktype}</td>
									<td>${dto.workname}</td>
									<td>${dto.workdetail}</td>
								</tr>
							</c:forEach>
					</tbody>
						</table>
					
						<div class="startttt">
							<button type="button" class="btn" id="startPause"
								onclick="startPause(0); ">
								<b id="start">Start</b>
							</button>
							<br>
							<!--        <a class="btn btn-dark" id="startPause" onclick="startPause(0)"><b id="start">Start</b></a> -->
						     
						     <br>
						     <h3>
								<p id="output">
									<b>0:00:00:00</b>
								</p>
							</h3>
						</div>
					</div>
				</div>
			</div>
	 

	<!-- 타이머 끝 -->
 
	<%
		// 스톱워치 진행 여부
		String runningconfirm = (String) session.getAttribute("runningconfirm");
		if (runningconfirm == null)
			runningconfirm = "0";
		/* out.print(" runningconfirm : ");
		out.print(runningconfirm); */
	%>
	<input type="hidden" id="runningconfirm" value="<%=runningconfirm%>">

	</br>
	<%
		// main page 돌아온 시간
		String returnHour = (String) session.getAttribute("hourReturnedMain");
		String returnMinute = (String) session.getAttribute("minuteReturnedMain");
		String returnSecond = (String) session.getAttribute("secondReturnedMain");

		/* out.print("returned main page time : ");
		out.print(returnHour+" : "); 
		out.print(returnMinute+" : "); 
		out.print(returnSecond); */
	%>
	</br>
	<%
		// start버튼 누른 시간
		String startHour = (String) session.getAttribute("startstopwatch_hour");
		String startMinute = (String) session.getAttribute("startstopwatch_minute");
		String startSecond = (String) session.getAttribute("startstopwatch_second");
		/* 
		out.print("start time watch time : ");
		out.print(startHour+" : "); 
		out.print(startMinute+" : "); 
		out.print(startSecond); */
	%>
	</br>
	<%
		// main돌아온 시간 - start 시간
		int continueHour = Integer.parseInt(returnHour) - Integer.parseInt(startHour);
		int continueMinute = Integer.parseInt(returnMinute) - Integer.parseInt(startMinute);
		int continueSecond = Integer.parseInt(returnSecond) - Integer.parseInt(startSecond);

		int time1 = (Integer.parseInt(returnHour)) * (60 * 60) + (Integer.parseInt(returnMinute)) * 60
				+ Integer.parseInt(returnSecond);
		int time2 = (Integer.parseInt(startHour)) * (60 * 60) + (Integer.parseInt(startMinute)) * 60
				+ Integer.parseInt(startSecond);

		int time = time1 - time2;
		/* 	out.print("whole Time : "+time); */
	%>
	
 	<input type="hidden" id="continueHour" value="<%=continueHour%>">
	<input type="hidden" id="continueMinute" value="<%=continueMinute%>">
	<input type="hidden" id="continueSecond" value="<%=continueSecond%>">
	<input type="hidden" id="continueTime" value="<%=time%>">


	<script type="text/javascript">



function popupOpen(){

	var popUrl = "addNewWorkPage";	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=450, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		window.opener.location.reload();  
		  if(false == web_window.closed)
		  {
			  popOption.close ();
		  }
	}


function popupOpen1(){

	var popUrl = "manageMyWorkPage";	//팝업창에 출력될 페이지 URL

	var popOption = "width=570, height=500, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		window.opener.location.reload();  
		  if(false == web_window.closed)
		  {
			  popOption.close ();
		  }
	}


</script>
</div></body></html>
	<%-- 	

	<div class=mainfish>
	<div class=user>${userId}님 의 하루 일과</div> --%>