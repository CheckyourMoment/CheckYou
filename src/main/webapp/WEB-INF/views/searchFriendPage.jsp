<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<a href="dailyManagement">Back</a>

<h2>- Search you friend and add on this page! - </h2>
	
	<form action ="searchFriend">
	input your friend's id : <input type="text" name="searchFriend"/></br>
	<input type="submit" value="search"/>
	</form>
	</br>
<%
	String id = (String)request.getAttribute("searchedFriend");
%>
	<%if(id!=null){%>
		
	<form action="addFriend">
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<tr>
			<td><h3>- result -</h2></td>
		</tr>
		<tr>
			<td><%= id %>
			<input type="hidden" value="<%=id%>" name="friend"/>
			<input type="submit" value="add"/>
			</td>
		</tr>
	
		
	</table>
	</form>
	<%} else{%>
			this id is not

	<%} %>
	
	
	

</body>
</html>