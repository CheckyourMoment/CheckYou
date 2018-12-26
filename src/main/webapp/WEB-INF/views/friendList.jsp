<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>friendList</title>
</head>
<body>
<a href="dailyManagement">Back</a>
<h2>- Your friend list</h2>

<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>Friend's Id</td>
		</tr>
		<c:forEach items="${friendList}" var="dto">
		<tr>
			<td>${dto.friend}</td>
		</tr>
		</c:forEach>
		
	</table>
  


</body>
</html>