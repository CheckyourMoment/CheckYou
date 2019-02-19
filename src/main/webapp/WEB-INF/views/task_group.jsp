<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<%@ page import="com.spring.checkYou.dto.GroupTaskDto"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">

<title>JOIN</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<script>
window.onload = function () {
	
// task data
var taskNum = document.getElementById("taskNum").value;
var taskname = new Array();
var username = new Array();
var progress_string = new Array();
var progress = new Array();
for(var i = 0; i<taskNum;i++){
	taskname[i] = document.getElementById("taskname"+i).value;
	username[i] = document.getElementById("username"+i).value;
	progress_string[i] = document.getElementById("progress"+i).value;
	
	progress[i] = parseInt(progress_string[i]);

} 


// mission data
var missionNum = document.getElementById("missionNum").value;
var missionName = new Array();
var missionUsername = new Array();
var missionProgress_string = new Array();
var missionProgress = new Array();
for(var i = 0; i<missionNum;i++){
	missionName[i] = document.getElementById("missionName"+i).value;
	missionUsername[i] = document.getElementById("missionUsername"+i).value;
	missionProgress_string[i] = document.getElementById("missionProgress"+i).value;
	
	missionProgress[i] = parseInt(missionProgress_string[i]);
} 

/* var dps = [[]];
var yValue;
var label;
<c:forEach var="i" begin="1" end="9" step="1">

	<c:forEach items="${taskList}" var="dto">
		label = "${dto.workname}";
		dps["${i}"].push({
			label : label,
		});		
	</c:forEach>
</c:forEach>	 */

var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	title: {
		text: "This group's task"
	},
	axisX: {
		interval: 1
	},
	axisY: {
		title: "Progress",
	
	},
	data: [{
		type: "bar",
		toolTipContent: "<b>{label}</b> <br> user: {user} <br> {y}% of Task",
		dataPoints: [
			{ label: taskname[0], user: username[0], y: progress[0]},
			{ label: taskname[1], user: username[1], y: progress[1]},
			{ label: taskname[2], user: username[2], y: progress[2]},
			{ label: taskname[3], user: username[3], y: progress[3]},
			{ label: taskname[4], user: username[4], y: progress[4]},
			{ label: taskname[5], user: username[5], y: progress[5]},
			{ label: taskname[6], user: username[6], y: progress[6]},
			{ label: taskname[7], user: username[7], y: progress[7]},
			{ label: taskname[8], user: username[8], y: progress[8]},
			{ label: taskname[9], user: username[9], y: progress[9]},
			{ label: taskname[10], user: username[10], y: progress[10]},
			
			{ label: missionName[0], user: missionUsername[0], y: missionProgress[0]},
			{ label: missionName[1], user: missionUsername[1], y: missionProgress[1]},
			{ label: missionName[2], user: missionUsername[2], y: missionProgress[14]},
			{ label: missionName[3], user: missionUsername[3], y: missionProgress[3]},
			{ label: missionName[4], user: missionUsername[4], y: missionProgress[4]},
			{ label: missionName[5], user: missionUsername[5], y: missionProgress[5]},
			
			
		]
	}]
});
chart.render();

}
</script>



</head>
<body>
<a href="selectGroup">Back</a>  
<div id="chartContainer" style="height: 370px; width: 100%;"></div>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

</br></br></br>


<button onclick="addWorkProgress()">Add Task</button>

<button onclick="addMission()">Add Mission</button>

<form action="taskList">
	<input type="submit" value="Task List"></input> 
</form>

<form action="missionList">
	<input type="submit" value="Mission List"></input>
</form>

<form action="completedList">
	<input type="submit" value="Completed List"></input>
</form>

<!-- taskList -->
<%String dispList = (String)request.getAttribute("dispList"); %>
<%if(dispList != null){ %>
<table width="500" cellpadding="0" cellspacing="0" border="0">
		<c:forEach items="${taskList}" var="dto">
		<tr>
			<td>${dto.workname}</td>
			<td>${dto.progress}%</td>
			<td><button onclick="updateProgress('${dto.workname}')">update</button></td>
			<td><button onclick="deleteProgress('${dto.workname}')">delete</button></td>
		</tr>
		</c:forEach>
</table>
<%} %>

<!-- completedList -->
<table width="500" cellpadding="0" cellspacing="0" border="0">
		<c:forEach items="${completedList}" var="dto">
		<tr>
			<td>${dto.workname}</td>
			<td>${dto.progress}%</td>
			<td><button onclick="updateProgress('${dto.workname}')">update</button></td>
			<td><button onclick="deleteProgress('${dto.workname}')">delete</button></td>
		</tr>
		</c:forEach>
</table>

<!-- missionList -->
<%String dispMissionList = (String)request.getAttribute("dispMissionList"); %>
<%if(dispMissionList != null){ %>
<table width="500" cellpadding="0" cellspacing="0" border="0">
		<c:forEach items="${missionList}" var="dto">
		<tr>
			<td>${dto.workname}</td>
			<td>${dto.deadline}</td>
			<td>${dto.progress}%</td>
			<td><button onclick="updateProgress('${dto.workname}')">update</button></td>
			<td><button onclick="deleteProgress('${dto.workname}')">delete</button></td>
		</tr>
		</c:forEach>
</table>
<%} %>





 <!-- taskDatas -->
<%
List<GroupTaskDto> taskDataList = (List<GroupTaskDto>)request.getAttribute("taskList");
Iterator iter = taskDataList.iterator();
int i = 0;
while(iter.hasNext()) {
	GroupTaskDto dto = (GroupTaskDto)iter.next();
	
	String workname = dto.getWorkname();
	String username = dto.getUsername();
	String progress = dto.getProgress();
	
	out.print("<input type='hidden' id='taskname"+i+"' value='"+workname+"'></input>");
	out.print("<input type='hidden' id='username"+i+"' value='"+username+"'></input>");
	out.print("<input type='hidden' id='progress"+i+"' value='"+progress+"'></input>");
	i++;
}
	out.print("<input type='hidden' id='taskNum' value = '"+i+"'></input>");
	
%> 


 <!-- mission Data -->
<%
List<GroupTaskDto> missionDataList = (List<GroupTaskDto>)request.getAttribute("missionList");

if(missionDataList != null){

Iterator iter2 = missionDataList.iterator();
int j = 0;
while(iter2.hasNext()) {
	GroupTaskDto dto2 = (GroupTaskDto)iter2.next();
	
	String workname2 = dto2.getWorkname();
	String username2 = dto2.getUsername();
	String progress2 = dto2.getProgress();
	
	out.print("<input type='hidden' id='missionName"+j+"' value='"+workname2+"'></input>");
	out.print("<input type='hidden' id='missionUsername"+j+"' value='"+username2+"'></input>");
	out.print("<input type='hidden' id='missionProgress"+j+"' value='"+progress2+"'></input>");
	j++;
}
	out.print("<input type='hidden' id='missionNum' value = '"+j+"'></input>");
} %>
 




<%--   	<!-- group Task Check -->
<%
	String groupTaskCheck = (String)request.getAttribute("groupTaskCheck");
%>
	
	<%if(groupTaskCheck=="exist"){
			out.print("<input type='hidden' id='exist' value='exist'></input>");
	} 
	else if(groupTaskCheck=="success"){
		out.print("<input type='hidden' id='exist' value='success'></input>");
	}
	%>
	

<script type="text/javascript">
	window.onload = function(){
		// GroupCheck Alert logic
		var exist = document.getElementById("exist");
		if(exist != null){
			var existValue = exist.value;
			if(existValue=="exist"){
				window.alert("allready Exist");
			}
			else{
				window.alert("success");
			}
		
		}
	}
</script>  --%>


<script type="text/javascript">
	function addWorkProgress(){
		
		 var Result = prompt( 'work name', '' );
	    
		 if(Result != null){
			 if(Result == ""){
				 window.alert("Please input task name");
				 return addWorkProgress();
			 }
		 location.href="addWorkProgress?work="+Result;
		 }
	}
</script>



<script type="text/javascript">
	function updateProgress(workname){
		
		var Result = prompt( 'input progress', '' );
	    
		 if(Result < 0){
			 window.alert("please update over 0 ");
			 return updateProgress();
		 }
		 
		 if(Result > 100){
			 window.alert("please Update below 100 ");
			 return updateProgress();
		 }
		
		
		 if(Result != null){
			 if(Result == ""){
				 window.alert("Please input number");
				 return updateProgress();
			 }
		 location.href="updateProgress?progress="+Result+"&work="+workname;
		 }
	}
</script>

<script type="text/javascript">
	function deleteProgress(workname){
		if (confirm("Are you sure you want to delete?") == true){    //확인
			 location.href="deleteProgress?work="+workname;
		}
		else{   //취소
		    return;
		}


	}
</script>

<script type="text/javascript">
	function addMission(){
		
		 var Result = prompt( 'work name', '' );
	    
		 if(Result != null){// 확인
			 if(Result == ""){
				 window.alert("Please input task name");
				 return addMission();
			 }
		 
		 	var Result2 = prompt( 'Deadline(0000-00-00)', '' );
		 	if(Result2 != null){// 확인
				 if(Result2 == ""){
					 window.alert("Please input Deadline");
					 return addMission();
				 }
		 // 모두 통과시
		 	location.href="addMission?work="+Result+"&deadline="+Result2;
		 }
		 }
	}
	
</script>

</body>
</html>