<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">

<title>JOIN</title>
<!-- Meta tag Keywords -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />


<!-- css files -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/joinstyle.css"
	media="all">

<!-- Style-CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<!-- web-fonts -->
<link href="//fonts.googleapis.com/css?family=Tangerine:400,700"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i"
	rel="stylesheet">
<!-- //web-fonts -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head>

<script
	src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<body>
	<!-- title -->

	<!-- //title -->
	<!---728x90--->

	<!-- content -->
	<div class="sub-main-w3">
		<form class="join" action="join" method="post"
			onsubmit="return validate()">
			<fieldset>
				<h1>
					<span>C</span>ontact <span>U</span>s
					<div class="input">
						<input type="text" placeholder="Username" id="id" name="id"
							class="id" oninput="checkId()" autofocus> <span> <i
							class="fas fa-id-card-alt"></i>
						</span> <span id="idchk"></span>
					</div>
					<div class="input">
						<input type="password" placeholder="Password" id="password"
							class="password" name="password" oninput="checkPwd()"/> <span>
							<i class="fas fa-lock-open"></i>
							</span>

					</div>
					<div class="input">
						<input type="password" placeholder="Password Check"
							name="confirmpassword" id="confirmpassword" oninput="checkPwd()" />
						<span> <i class="fas fa-lock-open"></i>
						</span>

					</div>
					<div class="input">
						<input type="email" placeholder="Email" id="email" name="email" required autofocus/>
						<span> <i class="fas fa-envelope-square"></i>
						</span>

					</div>
					<button type="submit" class="submit" value="sign up"
						disabled="disabled">
						<i class="fas fa-sign-in-alt"></i>
					</button>
			</fieldset>
			<div class="feedback">
				You have logged in <br /> successfully.
			</div>
		</form>
	</div>
	<!-- //content -->
	<!---728x90--->

	<!-- copyright -->
	<div class="footer">
		<h2> 
		&copy; 2018 CHECK YOU Login Form. All rights reserved | Design by
			<a href="http://www.bit.com">FISH</a>
		</h2>
	</div>

	<!-- //content -->
	<!---728x90--->


	<!--  <script type="text/javascript">

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
 -->
	<!-- Jquery -->


	<script>
		$(".input").focusin(function() {
			$(this).find("span").animate({
				"opacity" : "0"
			}, 200);
		});

		$(".input").focusout(function() {
			$(this).find("span").animate({
				"opacity" : "1"
			}, 200);
		});
		<!--
		var test = $("#target");
		$('#target').submit(function(event) {
			$(".submit").css({
				"background" : "#2ecc71",
				"border-color" : "#2ecc71"
			});

			$("input").css({
				"border-color" : "#2ecc71"
			}, 6000);

			return login;
		});
		-->
	</script>


	<script>
		/* $("#checkid").css("background-color", "black"); */
		var idCheck = 0;
		var pwdCheck = 0;
		function checkId() {
			var id = $('#id').val();
			$.ajax({
				type : 'POST',
				data : {
					id : id
				},
				url : "checkId.do",
				error : function() {
					// 오류가 발생했을 때 호출된다. 
				},
				//result = 1 아이디 사용가능  0이면 사용 불가
				success : function(data) {
				
					if ($.trim(data) == 1 && id == "") {
					    $(".submit").prop("disabled", true);
						$(".submit").css("background-color", "#aaaaaa");
						$("#id").css("background-color", "#FFCECE");

						idCheck = 0;
					} else if ($.trim(data) == 1) {
					
						$("#id").css("background-color", "#B0F6AC");
						idCheck = 1;
						if (idCheck == 1 && pwdCheck == 1) {
							$(".submit").prop("disabled", false);
							$(".submit").css("background-color", "#4CAF50");
						}

					} else if ($.trim(data) == 0) {
					
						 $(".submit").prop("disabled", true);
		                   $(".submit").css("background-color", "#aaaaaa");
						$("#id").css("background-color", "#FFCECE");
						idCheck = 0;
					}
				}

			//red : idcheck = 1 / blue : idcheck = 0
			});
		
			//재입력 비밀번호 체크하여 가입버튼 비활성화 또는 맞지않음을 알림.
		}
		function checkPwd() {
				
				var password = $('#password').val();
				var confirmpassword = $('#confirmpassword').val();
			
		
				if ((password != confirmpassword || password == confirmpassword) && confirmpassword == "") {
					$(".submit").prop("disabled", true);
					$(".submit").css("background-color", "#aaaaaa");
					
					$("#confirmpassword").css("background-color", "#FFCECE");
					$("#password").css("background-color", "#FFCECE");
				} else if (password == confirmpassword) {
					$("#confirmpassword").css("background-color", "#B0F6AC");
					$("#password").css("background-color", "#B0F6AC");
					pwdCheck = 1;
					if (idCheck == 1 && pwdCheck == 1) {
						$(".submit").prop("disabled", false);
						$(".submit").css("background-color", "#4CAF50");
					}
				} else if (password != confirmpassword) {
					pwdCheck = 0;
					$(".submit").prop("disabled", true);
					$(".submit").css("background-color", "#aaaaaa");
					$("#confirmpassword").css("background-color", "#FFCECE");
					$("#password").css("background-color", "#FFCECE");

				}
			}
			/* $.ajax({
				data : {
					id : inputed
				},
				
				url : "checkId.do",
				
				
				success : function(data) {
					if (inputed == "" && $(data) == '0') {
						alert(data);
						
						$("#id").css("background-color", "black");
						idCheck = 0;
					} else if ($(data) == '0'){
						
						$("#id").css("background-color", "red");
						idCheck = 1;

					} else if ($(data) == '1') {
						$("#id").css("background-color", "red");
						idCheck = 0;
					}
				}

			}); */
	
	</script>
</body>

</html>