<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<a href="dailyManagement">Back</a>

<h3>You can manage your Work on this page</h3>

<div >- manageMyWorkPage -</div> </br>

<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>Work type</td>
			<td>Work name</td>
			<td>Work detail</td>
		</tr>
		<c:forEach items="${ManageWorklist}" var="dto">
		
		<tr>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>${dto.workdetail}</td>
			<td>
				<a href="deleteWork?workname=${dto.workname}&workdetail=${dto.workdetail}">delete</a>
			</td>
		</tr>
		
		</c:forEach>
		
</table>
	
</body>
</html>