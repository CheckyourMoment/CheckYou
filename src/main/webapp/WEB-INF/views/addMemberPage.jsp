<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="selectGroup">Back</a>  
<h2>- Search Member and invite! - </h2>
	
	<form action ="searchMember">
	input Member's id : <input type="text" name="searchMember"/></br>
	<input type="submit" value="search"/>
	</form>
	</br>
<%
	String id = (String)request.getAttribute("searchedMember");
%>
	<%if(id!=null && id!="notExist"){%>
		
	<form action="addMember">
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<tr>
			<td><h3>- result -</h2></td>
		</tr>
		<tr>
			<td><%= id %>
			<input type="hidden" value="<%=id%>" name="groupmember" id="groupmember"/>
			<input type="submit" value="add"/>
			</td>
		</tr>
	
		
	</table>
	</form>
	
 	
	
	
	<%} else if(id=="notExist"){
			//this id is not
			out.print("<input type='hidden' id='NotExist' value='NotExist'></input>");
	} %>
	
	
	<%String invite = (String)request.getAttribute("invite"); %>
	<!-- member invite Check -->
	<%if(invite=="success"){
		out.print("<input type='hidden' id='invite' value='success'></input>");
	} 
	else if(invite=="fail"){
		out.print("<input type='hidden' id='invite' value='fail'></input>");
	}
	
	%>	
<script type="text/javascript">
	window.onload = function(){
		var NotExist = document.getElementById("NotExist");
		if(NotExist != null){
		var gNotExistValue = NotExist.value;
			window.alert("Not Exist");
	   }
		
		// MemberInviteCheck Alert logic
		var invite = document.getElementById("invite");
		if(invite != null){
			var inviteValue = invite.value;
			if(inviteValue=="success"){
				window.alert("invite success");
			}
			else{
				window.alert("already invite or member");
			}
		}
		
		
		
	}
</script>

</body>
</html>