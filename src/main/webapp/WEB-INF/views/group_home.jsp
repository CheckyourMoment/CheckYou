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
							<font color="white"> Owner : ${dto.constructor}</font>
						</a>
					</span>
					</br></br>
				</c:forEach>


</body>
</html>