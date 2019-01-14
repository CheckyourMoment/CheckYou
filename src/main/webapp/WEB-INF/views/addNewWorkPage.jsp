<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<script language="javascript">
function pclose1(){
    opener.location.reload();
    window.close();
}
</script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/workadd.css"
	media="all">
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
	<h3>You can add new Work on this page</h3>
	<h3>Let's try!</h3>
	
	
	
	<form action="addNewWork" onsubmit="return check()">
	<table>
		<tr>
		  <input type="text"  class="question" id="worktype" name="worktype" value=""/>
		  <label for="worktype"><span>Input Type of work </span></label>
		</tr>
		</br>
	
		<tr>
		  <input type="text" id="workname" name="workname" value=""/>
			  <label for="workname"><span>Input work name </span></label>
		</tr>
		</br>
		
		<tr>
		 - <input type="text" id="workdetail" name="workdetail" value=""/>
		  <label for="workdetail"><span>Input detail of work </span></label>
		</tr>
		</br>
		
	</table>

	<input type="submit" value="Add"/>
	<a href="dailyManagement" onClick="pclose1();">Back</a>   

 	</form>

</body>
</html>
