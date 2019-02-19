<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	String loginUser = (String) session.getAttribute("userId");
	//String email = (String) session.getAttribute("nowEmail");
%>

</head>
<body>
	<h3>My Page</h3>
	<h5 align="right"><%=loginUser%>님 환영합니다.
	</h5>
	<form>
		<input type="hidden" value="<%=loginUser%>" id="loginUser"></input>
		<p>
			<label>ID</label> <input type="text" id="loginUser" name="loginUser"
				value="<%=loginUser%>" readonly>
		</p>

		<!-- <p>
			<label>Email</label> <input type="text" id="email" name="email"
				value="<%=email%>" readonly>
		</p> -->
		<p>
			<button type="submit" id="">회원정보 수정</button>
		</p>

	</form>

	<form action="modifyPW" method="post">
		<input type="hidden" value="<%=loginUser%>" id="loginUser"></input>

		<p>
			<label>Password</label> <input type="password" id="modifyPW"
				name="modifyPW" required>
		<p>
			<button type="submit" id="">비밀번호 변경</button>
		</p>
	</form>



</body>
</html>