<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(function(){
		if(${msg ne null}){
			alert('${msg}');
		};
		
		if($("#pwForm").submit(function(){
			if($("#pw").val() !== $("#pw2").val()){
				alert("비밀번호가 다릅니다.");
				$("#pw").val("").focus();
				$("#pw2").val("");
				return false;
			}else if ($("#pw").val().length < 8) {
				alert("비밀번호는 8자 이상으로 설정해야 합니다.");
				$("#pw").val("").focus();
				return false;
			}else if($.trim($("#pw").val()) !== $("#pw").val()){
				alert("공백은 입력이 불가능합니다.");
				return false;
			}
		}));
	})
</script>
</head>
<body>
<h3>My Page ${dto.id}</h3>
	<form id="pwForm" action="modify" method="post">
		<input type="hidden" name="id" value="${ dto.id }">
		<p>
			<label>Password</label> <input id="old_pw" name="old_pw"
				type="password" required>
		</p>
		<p>
			<label>New Password</label> <input id="pw" name="pw" type="password"
				required>
		</p>
		<p>
			<label>Confirm</label> <input type="password" id="pw2" required>
		</p>
		<p>
			<button type="submit" id="joinBtn">비밀번호 변경</button>
		</p>
	</form>



</body>
</html>