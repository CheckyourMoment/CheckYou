<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="https://fonts.googleapis.com/css?family=PT+Sans" rel="stylesheet">
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
<meta charset="utf-8">

<title>today's time sheet</title>
</head>
<body>

	<!-- 메뉴 바 시작  -->
	<header class="header_area">
		<div class="top_menu">
			<div class="container"></div>
		</div>
		<div class="main_menu" id="mainNav">
			<nav class="navbar navbar-expand-lg navbar-light">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="index.html">
					<img src="img/i" alt=""></a>
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
								href="dailyManagement"> Home <img src="https://img.icons8.com/color/45/000000/dog-house.png"></a></li>

							<!--personal menubar!-->
							<li class="nav-item submenu dropdown"><a
								href="dailyManagement" class="nav-link dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false">Personal<img src="https://img.icons8.com/color/48/000000/mental-state.png"></a>
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
								role="button" aria-haspopup="true" aria-expanded="false">My Page<img src="https://img.icons8.com/color/48/000000/light.png">
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


	<div class="container text-center">
		<div class="row">
			<div class="col-lg-11 mx-auto" style="margin-top: 200px">
				<div>
					<h3>Today's time sheet</h3>
				</div>
				<div class="todo">
					<p class="lead mb-5"></p>
					

					<form>
						<table>
							<thead>
								<tr>
									<th>Time</th>
									<th>kind</th>
									<th>work</th>
									<th>Work detail</th>
									<th>evaluation</tthd>
									<th style="width:250px;">evaluate you task!</th>
								</tr></thead>
								  <tbody>
								<c:forEach items="${timeSheet_today}" var="dto">
									<tr align="center">
										<td>${dto.starttime}</br>|</br> <c:choose>
												<c:when test="${dto.endtime eq '-1'}"> now processing  </c:when>

												<c:otherwise>${dto.endtime}  </c:otherwise>

											</c:choose>
										</td>
										<td>${dto.worktype}</td>
										<td>${dto.workname}</td>
										<td>${dto.workdetail}</td>

										<c:choose>
											<c:when test="${dto.evaluation eq 'good'}">
												<td style="background-color: blue">
										 	
											<img src="https://img.icons8.com/color/60/000000/lol.png">
												<p style="color: white">good</p>   
												</td>
											</c:when>

											<c:when test="${dto.evaluation eq 'bad'}">
												<td style="background-color: red">
													<img src="https://img.icons8.com/color/60/000000/sad.png">
													<p style="color: white">bad</p>   
												</td>
											</c:when>

											<c:when test="${dto.evaluation eq 'soso'}">
												<td style="background-color: gray">
													<img src="https://img.icons8.com/color/60/000000/boring.png">
													<p style="color: white; ">soso</p>   
												</td>
											</c:when>

											<c:otherwise>
												<td>
													<p>Not evaluated yet</p>
												</td>
											</c:otherwise>

										</c:choose>


										<td ><a
											href="evaluate?evaluation=good&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">
												<img src="https://img.icons8.com/color/40/000000/lol.png"></a>
											<a
											href="evaluate?evaluation=bad&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">
													<img src="https://img.icons8.com/color/40/000000/sad.png"></a>
											<a
											href="evaluate?evaluation=soso&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">
											<img src="https://img.icons8.com/color/40/000000/boring.png"></a>
										<br>	<div class="express">good bad soso</div>
										</td>

										<td style="background-color:white; border:0;"><a
											href="deleteTimeSheet?starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}"><img src="https://img.icons8.com/color/48/000000/delete-sign.png"></a>
										</td>

									</tr>

								</c:forEach>
								  <tbody>
						</table>
					</form>

				</div>


			</div>
		</div>
	</div>
	</section>





</body>

</html>