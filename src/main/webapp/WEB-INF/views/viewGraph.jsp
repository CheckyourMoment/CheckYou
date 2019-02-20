<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script src="//m.servedby-buysellads.com/monetization.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<!-- 
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous"> -->
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/search.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


<script type="text/javascript">
window.onload = function() {
 
var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Time graph (${date})"
	},
	data: [{
		type: "pie",
		showInLegend: "true",
		legendText: "{label}",
		yValueFormatString: "#,###\"분\"",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}",
		dataPoints: dps[0]
	}]
});
 
var yValue;
var label;
 
<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
	<c:forEach items="${dataPoints}" var="dataPoint">
		yValue = parseFloat("${dataPoint.y}");
		label = "${dataPoint.label}";
		dps[parseInt("${loop.index}")].push({
			label : label,
			y : yValue,
		});		
	</c:forEach>	
</c:forEach> 
 
chart.render();
}
</script>
</head>
<body>
	<header class="header_area">
	<div class="top_menu">
		<div class="container"></div>
	</div>
	<div class="main_menu" id="mainNav">
		<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<a class="navbar-brand logo_h" href="index.html"> <img
				src="img/i" alt=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse offset"
				id="navbarSupportedContent">

				<ul class="nav navbar-nav menu_nav ml-auto">

					<li class="nav-item active"><a class="nav-link"
						href="dailyManagement"> Home <img
							src="https://img.icons8.com/color/45/000000/dog-house.png"></a></li>

					<!--personal menubar!-->
					<li class="nav-item submenu dropdown"><a
						href="dailyManagement" class="nav-link dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">Personal<img
							src="https://img.icons8.com/color/48/000000/mental-state.png"></a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link"
								href="dailyManagement">Daily Management </a></li>
							<li class="nav-item"><a class="nav-link" href="viewTable">daily
									time sheet</a></li>

							<li class="nav-item"><a class="nav-link"
								href="canvasjschart">View Graph</a></li>

							<li class="nav-item"><a class="nav-link"
								href="searchTimeSheetPage">searchTimeSheet</a></li>
						</ul></li>

					<!--Group menubar!-->
					<li class="nav-item submenu dropdown"><a href="groupHome"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">Group
							<img src="https://img.icons8.com/color/48/000000/groups.png">
					</a>
						<ul class="dropdown-menu">
							<li class="nav-item"><a class="nav-link" href="groupHome">Invite</a></li>

						</ul></li>


					<!-- mypage -->
					<li class="nav-item submenu dropdown"><a href="logout"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						role="button" aria-haspopup="true" aria-expanded="false">My
							Page<img src="https://img.icons8.com/color/48/000000/light.png">
					</a>

						<ul class="dropdown-menu">

							<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
							<li class="nav-item"><a class="nav-link" href="MyPage">MyPage</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
		</nav>
	</div>
	</header>
	<!-- 메뉴바 끝  -->

	<div class="container text-center">
		<div class="row">
			<div class="col-lg-10 mx-auto" style="margin-top: 200px">

				<!-- <a href="dailyManagement">Back</a> -->

			 
				<div>
					<div>
						<h3>search another day's graph</h3>
					</div>
				</div>

				<form action="canvasjschart">
					<div class="sub-main-w3">
						<div class="input">
							<input autocomplete="off" type="text" name="Date_graph" id="datepicker"  placeholder="Input Format(yyyy-mm-dd)" />
							<span> <i class="fa fa-search"></i>
							</span></div>
							 <input type="button" class="btn btn-success"  value="search" id="btnSubmit"/>
 			
<!-- <input type="button" value="ValidateDate" id="btnSubmit"/>  -->
						
					</div>

				</form>

			</div>
		</div>



		<div id="chartContainer" style="height: 370px; width: 100%;"></div>

		<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
		<!-- 자바 스크립트 차트 라이브러리  -->
		</section>
</body>
</html>
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
});</script>


<script>

$( function() {
    $( "#datepicker" ).datepicker({
       dateFormat: 'yy-mm-dd' ,
      showOtherMonths: true,
      selectOtherMonths: true,
      monthNames: [ '01', '02', '03', '04', '05', '06', '07', '08', '09', '10', '11', '12' ],

    });
  } ); 
  
</script> 
 