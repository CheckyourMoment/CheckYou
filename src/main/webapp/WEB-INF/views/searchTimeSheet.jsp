<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">
 <title>Searchtimesheet</title>
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


  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

 
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/search.css"
	media="all">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	
	
<title>search timeSheet</title>

<!--jQuery UI, jQuery, File Download Plugin을 포함시키는 부분 -->
<%--  <link rel="stylesheet" href="<c:url value='/js/jquery-ui-1.12.0/jquery-ui.min.css'/>"/>  --%>
<script  src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css"></script>
<%-- <script src="<c:url value="/js/jquery-3.1.0.min.js"/>"></script> --%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	
	
<%-- <script src="<c:url value="/js/jquery-ui-1.12.0/jquery-ui.min.js"/>"></script> --%>
<script  src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"  integrity="sha256-T0Vest3yCU7pafRw9r+settMBX6JkKN06dqBnpQ8d30="  crossorigin="anonymous"></script> 


<%-- 
<script src="<c:url value="/js/jquery.fileDownload.js"/>"></script> --%>
<script  src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fileDownload/1.4.2/jquery.fileDownload.js"></script>




<!-- "엑셀 다운로드" 버튼 클릭시 진행막대 다이얼로그를 띄우고 다운로드 요청 후 응답에 따라 성공시 다운로드가 진행되고, 실패시 에러메세지 다이얼로그를 띄웁니다.-->
<script type="text/javascript">
//<![CDATA[ 
	$(function() { 
	$("#btn-excel").on("click", function () {

		var searchedDate = document.getElementById("searchedDate").value;
		if(searchedDate=="NOT"){
			window.alert("select a Date which you want download");
			return false
		}
		
		var $preparingFileModal = $("#preparing-file-modal");
		$preparingFileModal.dialog({ modal: true });
		$("#progressbar").progressbar({value: false});
		$.fileDownload("excelDownload?searchedDate="+searchedDate, { 
			successCallback: function (url) {
				$preparingFileModal.dialog('close');
				},
				failCallback: function (responseHtml, url) {
					$preparingFileModal.dialog('close');
					$("#error-modal").dialog({ modal: true });
					}
				}); // 버튼의 원래 클릭 이벤트를 중지 시키기 위해 필요합니다.
				return false;
				}); 
	});
//]]> 
</script>



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


<%String searchedDate = (String)session.getAttribute("Date_TimeSheet"); %>

<%
	if(searchedDate==null){%>
	<input type="hidden" value="NOT" id="searchedDate">
		
<%  }
else{%>
<input type="hidden" value="<%=searchedDate%>" id="searchedDate">
<% }%>

		<div class="container text-center">
			<div class="row">
				<div class="col-lg-10 mx-auto" style="margin-top: 200px">
	<div>				
 
 
<div>
<h3> Search another time sheet</h3></div>
</div>
<!-- 
<form action ="searchTimeSheet" id="content">
input date <input type="text" name="Date_TimeSheet" class="input"> 
  <button type="reset" class="search"></button>
Input Format(0000-00-00)
<input type="submit" value="search">
 -->
<!--수정수정  -->
<form action ="searchTimeSheet" id="content">
<div class="sub-main-w3">

	<div class="input">
						<input autocomplete="off" type="text" id="datepicker" placeholder="Input Format(yyyy-mm-dd)" 
							class="input" name="Date_TimeSheet" 
							/> 
							<span>
							<i class="fa fa-search"></i>
							</span>

					</div>
	<input type="submit" class="btn btn-success" value="search">			
 </div>

 </form>
<button type="button"  id="btn-excel" class="btn btn-danger">Exel Download</button>
 
</form>
<!--엑셀 다운로드 버튼과 필요한 다이얼로그를 생성할 요소들 입니다.-->

<form>
	<table align="center" width="1000" cellpadding="0" cellspacing="0" border="1">
	 <thead>
		<tr align="center">
			<th>Time</th>
			<th>kind</th>
			<th>work</th>
			<th>Work detail</th>
			<th>evaluation</th>
			<th>evaluate you task!</th>
		</tr>
		</thead>
		<tbody>
		<c:forEach items="${timeSheet_anotherDay}" var="dto">
	
		<tr align="center">
			<td>${dto.starttime}
				</br>|</br>
				
				
		<c:choose>	
		<c:when test="${dto.endtime eq '-1'}">
   		  		now processing
   		 </c:when>
   		 
   		  <c:otherwise>
				${dto.endtime}
		  </c:otherwise>
   		 
		</c:choose>	
		
		
			</td>
			<td>${dto.worktype}</td>
			<td>${dto.workname}</td>
			<td>${dto.workdetail}</td>
		
			
		<c:choose>
   		 <c:when test="${dto.evaluation eq 'good'}">
   		 
   		  	<td style="background-color:blue">
   		  		<img src="https://img.icons8.com/color/60/000000/lol.png">
      			<p style="color:white">good</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'bad'}">
   		 	 <td style="background-color:red">
      	<img src="https://img.icons8.com/color/60/000000/sad.png">
      			<p style="color:white">bad</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'soso'}">
   		 	 <td style="background-color:gray">
    	<img src="https://img.icons8.com/color/60/000000/boring.png">
      			<p style="color:white">soso</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:otherwise>
   			 <td>
      			<p> Not evaluated yet</p>
      		</td>
  		  </c:otherwise>

		</c:choose>
		
		
			<td>
				<a href="evaluate?evaluation=good&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">
				<img src="https://img.icons8.com/color/40/000000/lol.png"> </a>
				<a href="evaluate?evaluation=bad&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">
				<img src="https://img.icons8.com/color/40/000000/sad.png"></a>
				<a href="evaluate?evaluation=soso&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">
				<img src="https://img.icons8.com/color/40/000000/boring.png"></a>
		<br><div class="express">good bad soso</div>
			</td>
			
			<td style="background-color: white; border:0;">
				<a href="deleteTimeSheet?starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">
<img src="https://img.icons8.com/color/48/000000/delete-sign.png"></a>
			</td>
			
		</tr>
		
		</c:forEach>
		<c:if test="${empty timeSheet_anotherDay}">
						<tr>
							<td colspan="6" class="txt_center" style="margin:10px;">
							 리스트가 없습니다.  </td>
						</tr>
					</c:if>
		</tbody>
	</table>
</form>

<!-- 파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그 입니다. -->
<div title="Data Download" id="preparing-file-modal" class="ui-progressbar" style="display: none;">
	<div id="progressbar" style="width: 100%; height: 22px; margin-top: 20px;"></div> 
</div> 

<!-- 에러발생시 보여질 메세지 다이얼로그 입니다. --> 
<div title="Error" id="error-modal" style="display: none;"> 
	<p>생성실패.</p> 
</div>


</div></div></section>
 

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
		});
function expand() {
  $(".search").toggleClass("close");
  $(".input").toggleClass("square");
  if ($('.search').hasClass('close')) {
    $('input').focus();
  } else {
    $('input').blur();
  }
}
$('button').on('click', expand);
</script>
<!-- ajax  -->
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
  
