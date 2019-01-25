<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupComment</title>
</head>
<body>
	<h3>write down your opinion</h3>


	<%
		String name = (String) session.getAttribute("selectedGroup");
	%>
	Group Name :<%=name%>

	<form action="addComment">
		<input type="hidden" value="<%=name%>" name="groupName" />
		<table>
			<tr>
				<textarea cols="50" rows="8" id="groupComment" name="groupComment"
					value="">
						 </textarea>
			</tr>
			</br>
		</table>
		<div>
			<input type="submit" value="Save" />
		</div>

	</form>

	<div align="right">
		<a>Group Home</a> </br> <a href="comment">comment</a> </br> <a
			href="addMemberPage">AddMember</a> </br> <a href="MemberList">MemberList</a>
		</br> <a>Delete Group</a>
	</div>



</body>
</html>