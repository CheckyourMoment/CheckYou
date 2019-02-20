<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

<body onload="wholeMemo()">
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
	
	
	
  <div id="wrapper" class="toggled">
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li> <a href="groupHome"> 
     <img src="https://img.icons8.com/dusk/64/000000/dog-house.png"><!--<span class="iconname" >GroupHome</span>-->
   </a> </li>
                    <li> <a href="comment">
 <img src="https://img.icons8.com/dusk/64/000000/combo-chart.png"><!--<span class="iconname" >Comment</span>-->
 </a>
</li>
                    <li>    <a href="#" onclick="saveMemo('addMemberPage')"><img src="https://img.icons8.com/dusk/64/000000/find-user-female.png">
                   <!-- <span class="iconname" >Search Friend</span> --></a>
   </li>
                    <li>    <a href="#" onclick="saveMemo('MemberList')"><img src="https://img.icons8.com/dusk/64/000000/conference.png">
                  <!--  <span class="iconname" >Member List </span>--></a>
 </li>
 <li>
 <c:set var="constructor" value="<%=constructor %>"/>
	<c:set var="loginUser" value="<%=loginUser %>" />
					
	<c:if test="${constructor eq loginUser}">
		<a onclick="deleteGroup('<%=selectedGroup %>')"><img src="https://img.icons8.com/dusk/64/000000/delete.png"></a>
	</c:if>	
 </li>
 </ul>
            </div>	</div>
 <!--memo  -->
  <div id="page-content-wrapper">
                <div class="container-fluid">	
<%String memocount = (String)session.getAttribute("memoCount"); %>
<input type="hidden" value="<%=memocount%>"  id="memocount"></input>
 
 		
 <div>
 <div class="container text-center">
			<div class="row">
				<div class="col-lg-8 mx-auto" style="margin-top: 80px">
				
<h3>
<div class="groupname"> Group Name :  <div class="groupname1"><%=selectedGroup %></div> </div> </h3>
<button id="button1" class="new-btn" onclick="newMemeo();" >new memo </button>
 </div>


 <div class="sample">
<div class="memoset">
<span id="memoDelete_1" ></span>
<span id="yellowMemo1"></span>
<span id="redMemo1"></span>
<span id="greenMemo1"></span>
<div id="Memo_1"></div>
</div>
<div class="memoset">
<span id="memoDelete_2"></span>
<span id="yellowMemo2"></span>
<span id="redMemo2"></span>
<span id="greenMemo2"></span>
<div id="Memo_2"></div>
</div>

<div class="memoset">
<span id="memoDelete_3"></span>
<span id="yellowMemo3"></span>
<span id="redMemo3"></span>
<span id="greenMemo3"></span>
<div id="Memo_3"></div>
</div>

<div class="memoset">
<span id="memoDelete_4"></span>
<span id="yellowMemo4"></span>
<span id="redMemo4"></span>
<span id="greenMemo4"></span>
<div id="Memo_4"></div>
</div>
<div class="memoset">
<span id="memoDelete_5"></span>
<span id="yellowMemo5"></span>
<span id="redMemo5"></span>
<span id="greenMemo5"></span>
<div id="Memo_5"></div></div>
<div class="memoset">
<span id="memoDelete_6"></span>
<span id="yellowMemo6"></span>
<span id="redMemo6"></span>
<span id="greenMemo6"></span>
<div id="Memo_6"></div></div>
<div class="memoset">
<span id="memoDelete_7"></span>
<span id="yellowMemo7"></span>
<span id="redMemo7"></span>
<span id="greenMemo7"></span>
<div id="Memo_7"></div></div>
<div class="memoset">
<span id="memoDelete_8"></span>
<span id="yellowMemo8"></span>
<span id="redMemo8"></span>
<span id="greenMemo8"></span>
<div id="Memo_8"></div></div>

<div class="memoset">
<span id="memoDelete_9"></span>
<span id="yellowMemo9"></span>
<span id="redMemo9"></span>
<span id="greenMemo9"></span>
<div id="Memo_9"></div>
</div>
 </div>
</div>

</div>
<!-- <button onclick="saveMemo()">save</button> -->
</div></div></div>  

<!-- memoColors -->
<%
List memoColorList = (List)request.getAttribute("memoColorList");
Iterator iterator = memoColorList.iterator();
int k = 1;
while(iterator.hasNext()) {
	String memoColor = (String)iterator.next();
	
	if(memoColor==null){
		memoColor = "";
	}
	
	out.print("<input type='hidden' id='memoColor"+k+"' value='"+memoColor+"'></input>");
	k++;
}
%>

<!-- memoDatas -->
<%
List memoDataList = (List)request.getAttribute("memoDataList");
Iterator iter = memoDataList.iterator();
int i = 1;
while(iter.hasNext()) {
	String memoData = (String)iter.next();
	
	if(memoData==null){
		memoData = "";
	}
	
	out.print("<input type='hidden' id='memoData"+i+"' value='"+memoData+"'></input>");
	i++;
}
%>


</div>
            </div> <!-- /#page-content-wrapper -->
       

<!-- 사이드메뉴 -->
<%-- 
<div align="right">

	<a href="groupHome"> 
     <img src="https://img.icons8.com/dusk/64/000000/dog-house.png">
	</a> </br>
	<a href="comment">
	<img src="https://img.icons8.com/dusk/64/000000/speech-bubble-with-dots.png">
 </a>
	</br>
	<a href="#" onclick="saveMemo('addMemberPage')"><img src="https://img.icons8.com/dusk/64/000000/find-user-female.png"></a>
	</br>
	<a href="#" onclick="saveMemo('MemberList')"><img src="https://img.icons8.com/dusk/64/000000/conference.png"></a>
	</br>
	<a href="#" onclick="saveMemo('task_group')">Task Progress</a>
	
	
	
	
	
	<c:set var="constructor" value="<%=constructor %>"/>
	<c:set var="loginUser" value="<%=loginUser %>" />
					
	<c:if test="${constructor eq loginUser}">
		<a onclick="deleteGroup('<%=selectedGroup %>')"><img src="https://img.icons8.com/dusk/64/000000/delete.png"></a>
	</c:if>	
	
</div>

 --%>










<script type="text/javascript">
	function deleteGroup(groupname){
   		 var check = confirm("Do you want delete this group?");
   		  if(check){
   			 location.href = "deleteGroup?groupname="+groupname;
   		 }
	}
</script>

<script type="text/javascript">
	function newMemeo(){
		var memocount = document.getElementById("memocount");
		var i = Number(memocount.value)+1;
		if(i==10){
			window.alert("생성할 수 있는 메모의 개수를 초과하셨습니다.(9/9)");
			return true;
		}
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "increaseMemoCount?increasedMemoCount="+i+"&"+str+"&"+colorStr;
	}
</script>

<script type="text/javascript">
	function wholeMemo(){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("Memo_"+i);
			var memoData = document.getElementById("memoData"+i);
			var memoColor = document.getElementById("memoColor"+i);
			 
			//메모 색 변경 버튼
			var YellowMemo = document.getElementById("yellowMemo"+i);
			YellowMemo.innerHTML = '<button onclick="changeYellow('+i+')"style="border:1px solid #FAEF25;width:20px;height:20px;background-color:#FAEF25;"></button>';
			
			var RedMemo = document.getElementById("redMemo"+i);
			RedMemo.innerHTML = '<button onclick="changeRed('+i+')"style="border:1px solid #FA0025;width:20px;height:20px;background-color:#FA0025;"></button>';
			
			var GreenMemo = document.getElementById("greenMemo"+i);
			GreenMemo.innerHTML = '<button onclick="changeGreen('+i+')"style="border:1px solid #4DC786;width:20px;height:20px;background-color:#4DC786;"></button>';
			
			// 메모삭제 버튼
			var MemoDelete = document.getElementById("memoDelete_"+i);
			MemoDelete.innerHTML = '<button onclick="deleteMemo('+i+')"style="border:0px solid #444444; width:20px;height:20px;background-color:#fffafa;margin-left:10dfsdfpx;" id="MemoDelete_'+i+'"'+'>X</button>';
					
			// 메모
			Memo.innerHTML = '<textarea id="memo_'+i+'"'+'style="width:270px;height:230px;font-size:20px;margin:10px;"></textarea>';
			var memos = document.getElementById("memo_"+i);
			
			// 메모 데이터 설정
			memos.value = memoData.value;
			// 메모 색상 설정
		    memos.style.backgroundColor = memoColor.value;
		
			
			
		}
	}
</script>	

<script type="text/javascript">
	function changeYellow(changeNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "changeMemoColor?color=fff883"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
	}
	 
	function changeRed(changeNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "changeMemoColor?color=ff91a0"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
	}
	
	function changeGreen(changeNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "changeMemoColor?color=d1fca2"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
	}
	
</script>

<script type="text/javascript">
	function deleteMemo(deleteNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "deleteOneMemo?deleteNum="+deleteNum+"&"+str+"&"+colorStr;
	}
</script>

<script type="text/javascript">
	function saveMemo(moveTo){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str = "saveMemo?";
		var colorStr = getColorStr();
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("memo_"+i);
			
			if(i==1){
				str = str+"memo"+i+"="+Memo.value;
			}
			if(1<i<j){
				str = str+"&memo"+i+"="+Memo.value;
			}
		}
		location.href = str+"&count="+j+"&moveTo="+moveTo+"&"+colorStr;
	}
</script>

<script type="text/javascript">
	
 	function getStr(){ // href를 중복으로 사용하는 것은 불가능하기 때문에 str을 구해 get방식으로 넘겨주기 위한 함수
 		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str;
		
		// 데이터
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("memo_"+i);
			if(i==1){
				str = "memo"+i+"="+Memo.value;
			}
			else if(1<i<j){
				str = str+"&memo"+i+"="+Memo.value;
			}
		}
		str = str+"&count="+j;
		return str;
	} 
</script>

<script type="text/javascript">
	function getColorStr(){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str;
		 // 색
		for(i = 1 ; i<=j ; i++){
			var memoColor = document.getElementById("memoColor"+i);
			var memoColorValue = memoColor.value;
			
			if(memoColorValue == "#ff91a0"){//빨 노초 순1AB557  C94449  DED541
				memoColorValue = "ff91a0";
			}
			else if(memoColorValue == "#fff883"){
				memoColorValue = "fff883";
			}
			else if(memoColorValue == "#d1fca2"){
				memoColorValue = "d1fca2";
			}
			
			
			if(i==1){
				str = "memoColor"+i+"="+memoColorValue;
			}
			else if(1<i<j){
				str = str+"&memoColor"+i+"="+memoColorValue;
			}
		} 
		 return str;
		 
	}
</script>

</body>
</html>
 