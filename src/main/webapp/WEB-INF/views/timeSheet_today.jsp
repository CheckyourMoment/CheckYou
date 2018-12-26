
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>today's time sheet</title>
</head>
<body>
<a href="dailyManagement">Back</a>
<h2>- Today's time sheet </h2>

<form>
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>kind</td> <td>work</td> <td>Work detail</td> <td>evaluation</td>
		</tr>
		
		<c:forEach items="${timeSheet}" var="dto">
		<tr>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>${dto.workdetail}</td>
			<td>good</td>
		</tr>
		</c:forEach>
		
	</table>
</form>

</body>

</html>