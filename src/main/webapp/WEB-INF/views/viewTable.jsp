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
<!-- 
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous"> -->
<title>Home</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css"
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
					<a class="navbar-brand logo_h" href="index.html"><img
						src="img/i" alt=""><img src="img/02.jpg" alt=""></a>

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


							<li class="nav-item active">
								<!--Home menubar!--> <a class="nav-link" href="dailyManagement">Home<img
									src="img/05.png" /></a>
							</li>


							<!--personal menubar!-->
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Personal
									<img class="small" src="img/113.png" />
							</a>

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
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Group
									<img class="small" src="img/08.png" />
							</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link"
										href="searchTimeSheet">Team</a></li>
									<li class="nav-item"><a class="nav-link" href="#">Mento</a></li>
								</ul></li>


							<li class="nav-item submenu dropdown"><a href="friendList"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">Friend
									<img class="small" src="img/112.png" />
							</a>
								<ul class="dropdown-menu">

									<li class="nav-item"><a class="nav-link"
										href="searchFriendPage">Add Friend</a></li>
									<li class="nav-item"><a class="nav-link" href="friendList">Friend
											List</a></li>
								</ul></li>
							<li class="nav-item submenu dropdown"><a href="#"
								class="nav-link dropdown-toggle" data-toggle="dropdown"
								role="button" aria-haspopup="true" aria-expanded="false">My
									Page <img class="small" src="img/10.png" />
							</a>
								<ul class="dropdown-menu">

									<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
								</ul></li>
						</ul>
					</div>
				</div>
			</nav>
		</div>
	</header>

	<!-- 메뉴 바 끝 -->


	<div class="container text-center">
		<div class="row">
			<div class="col-lg-10 mx-auto" style="margin-top: 200px">
				<div>
					<h2>Today's time sheet</h2>
				</div>
				<div class="todo">
					<p class="lead mb-5">하루 일과 표</p>
					<img src="img/watch.gif" />

					<form>
						<table class="table table-hover">
							<thead>
								<tr>
									<td>Time</td>
									<td>kind</td>
									<td>work</td>
									<td>Work detail</td>
									<td>evaluation</td>
									<td style="border: 0">evaluate you task!</td>
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
													<p style="color: white">good</p>
												</td>
											</c:when>

											<c:when test="${dto.evaluation eq 'bad'}">
												<td style="background-color: red">
													<p style="color: white">bad</p>
												</td>
											</c:when>

											<c:when test="${dto.evaluation eq 'soso'}">
												<td style="background-color: gray">
													<p style="color: white">soso</p>
												</td>
											</c:when>

											<c:otherwise>
												<td>
													<p>Not evaluated yet</p>
												</td>
											</c:otherwise>

										</c:choose>


										<td style="border: 0"><a
											href="evaluate?evaluation=good&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">good</a>
											<a
											href="evaluate?evaluation=bad&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">bad</a>
											<a
											href="evaluate?evaluation=soso&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">soso</a>
										</td>

										<td><a
											href="deleteTimeSheet?starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}">delete</a>
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