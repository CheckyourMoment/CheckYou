<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/work.css"
	media="all">

<meta charset="UTF-8">
<title>add member</title>
</head>
<script
	src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>

<%String user = (String)session.getAttribute("userId"); %>

<a href="selectGroup">Back</a>  
	<h2>- member list</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<c:forEach items="${memberList}" var="dto">
			<tr>
				<td>
					<a href="viewMemberTable?groupmember=${dto.groupmember}">${dto.groupmember}</a>
				</td>
					<c:set var="constructor" value="${dto.constructor}"/>
					<c:set var="member" value="${dto.groupmember}" />
					<c:set var="loginUser" value="<%=user %>" />
					
				<c:if test="${constructor eq loginUser}">
					<c:if test="${constructor ne member}">
				<td><a href="deleteMember?groupmember=${dto.groupmember}">delete</a></td>
					</c:if>
				</c:if>	
					
					
					<c:if test="${constructor eq member}">
				<td>owner</td>
					</c:if>
			</tr>
		</c:forEach>

	</table>


	<h2>- invite list</h2>

	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<c:forEach items="${inviteList}" var="dto">
			<tr>
				<td>${dto.groupmember}</td>
				<c:set var="constructor" value="${dto.constructor}"/>
					<c:set var="member" value="${dto.groupmember}" />
					<c:set var="loginUser" value="<%=user %>" />
					
				<c:if test="${constructor eq loginUser}">
					<c:if test="${constructor ne member}">
				<td><a href="cancelInvite?groupmember=${dto.groupmember}">cancel</a></td>
					</c:if>
				</c:if>	
			</tr>
		</c:forEach>

	</table>

</body>
</html>