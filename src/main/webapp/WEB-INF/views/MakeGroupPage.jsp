<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MakeGroup</title>

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

<a onClick="history.back();">Back</a>   

<form action="addGroup" onsubmit="return check()">

	<table>
		<tr>
		  Input Group Name : <input type="text" id="groupName" name="groupName" value=""/>
		</tr>
		</br>
	
		<tr>
		  Input Group Type : <input type="text" id="groupType" name="groupType" value=""/>
		</tr>
		</br>
		
		<tr>
		  Input Purpose : <input type="text" id="purpose" name="purpose" value=""/>
		</tr>
		</br>
		
	</table>

	<input type="submit" value="Add"/>
 	</form>


</body>
</html>