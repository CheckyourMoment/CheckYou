<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>today's time sheet</title>
</head>
<body>




<a href="dailyManagement">Back</a>
<h2>- Today's time sheet </h2>

<form>
	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<tr align="center">
			<td>Time</td>
			<td>kind</td>
			<td>work</td>
			<td>Work detail</td>
			<td>evaluation</td>
			<td style="border:0">evaluate you task!</td>
		</tr>
		
		<c:forEach items="${timeSheet_today}" var="dto">
		<tr align="center">
			<td>${dto.starttime}
				</br>|</br>
				${dto.endtime}
			</td>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>${dto.workdetail}</td>
		
			
		<c:choose>
   		 <c:when test="${dto.evaluation eq 'good'}">
   		  	<td style="background-color:blue">
      			<p style="color:white">good</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'bad'}">
   		 	 <td style="background-color:red">
      			<p style="color:white">bad</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'soso'}">
   		 	 <td style="background-color:gray">
      			<p style="color:white">soso</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:otherwise>
   			 <td>
      			<p> Not evaluated yet</p>
      		</td>
  		  </c:otherwise>

		</c:choose>
		
		
			<td style="border:0">
				<a href="evaluate?evaluation=good&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">good</a>
				<a href="evaluate?evaluation=bad&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">bad</a>
				<a href="evaluate?evaluation=soso&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">soso</a>
			</td>
			
			<td>
				<a href="deleteTimeSheet?starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">delete</a>
			</td>
			
		</tr>
		
		</c:forEach>
		
	</table>
</form>

</body>

</html>