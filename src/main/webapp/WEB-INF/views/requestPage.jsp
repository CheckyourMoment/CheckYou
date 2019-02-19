<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
<body>
<a href="groupHome">Back</a>  
<h2>request list</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<c:forEach items="${requestList}" var="dto">
			<tr>
				<td>Group Name</td>
				<td>Owner</td>
			</tr>
			
			<tr>
				<td>${dto.groupname}</td>
				<td>${dto.constructor}</td>
				<td>
					<a href="accept?constructor=${dto.constructor}&groupname=${dto.groupname}&groupmember=${dto.groupmember}&acception=${dto.acception}">수락</a>
					<a href="refuse?constructor=${dto.constructor}&groupname=${dto.groupname}&groupmember=${dto.groupmember}&acception=${dto.acception}">거절</a>
				</td>
			</tr>
		</c:forEach>

	</table>


</body>
</html>