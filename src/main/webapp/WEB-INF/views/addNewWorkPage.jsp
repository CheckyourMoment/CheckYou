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
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/work.css"
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
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-8 mx-auto" style="margin-top: 130px">
 
	<h3>You can add new Work on this page</h3>
	<h3>Let's try!</h3>
</div>	
	<br>
 
<form action="addNewWork" onsubmit="return check()">
	<table>
		<tr>
		<div class="input">
		  <input type="text"  class="question" id="worktype" name="worktype" placeholder="Input Type of work" value=""/>
		  <label for="worktype"><span> </span></label>
		</tr>
		</br>
	
		<tr>
		<div class="input">
		  <input type="text" id="workname" name="workname" placeholder="Input work name" value=""/>
			  <label for="workname"><span> </span></label></div>
		</tr>
		</br>
		
		<tr>
			<div class="input">
		<input type="text" id="workdetail" name="workdetail" placeholder="Input detail of work" value=""/>
		  <label for="workdetail"><span> </span></label></div>
		</tr>
		</br>
		
	</table>

	<input type="submit" value="Add"/>
	<a href="dailyManagement" onClick="pclose1();">Back</a>   

</form>
<form name="addrform" id="addform" action="" method="post" onsubmit="return false;">

</form>
</div></div>
</body>
</html>
