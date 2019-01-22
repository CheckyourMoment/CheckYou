<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>- member list</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<c:forEach items="${memberList}" var="dto">
			<tr>
				<td>${dto.groupmember}</td>
			</tr>
		</c:forEach>

	</table>


	<h2>- invite list</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<c:forEach items="${inviteList}" var="dto">
			<tr>
				<td>${dto.groupmember}</td>
			</tr>
		</c:forEach>

	</table>

</body>
</html>