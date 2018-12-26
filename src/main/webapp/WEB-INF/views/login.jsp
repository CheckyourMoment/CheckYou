<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<title>login page</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css?z">
<%-- <link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
 --%>
</head>
<body>
	<%
		// 세션 종료
		session.invalidate();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-4"
				style="background: rgba(0, 0, 0, 0.7); box-shadow: -1px 1px 30px 5px black;">
				<h1 class="text-center">LOGIN</h1>

				<form action="login" method="post" id="frm">
					<div class="input-group">

						<input type="text" class="form-control" name="id"
							placeholder="Username">
					</div>
					<div class="input-group">

						<input type="password" class="form-control" name="password"
							placeholder="Password">
					</div>
					<!-- <a href="login" onclick="document.getElementById('frm').submit();"

>Sign in</div></a> -->

<div class="input-group">
					<input type="submit" class="btn-danger" value="sign in" /></div>
					<a href="joinForm"><p class="text-center">Sign up? </p></a>
			</form>
				</div>
			</div>
			<div class="col-md-1"></div>
		</div>

	
		<div>
</body>
</html>