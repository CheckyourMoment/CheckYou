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
	<h3>You can add new Work on this page</h3>
	<h3>Let's try!</h3>
	
	
	
	<form action="addNewWork">
	<table>
		<tr>
		Input Type of work - <input type="text" id="workName" name="worktype"/>
		</tr>
		</br>
	
		<tr>
		Input work name - <input type="text" id="workName" name="workname"/>
		</tr>
		</br>
		
		<tr>
		Input detail of work - <input type="text" id="workName" name="workdetail"/>
		</tr>
		</br>
		
	</table>
	
	<input type="submit" value="Add"/></br>
	</form>
	
</body>
</html>