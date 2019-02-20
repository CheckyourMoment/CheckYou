<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="UTF-8" />
<title>Check You</title>

<!-- css files -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/find.css"
	media="all">

<!-- Style-CSS -->
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<!-- Font-Awesome-Icons-CSS -->
<!-- //css files -->

<script
	src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>

	<div class="sub-main-w3">

		<form action="findID" id="findid_email" onsubmit="return findID()">
			<fieldset>
				<h1>
					<span>F</span>ind <span>Y</span>our <span>I</span>D
					<div class="input">
						<input type="text" placeholder="Email" name="findID" id="id"
							value="" required autofocus /> <span> <i
							class="fas fa-envelope-square"></i></span>
					</div>
					<div class="input">
						<input type="text" value="Your ID : ${findedID}" readonly /> <span>
							<i class="fas fa-id-card-alt"></i>
					</div>
					<button type="submit" class="submit" value="find">
						<i class="fas fa-sign-in-alt"></i>
					</button>
			</fieldset>
		</form>
		<br> <br>
		<form action="findPW" method="post">
			<fieldset>
				<h1>
					<span>F</span>ind <span>Y</span>our <span>P</span>W
					<div class="input">
						<input type="text" placeholder="Email" name="email" id="email"
							required autofocus /> <span><i
							class="fas fa-envelope-square"></i></span>
					</div>
					<button type="submit" class="submit" id="btn" value="find">
						<i class="fas fa-sign-in-alt"></i>
					</button>
					
			</fieldset>
		</form>

		<!-- copyright -->
		<div class="footer">
			<h2>
				&copy; 2018 CHECK YOU Login Form. All rights reserved | Design by <a
					href="http://www.bit.com">FISH</a>
			</h2>
		</div>

	</div>
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
		
	</script>

	<script type="text/javascript">
<!--function findID(id) {

		var findID = document.getElementById("id").value;

		if (findID == "") {
			window.alert(" WRONG, RETRY : write down correct email");
			return false;
		} else if(){
			
		}
		return true;
	}-->
	
</script>
</body>


</html>