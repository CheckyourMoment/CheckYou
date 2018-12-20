<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	
</head>
<body>

<%
	String startTime = request.getParameter("serverTime"); 
%>

<div >${userId}님 환영 합니다.</div> </br>
<div >-Daily ManageMent-</div> </br>
  
  <table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>Work type</td> <td>Work name</td>
		</tr>
		<c:forEach items="${worklist}" var="dto">
		<tr>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>
			<a href="startWork?worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">start</a>
			</td>
			<td><a href="stopWork">stop</a></td>
		</tr>
		</c:forEach>
		
	</table>
	</br>
	 <P>  start time : <%=startTime %> </P> 
	 <P>  stop time :</P> 
 	 <P>  progressed Time: ${progressedTime}</P>
  
  
<div align="right">

  <h3>Friend</h3>
  	<form action="searchFriendPage">
 <input type="submit" value="Search Friend"/>
	</form>

	<form action="friendList">
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
 <input type="submit" value="Daily Management"/>
	</form>
	
	<form action="viewTable">
 <input type="submit" value="View daily time sheet"/>
	</form>
	
	<form action="viewGraph">
 <input type="submit" value="View Graph"/>
	</form>
	
	<form action="searchTimeSheetPage">
 <input type="submit" value="search another Daily Time Sheet"/>
	</form>
	
  
  <h3>Group</h3>
  <form action="">
 <input type="submit" value="option1"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option2"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option3"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option4"/>
	</form>
	
	  <h3>My Page</h3>
  <form action="">
 <input type="submit" value="option1"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option2"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option3"/>
	</form>
	
	 <form action="">
 <input type="submit" value="option4"/>
	</form>
  
  
  
  
  <h3>Logout</h3>
  <form action="logout">
 <input type="submit" value="logout"/>
	</form>
</div>



</body>
</html>
