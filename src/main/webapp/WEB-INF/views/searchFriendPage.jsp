<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<!-- <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script> -->
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Open+Sans:300"
	type="text/css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.6.3/css/all.css"
	integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Karla"
	rel="stylesheet">
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/mainstyle.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

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
							<li class="nav-item active"><a class="nav-link"
								href="dailyManagement">Home<img src="img/05.png" /></a></li>
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
									<li class="nav-item"><a class="nav-link"
										href="single-blog.html">Mento</a></li>
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

<a href="dailyManagement">Back</a>

<h2>- Search you friend and add on this page! - </h2>
	
	<form action ="searchFriend">
	input your friend's id : <input type="text" name="searchFriend"/></br>
	<input type="submit" value="search"/>
	</form>
	</br>
<%
	String id = (String)request.getAttribute("searchedFriend");
%>
	<%if(id!=null){%>
		
	<form action="addFriend">
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		
		<tr>
			<td><h3>- result -</h2></td>
		</tr>
		<tr>
			<td><%= id %>
			<input type="hidden" value="<%=id%>" name="friend"/>
			<input type="submit" value="add"/>
			</td>
		</tr>
	
		
	</table>
	</form>
	<%} else{%>
			this id is not

	<%} %>
	
	
	

</body>
</html>