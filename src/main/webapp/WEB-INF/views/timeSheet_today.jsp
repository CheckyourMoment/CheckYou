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
<h2>- Today's time sheet </h2>

<form>
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>Progress Time</td> <td>kind</td> <td>work</td> <td>evaluation</td> <td>Work detail</td>
		</tr>
		
		<c:forEach items="${timeSheet}" var="dto">
		<tr>
			<td>${dto.progresstime}</td>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>good</td>
			<td>${dto.workdetail}</td>
		</tr>
		</c:forEach>
		
	</table>
</form>

</body>
</html>