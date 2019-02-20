<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<title>Home</title>
 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/selectedGroup.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
</head>
<body>
<script>
function pclose1(){
    opener.location.reload();
    window.close();
}</script>

<!-- menu -->
<body>
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



	
	
 <%String selectedGroup = (String)session.getAttribute("selectedGroup"); %>
<%String constructor = (String)session.getAttribute("constructor"); %>
<%String loginUser = (String)session.getAttribute("userId"); %>
	
 











<div id="page-content-wrapper">
<div class="container-fluid">	
<div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto" style="margin-top: 80px">
 
<h3> Search Member and invite! </h3>
		<br>
 
 <href action="selectGroup" value ="back"></href>
	<form action ="searchMember">
	<div class="input">
	<img src="https://img.icons8.com/color/96/000000/search.png">
  <input type="text" class="input" placeholder="input Member's id" name="searchMember"/>
	</div>
  
	</br>
	  <button type="submit" name="submit" class="btn btn-outline-primary btn" >Search</button>
	   <a class="btn btn-outline-danger" href="selectGroup" role="button"  onClick="pclose1();" >Close</a>
	</form>
 
<%
	String id = (String)request.getAttribute("searchedMember");
%>
	<%if(id!=null && id!="notExist"){%>
		
	<form action="addMember">
	<table width="500" cellpadding="0" cellspacing="0" border="0">
		<tr>
			<td><div class="result" >result <img src="https://img.icons8.com/ios-glyphs/30/000000/human-esearch-rogram.png"> </div>   	</tr>
		<tr>
			<td style="margin-top:2rem;"> <div class="id"><%= id %></div>
			<input type="hidden" value="<%=id%>" name="groupmember" id="groupmember"/>
		 <button type="submit" class="btn btn-dark">add</button>
			</td>
		</tr>
	
		
	</table>
	
	</form>

	</div>
   
 	</div></div>
	</div></div>
	
	<%} else if(id=="notExist"){
			//this id is not
			out.print("<input type='hidden' id='NotExist' value='NotExist'></input>");
	} %>
	
	
	<%String invite = (String)request.getAttribute("invite"); %>
	<!-- member invite Check -->
	<%if(invite=="success"){
		out.print("<input type='hidden' id='invite' value='success'></input>");
	} 
	else if(invite=="fail"){
		out.print("<input type='hidden' id='invite' value='fail'></input>");
	}
	
	%>	
<script type="text/javascript">
	window.onload = function(){
		var NotExist = document.getElementById("NotExist");
		if(NotExist != null){
		var gNotExistValue = NotExist.value;
			window.alert("Not Exist");
	   }
		
		// MemberInviteCheck Alert logic
		var invite = document.getElementById("invite");
		if(invite != null){
			var inviteValue = invite.value;
			if(inviteValue=="success"){
				window.alert("invite success");
			}
			else{
				window.alert("already invite or member");
			}
		}
		
		
		
	}
</script>

<script type="text/javascript">
	function deleteGroup(groupname){
   		 var check = confirm("Do you want delete this group?");
   		  if(check){
   			 location.href = "deleteGroup?groupname="+groupname;
   		 }
	}
</script>

</body>
</html>