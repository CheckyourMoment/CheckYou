<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	href="${pageContext.request.contextPath}/resources/css/grouphome.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<title>Group Home</title>
<!--jQuery UI, jQuery, File Download Plugin을 포함시키는 부분 -->
<%--  <link rel="stylesheet" href="<c:url value='/js/jquery-ui-1.12.0/jquery-ui.min.css'/>"/>  --%>
<script  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"></script>
<%-- <script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script> --%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	
<%-- <script src="<c:url value="/js/jquery-ui-1.12.0/jquery-ui.min.js"/>"></script> --%>
<script  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="  crossorigin="anonymous"></script> 

 
<script type="text/javascript">	
/*  function selectGroup(i){
		var groupName = document.getElementById("groupName"+i).value;
		window.alert(groupName);
		
		location.href = "selectGroup?groupName="+groupName;
		
	} */

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
				<div class="col-lg-10 mx-auto" style="margin-top: 180px">
				
 
<div>
	<!-- <h3>you can make group and invite member.</h3> --><h3> Manage your Group</h3>
</div>
<br>
<!-- 	<p>
		<a href="MakeGroupPage">add Group</a>
	</p>
	
	<p>
		<a href="requestPage">requests</a>
	</p> -->


<%-- 	<form>
		<table>
			<tr>
				<% int i = 1; %>
				<c:forEach items="${grouplist_owner}" var="dto">
					<td><button onclick="selectGroup(<%=i%>)" value="${dto.groupName}" id="groupName<%=i%>">
							Group Name : ${dto.groupName} </br> Owner : ${dto.constructor}
						</button>
					</td>
				<% i++; %>
				</c:forEach>
			</tr>
		</table>
	</form> --%>
	   <div>
	    <a href="javascript:popupOpen();" class="button" role="button">
    <img src="https://img.icons8.com/dusk/64/000000/add-user-group-man-man.png">
    
    <div class="f">Add Group</div></a>
	 <a href="javascript:popupOpen1();" class="button" role="button">
    <img src="https://img.icons8.com/dusk/64/000000/ok-hand.png">
    <div class="f">Requests</div></a>
     
     </div>
     		<div class="sample">
				<c:forEach items="${grouplist_owner}" var="dto">
					<div class="col-4">
					<div class="box">
					 
						<a href = "selectGroup?groupName=${dto.groupName}&constructor=${dto.constructor}">

							<div class="title">Group Name :</div> 
							<div class="stitle"> ${dto.groupName}</div></br>
							<div class="title"> Owner :</div> 
							<div class="stitle1"> ${dto.constructor}</div>
						</a>
					 </div></div>
					 
				</c:forEach>
				
				
				<c:forEach items="${grouplist_member}" var="dto">
					<c:set var="constructor" value="${dto.constructor}" />
					<c:set var="member" value="${dto.groupmember}" />
					<c:set var="acception" value="${dto.acception}" />
					<c:if test="${constructor ne member}">
					<c:if test="${acception eq '1'}">
							
						 
						<div class="col-4">
						<div class="box">
							<a href = "selectGroup?groupName=${dto.groupname}&constructor=${dto.constructor}">
									<div class="title"> 
								<div class="title">	Group Name : </div> 
								<div class="stitle"> ${dto.groupname} </div></br> 
								<div class="title"> Owner :</div> 
								<div class="stitle">  ${dto.constructor} </div>
							</a>
							</div></div>
					 
						</br> </div>
					</c:if>
					</c:if>
				</c:forEach></div></div></div>
					<script type="text/javascript">
function popupOpen(){

	var popUrl = "MakeGroupPage";	//팝업창에 출력될 페이지 URL

	var popOption = "width=500, height=450, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		window.opener.location.reload();  
		  if(false == web_window.closed)
		  {
			  popOption.close ();
		  }
	}
	
function popupOpen1(){

	var popUrl = "requestPage";	//팝업창에 출력될 페이지 URL

	var popOption = "width=570, height=500, resizable=no, scrollbars=no, status=no, location=no;";    //팝업창 옵션(optoin)

		window.open(popUrl,"",popOption);
		window.opener.location.reload();  
		  if(false == web_window.closed)
		  {
			  popOption.close ();
		  }
	}

	</script>
	</body>
</html>