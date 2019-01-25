<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Check You</title>
<script>
	//	$(function() {
	//		$("#findBtn").click(function() {
	//			$.ajax({
	//				url : "findPW",
	//				type : "POST",
	//				data : {
	//					email : $("#email").val()
	//				},
	//				success : function(result) {
	//					alert(result);
	////				},
	//			})
	//		});
	//	})
</script>

</head>
<body>
	<h3>Find your ID</h3>
	<form action="findID">
		<table>
			<tr>
				<td>Input Email : <input type="text" name="findID" /> 당신의
					ID:${findedID}  &nbsp&nbsp
				</td>
				<td></td>
				<td><input type="submit" value="find" /></td>
			</tr>
		</table>
	</form>
	<h3>Find your PW</h3>
	<form action="findPW" method="post">
		<table>
			<tr>
				<td><label>Input Email</label> <input type="text" name="email"
					id="email" /></td>
				<td><input type="submit" value="find" /></td>
			</tr>
		</table>
		<!--<button type="button" id=findBtn>find</button>-->
	</form>
</body>
</html>