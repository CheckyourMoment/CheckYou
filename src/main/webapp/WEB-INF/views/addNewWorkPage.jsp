<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>add work</title>

<script type="text/javascript">
	
	function check(){
		
		var workname = document.getElementById("workname").value;
		var worktype = document.getElementById("worktype").value;
		var workdetail = document.getElementById("workdetail").value; 
		
		 if(worktype==""){
				window.alert("작업의 종류를 입력 하세요.");
				return false;
			} 
		 
		 if(workname == ""){
				window.alert("작업명을 입력 하세요.");
				return false;
			} 
		
		 if(workdetail == ""){
			window.alert("상세 내용을 입력 하세요.");
			return false;
		} 
		
		return true;
	}
	
</script>


</head>
<body>
	<a href="dailyManagement">Back</a>
	<h3>You can add new Work on this page</h3>
	<h3>Let's try!</h3>
	
	
	
	<form action="addNewWork" onsubmit="return check()">
	<table>
		<tr>
		Input Type of work - <input type="text" id="worktype" name="worktype" value=""/>
		</tr>
		</br>
	
		<tr>
		Input work name - <input type="text" id="workname" name="workname" value=""/>
		</tr>
		</br>
		
		<tr>
		Input detail of work - <input type="text" id="workdetail" name="workdetail" value=""/>
		</tr>
		</br>
		
	</table>
	
	<input type="submit" value="Add"/></br>
	</form>
	
</body>
</html>