<%@page import="org.springframework.context.annotation.Primary"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Home</title>

<!-- 스톱워치 -->
<script>
// 전역 변수
var time = 0;
var running = 0; //  0:정지상태 	1:스톱워치 실행상태

// 메소드

// 
function startPause(){ 
    if(running == 0){
        running = 1;	// 스톱워치가 정지상태이면 실행상태로 변경한 후  
        increment();	// increment()메소드 실행
    document.getElementById("start").innerHTML = "Pause";	// start버튼을 pause버튼으로 변경
    }
    else{
        running = 0;	// 스톱워치가 실행상태이면 정지상태로 변경한 후  
    document.getElementById("start").innerHTML = "start"; // start버튼을 start버튼으로 변경
   
    }
}

//
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
            // 정지를 눌럿을 경우 즉, running=0일 경우 -> 진행시간과 endtime을 가지고 controller로 보내서 db에 저장 
            if(running == 0){
            	/* window.alert("test");  
            	window.alert(hours+" : "+mins+" : "+secs);  */
            }
            
            //------------------
           	    var timeContainer_hour = document.getElementById("timeContainer_hour");
            	var timeContainer_minute = document.getElementById("timeContainer_minute");
            	var timeContainer_second = document.getElementById("timeContainer_second");
            	timeContainer_hour.value=hours;
            	timeContainer_minute.value=mins;
            	timeContainer_second.value=secs;
            
            increment();
        },100)
    }
   
}

function timeContainner(str){
	
	var mapping = str;
	
	var timeContainer_hour = document.getElementById("timeContainer_hour");
 	var timeContainer_minute = document.getElementById("timeContainer_minute");
 	var timeContainer_second = document.getElementById("timeContainer_second");
 	var hours = timeContainer_hour.value;
 	var mins = timeContainer_minute.value;
 	var secs = timeContainer_second.value;
	
	location.href = "timeContainerTest?hour="+hours+"&minute="+mins+"&second="+secs+"&mapping="+mapping;
}


</script>

</head>
<body>


<%
	String hour = (String)session.getAttribute("timeContainer_hour");
	String minute = (String)session.getAttribute("timeContainer_minute");
	String second = (String)session.getAttribute("timeContainer_second");
%>

<!-- test -->
<%	out.print("@@@this is Test@@@");
	out.print(hour);
	out.print(minute);
	out.print(second);
%>
 
 
 
<!-- session scope에 저장되어 있는 스톱워치 시간을 담을 element -->
<input type="hidden" id="timeContainer_hour"/>
<input type="hidden" id="timeContainer_minute"/>
<input type="hidden" id="timeContainer_second"/>

	<div>${userId}님환영합니다.</div>
	</br>
	<div>-Daily ManageMent-</div>
	</br>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>

			<td>Work type Work name Work detail</td>
		</tr>
		<c:forEach items="${worklist}" var="dto">
			<tr>
				<td>
				<input type="radio" name="work" value="auto" checked>
					${dto.worktype} / ${dto.workname} / ${dto.workdetail} 
				</input>
				</td>
			</tr>
		</c:forEach>

	</table>
	
	
	
	<!-- 스톱워치 start -->
	<br>
	<div id="controls" align="left">
			<button id="startPause" onclick="startPause()">
				<b id="start">Start</b>
			</button>
			
		</div>
	<div class="container">
		<h3>
			<p id="output">
				<b>0:00:00:00</b>
			</p>
		</h3>
		
	</div>
	</br>
	<!-- 스톱워치 end -->






<!-- 자바스크립트 매개변수만 넘기면 끝이다. 힘내자 아자아자 -->
<!-- 끝나면 session의 타임+타이머자동으로 돌게 새로운 타임메소드 만들면 끝!! -->

	<div align="right">

		<h3>Friend</h3>
		 <%String searchFriend = "searchFriend";%>
		<input type="submit" value="Search Friend" onclick="timeContainner()"/>
	
		<%String friendList = "friendList";%>
		<input type="submit"  value="Friend List" onclick= "timeContainner()" />

		<h3>Personal</h3>
		<form action="addNewWorkPage">
			<input type="submit" value="Add new work onclick= "timeContainner()" />
		</form>

		<form action="manageMyWorkPage">
			<input type="submit" value="Manage my work onclick= "timeContainner()" />
		</form>

		<form action="dailyManagement">
			<input type="submit" value="Daily Management onclick= "timeContainner()" />
		</form>

		<form action="viewTable">
			<input type="submit" value="View Table onclick= "timeContainner()" />
		</form>

		<form action="viewGraph">
			<input type="submit" value="View Graph onclick= "timeContainner()" />
		</form>

		<h3>Group</h3>
		<form action="">
			<input type="submit" value="option1 onclick= "timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option2 onclick="timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option3 onclick="timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option4 onclick="timeContainner()" />
		</form>

		<h3>My Page</h3>
		<form action="">
			<input type="submit" value="option1 onclick="timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option2 onclick="timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option3 onclick="timeContainner()" />
		</form>

		<form action="">
			<input type="submit" value="option4 onclick="timeContainner()" />
		</form>




		<h3>Logout</h3>
		<form action="logout">
			<input type="submit" value="logout" />
		</form>
	</div>



</body>
</html>
