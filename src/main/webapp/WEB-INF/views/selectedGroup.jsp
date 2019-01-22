<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%String selectedGroup = (String)session.getAttribute("selectedGroup"); %>
Group Name : <%=selectedGroup %>


<div align="right">
	<a >Group Home</a>
	</br>
	<a href="addComment">comment</a>
	</br>
	<a href="MemberList">member</a>
	</br>
	<a>Delete Group</a>
</div>

</body>
</html>