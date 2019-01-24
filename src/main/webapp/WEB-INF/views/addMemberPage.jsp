<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="selectGroup">Back</a>  
<h2>- Search Member and invite! - </h2>
	
	<form action ="searchMember">
	input Member's id : <input type="text" name="searchMember"/></br>
	<input type="submit" value="search"/>
	</form>
	</br>
<%
	String id = (String)request.getAttribute("searchedMember");
%>
	<%if(id!=null){%>
		
	<form action="addMember">
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<tr>
			<td><h3>- result -</h2></td>
		</tr>
		<tr>
			<td><%= id %>
			<input type="hidden" value="<%=id%>" name="groupmember"/>
			<input type="submit" value="add"/>
			</td>
		</tr>
	
		
	</table>
	</form>
	<%} else{%>
			<!-- this id is not -->

	<%} %>



</body>
</html>