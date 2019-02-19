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
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	
<meta charset="utf-8">
<title>add work </title>

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
<script
	src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<body>
	<div class="container text-center">
		<div class="row">
			<div class="col-lg-6 mx-auto" style="margin-top: 40px">
 
	<h3>You can add new Work on this page</h3>
	<h3>Let's try!</h3>

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
		  <input type="text" id="workname" name="workname" placeholder="Input work name" value="" oninput="checkwork()"/>
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

    <button type="submit" name="submit" class="btn btn-outline-primary btn-lg" >Add</button>
     <a class="btn btn-outline-danger btn-lg" href="dailyManagement" role="button"  onClick="pclose1();" >Close</a>
  
</form>
<form name="addrform" id="addform" action="" method="post" onsubmit="return false;">

</form>
</div>	
</form>
</div></div>
	<script>
 	function checkwork() {
			var id = $('#workname').val();
	
			$.ajax({
				type : 'POST',
				data : {
					workname : id
				},
				url : "checkwork.do",
				error : function() {
					// 오류가 발생했을 때 호출된다. 
				},
				//result = 1 아이디 사용가능  0이면 사용 불가
				success : function(data) {
				 
					if ($.trim(data) == 1 && workname == "") {
						
						$("#worktype").css("background-color", "#FFCECE");
						$("#workname").css("background-color", "#FFCECE");
						$("#workdetail").css("background-color", "#FFCECE");
 
					} else if ($.trim(data) == 1) {
						/*성공*/
						$("#worktype").css("background-color", "#B0F6AC");
						$("#workname").css("background-color", "#B0F6AC");
						$("#workdetail").css("background-color", "#B0F6AC");
						alert("할일 추가 가능");
						/*  	$("submit").prop("disabled", false);
					 */	 
						}
 						 else if ($.trim(data) == 0) {
					/* 	 $("submit").prop("disabled", true);
		                 $("submit").css("background-color", "#aaaaaa"); */
		                $("#worktype").css("background-color", "#FFCECE");
						$("#workname").css("background-color", "#FFCECE");
						$("#workdetail").css("background-color", "#FFCECE");
						alert("이미 있는 할일 입니다.");
					}
				}

			//red : idcheck = 1 / blue : idcheck = 0
			});
		
			//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
		}
 	</script>
</body>
</html>
