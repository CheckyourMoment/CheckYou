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