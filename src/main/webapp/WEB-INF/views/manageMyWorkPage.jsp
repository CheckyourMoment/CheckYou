<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/work.css"
	media="all">
	<script language="javascript">
function pclose1(){
    opener.location.reload();
    window.close();
}
</script>
<title>Insert title here</title>
</head>
<body>
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 mx-auto" style="margin-top: 40px">
	<form action="manageMyWorkPage" onsubmit="return check()">
<h3>You can manage your Work on this page</h3>
 

<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td>Work type</td>
			<td>Work name</td>
			<td>Work detail</td>
		</tr>
		<c:forEach items="${ManageWorklist}" var="dto">
		
		<tr>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>${dto.workdetail}</td>
			<td>
				<a href="deleteWork?workname=${dto.workname}&workdetail=${dto.workdetail}">delete</a>
			</td>
		</tr>
		
		</c:forEach>
		
</table>
 
     <a class="btn btn-outline-danger" href="dailyManagement" role="button"  onClick="pclose1();" >Close</a>
  
	</form>
	</div></div></div>
</body>
</html>