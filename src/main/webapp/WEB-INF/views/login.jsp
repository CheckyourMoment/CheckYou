<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login page</title>
</head>
<body>

	<%	// 세션 종료
		session.invalidate();
	%>
	
	<center>
		<h1>Sign in</h1>
		<hr>
		
		<form action="login" method="post">
		<b>ID: <input type="text" name="id" /> <br><br> 
		<b>PASS: <input type="password" name="password" /> <br><br>
		<input type="submit" value="sign in" /><br><br>
		</form>

		<form action="joinForm" method="post">
			<input type="submit" value="sign up" />
		</form>
	</center>
</body>
</html>