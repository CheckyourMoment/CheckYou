<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script language="javascript">
function pclose1(){
    opener.location.reload();
    window.close();
}
</script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/groupadd.css"
	media="all">
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta charset="UTF-8">
<title>Make Group</title>

<script type="text/javascript">
	
	function check(){
		
		var groupName = document.getElementById("groupName").value;
		var groupType = document.getElementById("groupType").value;
		var purpose = document.getElementById("purpose").value; 
		
		 if(groupName ==""){
				window.alert("그룹 명을 입력 하세요.");
				return false;
			} 
		 
		 if(groupType == ""){
				window.alert("그룹 종류를 입력 하세요.");
				return false;
			} 
		
		 if(purpose == ""){
			window.alert("목표를 입력 하세요.");
			return false;
		} 
		
		return true;
	}
	
</script>



</head>
<body>

<!-- <a onClick="history.back();">Back</a>   --> 
 
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 mx-auto" style="margin-top: 40px">
			<h3>Add Group</h3>
			<br>
<form action="addGroup" onsubmit="return check()">

	<table>
		<tr>
		<div class="input">
		  <input type="text" id="groupName" name="groupName" placeholder="  Input Group Name" value=""/></div>
		</tr>
		</br>
	
		<tr>
		<div class="input">
		  <input type="text" id="groupType" name="groupType" placeholder="Input Group Type" value=""/></div>
		</tr>
		</br>
		
		<tr>
		<div class="input">
		  <input type="text" id="purpose" name="purpose" placeholder="Input Purpose" value=""/></div>
		</tr>
		</br>
		
	</table>

	   <button type="submit" class="btn btn-outline-primary btn-lg">Add</button>
     <a class="btn btn-outline-danger btn-lg" href="dailyManagement" role="button"  onClick="pclose1();" >Close</a>
 	</form>
 	
 	<!-- group Check -->
<%
	String groupCheck = (String)request.getAttribute("groupCheck");
%>
	
	<%if(groupCheck=="exist"){
			out.print("<input type='hidden' id='exist' value='exist'></input>");
	} 
	else if(groupCheck=="success"){
		out.print("<input type='hidden' id='exist' value='success'></input>");
	}
	%>
	


<script type="text/javascript">
	window.onload = function(){
		// GroupCheck Alert logic
		var exist = document.getElementById("exist");
		if(exist != null){
			var existValue = exist.value;
			if(existValue=="exist"){
				window.alert("allready Exist");
			}
			else{
				window.alert("success");
			}
		
		}
	}
</script>

</body>
</html>