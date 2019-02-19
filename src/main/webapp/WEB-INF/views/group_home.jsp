<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Group Home</title>

<script type="text/javascript">

	
/*  function selectGroup(i){
		var groupName = document.getElementById("groupName"+i).value;
		window.alert(groupName);
		
		location.href = "selectGroup?groupName="+groupName;
		
	} */
	
	
</script>

</head>
<body>

	<h3>you can make group and invite member. Manage your Group</h3>

	<p>
		<a href="MakeGroupPage">add Group</a>
	</p>
	
	<p>
		<a href="requestPage">requests</a>
	</p>


<%-- 	<form>
		<table>
			<tr>
				<% int i = 1; %>
				<c:forEach items="${grouplist_owner}" var="dto">
					<td><button onclick="selectGroup(<%=i%>)" value="${dto.groupName}" id="groupName<%=i%>">
							Group Name : ${dto.groupName} </br> Owner : ${dto.constructor}
						</button>
					</td>
				<% i++; %>
				</c:forEach>
			</tr>
		</table>
	</form> --%>
	
				<c:forEach items="${grouplist_owner}" var="dto">
					<span style="background-color:gray" >
						<a href = "selectGroup?groupName=${dto.groupName}&constructor=${dto.constructor}">
							<font color="white">Group Name : ${dto.groupName}</font></br>
							<font color="white"> Owner : ${dto.constructor}</font></br>
							<%-- <font color="white"> Type : ${dto.groupType}</font></br>
							<font color="white"> purpose : ${dto.purpose}</font></br> --%>
						</a>
					</span>
					</br></br>
				</c:forEach>
				
				
				<c:forEach items="${grouplist_member}" var="dto">
					<c:set var="constructor" value="${dto.constructor}" />
					<c:set var="member" value="${dto.groupmember}" />
					<c:set var="acception" value="${dto.acception}" />
					<c:if test="${constructor ne member}">
					<c:if test="${acception eq '1'}">
						<span style="background-color:green" >
							<a href = "selectGroup?groupName=${dto.groupname}&constructor=${dto.constructor}">
								<font color="red">Group Name : ${dto.groupname}</font></br>
								<font color="red"> Owner : ${dto.constructor}</font>
							</a>
						</span>
						</br></br>
					</c:if>
					</c:if>
				</c:forEach>


</body>
</html>