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
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:300" type="text/css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css"  media="all">

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
    }
    
    else{ // stop
        running = 0;	// 스톱워치가 실행상태이면 정지상태로 변경한 후 
        location.href = "stopTime?runningconfirm="+running+"&progresstime="+time;
        
        document.getElementById("start").innerHTML = "start"; // start버튼을 start버튼으로 변경
   
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

</head>
<body onload="continueTime();">

<!-- 메뉴 바 시작  -->
<header class="header_area">
           	<div class="top_menu">
           		<div class="container">
           			
           		</div>
           	</div>
            <div class="main_menu" id="mainNav">
            	<nav class="navbar navbar-expand-lg navbar-light">
					<div class="container">
						<!-- Brand and toggle get grouped for better mobile display -->
						<a class="navbar-brand logo_h" href="index.html"><img src="img/i" alt=""><img src="img/logo-2.png" alt=""></a>
						<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						
								<ul class="nav navbar-nav menu_nav ml-auto">
								<li class="nav-item active"><a class="nav-link" href="index.html">Home</a></li> 
					 		
							<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Personal</a>
									<ul class="dropdown-menu">
											<li class="nav-item"><a class="nav-link" href="single-blog.html">Daily Management </a></li>
										<li class="nav-item"><a class="nav-link" href="blog.html">daily time sheet</a></li>
									
											<li class="nav-item"><a class="nav-link" href="single-blog.html">View Graph</a></li>
									</ul>
								</li>  
								
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">GROUP</a>
									<ul class="dropdown-menu">
										<li class="nav-item"><a class="nav-link" href="blog.html">Add Friend</a></li>
										<li class="nav-item"><a class="nav-link" href="single-blog.html">Friend List</a></li>
									</ul>
								</li> 
								<li class="nav-item submenu dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">My Page</a>
									<ul class="dropdown-menu">

										<li class="nav-item"><a class="nav-link" href="single-blog.html">Logout</a></li>
									</ul>
								</li> 
							</ul>
						</div> 
					</div>
            	</nav>
            </div>
        </header>
        
        
  <!-- 메뉴 바 끝 -->      
        
<%// 스톱워치 진행 여부
String runningconfirm = (String)session.getAttribute("runningconfirm");
if(runningconfirm == null) runningconfirm = "0";
out.print(" runningconfirm : ");
out.print(runningconfirm);
%>
<input type ="hidden" id = "runningconfirm" value="<%=runningconfirm%>">

</br>
<%// main page 돌아온 시간
String returnHour = (String) session.getAttribute("hourReturnedMain");
String returnMinute = (String) session.getAttribute("minuteReturnedMain");
String returnSecond = (String) session.getAttribute("secondReturnedMain");

/* out.print("returned main page time : ");
out.print(returnHour+" : "); 
out.print(returnMinute+" : "); 
out.print(returnSecond); */

%>
</br>
<%// start버튼 누른 시간
String startHour = (String) session.getAttribute("startstopwatch_hour");
String startMinute = (String) session.getAttribute("startstopwatch_minute");
String startSecond = (String) session.getAttribute("startstopwatch_second");

out.print("start time watch time : ");
out.print(startHour+" : "); 
out.print(startMinute+" : "); 
out.print(startSecond);
%>
</br>
<%// main돌아온 시간 - start 시간
	int continueHour = Integer.parseInt(returnHour)-Integer.parseInt(startHour);
	int continueMinute = Integer.parseInt(returnMinute)-Integer.parseInt(startMinute);
	int continueSecond = Integer.parseInt(returnSecond)-Integer.parseInt(startSecond);
	
	int time1 = (Integer.parseInt(returnHour))*(60*60)+(Integer.parseInt(returnMinute))*60+Integer.parseInt(returnSecond);
	int time2 = (Integer.parseInt(startHour))*(60*60)+(Integer.parseInt(startMinute))*60+Integer.parseInt(startSecond);
	
	int time = time1 - time2;	
	out.print("whole Time : "+time);
%>

<input type ="hidden" id = "continueHour" value="<%=continueHour%>">
<input type ="hidden" id = "continueMinute" value="<%=continueMinute%>">
<input type ="hidden" id = "continueSecond" value="<%=continueSecond%>">
<input type ="hidden" id = "continueTime" value="<%=time%>">
	



	<div class=mainfish>
		<div class=user>${userId}님 의 하루 일과</div>


</br>

<div class=daily align=center><h5>-Daily ManageMent-</h5></div></br>	
	
<!-- 스톱워치 시간 -->
<div class="stop">
	<h3>
		<p id="output">
			<b>0:00:00:00</b>
		</p>
	</h3>
</div>

<!-- 스톱워치 버튼 -->
<br>

<div id="controls" align="left">
	<button id="startPause" onclick="startPause(0)">
		<b id="start">Start</b>
		</b>
	</button>

</div>
<!-- 나의 Task 목록 -->
<div class=todo>
<table width="500" cellpadding="0" cellspacing="0" border="0">
	<tr>
		<td>Work type Work name Work detail</td>
	</tr>
		
	<c:forEach items="${worklist}" var="dto">
		<tr>
			<td><input type="radio" name="work" id="work" value="worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">
				<input type="radio" name ="workType" value="${dto.worktype}" style="display:none"/>
				<input type="radio" name ="workName" value="${dto.workname}" style="display:none"/>
				<input type="radio" name ="workDetail" value="${dto.workdetail}" style="display:none"/>
				
				${dto.worktype} / ${dto.workname} / ${dto.workdetail}
				</input>
			</td>
		</tr>
	</c:forEach>
</table>

</div>
</br>





<!-- 메뉴 버튼  -->
		<div class="side" align="right">


			<h3>Friend</h3>
			<form  action="searchFriendPage">
				<input type="submit" value="Search Friend"/>
			</form>
			
			<form  action="friendList">
				<input type="submit" value="Friend List"/>
			</form>


			<h3>Personal</h3> 
			<form action="addNewWorkPage">
				<input type="submit" value="Add new work"/>
			</form>

			<form action="manageMyWorkPage">
				<input type="submit" value="Manage my work"/>
			</form>

			<form action="dailyManagement">
				<input type="submit" value="Daily Management" />
			</form>

			<form action="viewTable">
				<input type="submit" value="View daily time sheet" />
			</form>

			<form action="canvasjschart">
				<input type="submit" value="View Graph" />
			</form>
	<form action="test">
				<input type="submit" value="test" />
			</form>
			<form action="searchTimeSheetPage">
				<input type="submit" value="search another Daily Time Sheet" />
			</form>

			<h3>Group</h3>
			<form action="">
				<input type="submit" value="option1" onclick= " timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option2" onclick=" timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option3" onclick=" timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option4" onclick=" timeContainner()" />
			</form>

			<h3>My Page</h3>
			<form action="">
				<input type="submit" value="option1" onclick=" timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option2" onclick=" timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option3" onclick=" timeContainner()" />
			</form>

			<form action="">
				<input type="submit" value="option4" onclick=" timeContainner()" />
			</form>

			<h3>Logout</h3>
			<form action="logout">
				<input type="submit" value="logout" />
			</form>
			
		</div>
		</div>
</body>
</html>
