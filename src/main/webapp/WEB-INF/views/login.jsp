<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">

<title>LOGIN</title>
	<!-- Meta tag Keywords -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta charset="UTF-8" />

	<!-- css files -->
	<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/style.css"  media="all">
	<!-- Style-CSS -->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<!-- Font-Awesome-Icons-CSS -->
	<!-- //css files -->

	<!-- web-fonts -->
	<link href="//fonts.googleapis.com/css?family=Tangerine:400,700" rel="stylesheet">
	<link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
	<!-- //web-fonts -->
</head>

<script src='//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script><script src="//m.servedby-buysellads.com/monetization.js" type="text/javascript"></script>

<body>
   <%
      // 세션 종료
      session.invalidate();
   %>
	<!-- title -->


	<!-- content -->
 <div class="sub-main-w3">
     
         <fieldset>
               <form  action="login" method="post" id="target" >
           	<h1>
		<span>L</span>ogin
	</h1>
        
            <div class="input">
  		 
               <input type="text" name="id" placeholder="Username" required />
               <span>
               <i class="fas fa-id-card-alt"></i>
               </span>
            </div>
            <div class="input">
               <input type="password" placeholder="Password" name="password" required />
               <span>
                  <i class="fas fa-lock-open"></i>
               </span>
            </div>
        <div>
           <a href="joinForm"><p class="joinff">create an account</p></a>
           </div> <button type="submit" value="sign in" class="submit" >
               <i class="fas fa-sign-in-alt"></i>
            </button>
         </fieldset>
	<div class="feedback" id="feedback">
				You have logged in
				<br /> successfully. 
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
	<!-- //copyright -->
<!---728x90--->


	<!-- Jquery -->
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- //Jquery -->
	<!-- script -->
	<script>
		$(".input").focusin(function () {
			$(this).find("span").animate({
				"opacity": "0"
			}, 200);
		});

		$(".input").focusout(function () {
			$(this).find("span").animate({
				"opacity": "1"
			}, 200);
		});
		
	var test = $("#target");
		 $('#target').submit(function (event) {
			$(this).find(".submit i").removeAttr('class').addClass("fa fa-check").css({
				"color": "#fff"
			}, 60000);
			$(".submit").css({
				"background": "#2ecc71",
				"border-color": "#2ecc71"
			});
			 $(".feedback").show().animate({
				"opacity": "1",
				"bottom": "-80px"
			}, 40000); 
			$("input").css({
				"border-color": "#2ecc71"
			}, 6000);
			
			return login;
		}); 
	</script>
	<!-- //script -->

</body>

</html>