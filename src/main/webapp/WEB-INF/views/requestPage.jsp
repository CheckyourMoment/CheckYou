<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"><link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>	
	<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>	
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Home</title>
 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/request.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>Insert title here</title>
</head>
	<script language="javascript">
function pclose1(){
    opener.location.reload();
    window.close();
}
</script>
<body>
  
<h2>request list</h2>

	<table class="table" width="500" cellpadding="0" cellspacing="0" >
		 
		<c:forEach items="${requestList}" var="dto">
			<tr>
				<td>Group Name</td>
				<td>Owner</td>
			</tr>
			
			<tr>
				<td>${dto.groupname}</td>
				<td>${dto.constructor}</td>
				<td>
					<a href="accept?constructor=${dto.constructor}&groupname=${dto.groupname}&groupmember=${dto.groupmember}&acception=${dto.acception}">
<img src="https://img.icons8.com/color/48/000000/ok.png"></a>
					<a href="refuse?constructor=${dto.constructor}&groupname=${dto.groupname}&groupmember=${dto.groupmember}&acception=${dto.acception}">
					<img src="https://img.icons8.com/color/48/000000/cancel.png"></a>
				</td>
			</tr>
		</c:forEach>
			<c:if test="${empty requestList}">
						<tr>
							<td colspan="6" class="txt_center" style="margin:10px;">
							요청받은 리스트가 없습니다.  </td>
						</tr>
					</c:if>
	</table>
	<div class="btn">
  <a class="btn btn-outline-primary btn-lg" href="groupHome" role="button"  onClick="pclose1();" >Back</a>
 </div>
</body>
</html>