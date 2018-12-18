<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>joinForm</title>
<!-- 
<script type="text/javascript"
	src="./js/Validation.js">
</script>
	 -->

</head>
<body>

	<form action="join" method="post"
		onsubmit="return validate()">


		<center>
			<table border="0" cellspacing="0" id="myTable">

				<tr align="center">
					<td colspan="2" bgcolor="##3498db">Sign up</td>
				</tr>

				<tr>
					<td align="center" bgcolor="#ffffff">ID</td>
					<td><input type="text" size="25" id="id" name="id">4 ~ 12 characters and number
						</td>
				</tr>

				<tr>
					<td align="center" bgcolor="#ffffff">password</td>
					<td><input type="text" size="25" id="password" name="password">4 ~ 12 characters and number
					</td>
				</tr>

				<tr>
					<td align="center" bgcolor="#ffffff">password confirm</td>
					<td><input type="text" size="25" id="confirmpassword"></td>
				</tr>

				<tr>
					<td align="center" bgcolor="#ffffff">email</td>
					<td><input type="text" size="25" id="email" name="email">
					</td>
				</tr>

			

			</table>
		</center>

		<br>
		<center>
			<input type="submit" value="sign up"> <input type="reset" value="reset">
		</center>


	</form>

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	<script type="text/javascript">

var idCheck =/^[a-zA-Z0-9]{4,12}$/;
var pwCheck =/^[a-zA-Z0-9]{4,12}$/;
var mailCheck = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

var id = document.getElementById("id");
var password = document.getElementById("password");
var confirmpassword = document.getElementById("confirmpassword");
//유효성 검사
function validate() {
  if(idValidate() && pw1Validate() && pw2Validate() && mailValidate()){
    window.alert("returns true");
    return true;
  }else{
    window.alert("returns false");
    return false;
  }
}

//아이디 유효성 검사
function idValidate(){
  var idOK = idCheck.exec(id.value);
  if(idOK){
    window.alert("사용할 수 있는 아이디 입니다.");
    return true;
  }else{
    window.alert("아이디 형식이 틀립니다.");
    return false;
  }
}

//비밀번호 유효성 검사
function pw1Validate(){
  var pw1 = pwCheck.exec(password.value);
  if(pw1&& id.value!=password.value){
    window.alert("사용할 수 있는 비밀번호 입니다.");
    return true;
  }else{
    window.alert("비밀번호 형식이 틀립니다.");
    return false;
  }
}

//비밀번호 확인 유효성 검사
function pw2Validate(){
  var pw2OK = pwCheck.exec(confirmpassword.value);
  
  if(pw2OK && password.value==confirmpassword.value){
    window.alert("비밀번호 확인 되었습니다.");
    return true;
  }else{
    window.alert("비밀번호 형식이 틀립니다.");
    return false;
  }
}

//이메일 확인 유효성 검사
function mailValidate(){
  var mailOK = mailCheck.exec(email.value);
  if(mailOK){
    window.alert("사용할 수 있는 이메일 입니다.");
    return true;
  }else{
    window.alert("이메일 형식이 틀립니다.");
    return false;
  }
}

</script>	 
	
	
	

</body>
</html>