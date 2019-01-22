<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
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

<%String searchedDate = (String)session.getAttribute("Date_TimeSheet"); %>

<%
	if(searchedDate==null){%>
		<input type="hidden" value="NOT" id="searchedDate">
	<%}
else{%>
<input type="hidden" value="<%=searchedDate%>" id="searchedDate">
<% }%>

<a href="dailyManagement">Back</a>
<h2>- Search another time sheet</h2>


<form action ="searchTimeSheet">
input date : <input type="text" name="Date_TimeSheet"> Input Format(0000-00-00)
<input type="submit" value="search">
</form>

<form>
	<table width="800" cellpadding="0" cellspacing="0" border="1">
		<tr align="center">
			<td>Time</td>
			<td>kind</td>
			<td>work</td>
			<td>Work detail</td>
			<td>evaluation</td>
			<td style="border:0">evaluate you task!</td>
		</tr>
		
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
      			<p style="color:white">good</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'bad'}">
   		 	 <td style="background-color:red">
      			<p style="color:white">bad</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:when test="${dto.evaluation eq 'soso'}">
   		 	 <td style="background-color:gray">
      			<p style="color:white">soso</p>
      	    </td>
   		 </c:when>
   		 
   		 <c:otherwise>
   			 <td>
      			<p> Not evaluated yet</p>
      		</td>
  		  </c:otherwise>

		</c:choose>
		
		
			<td style="border:0">
				<a href="evaluate?evaluation=good&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">good</a>
				<a href="evaluate?evaluation=bad&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">bad</a>
				<a href="evaluate?evaluation=soso&starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">soso</a>
			</td>
			
			<td>
				<a href="deleteTimeSheet?starttime=${dto.starttime}&endtime=${dto.endtime}&worktype=${dto.worktype}&workname=${dto.workname}&workdetail=${dto.workdetail}&this=another">delete</a>
			</td>
			
		</tr>
		
		</c:forEach>
		
	</table>
</form>



<!--엑셀 다운로드 버튼과 필요한 다이얼로그를 생성할 요소들 입니다.-->
<button id="btn-excel">엑셀 다운로드</button>

<!-- 파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그 입니다. -->
<div title="Data Download" id="preparing-file-modal" class="ui-progressbar" style="display: none;">
	<div id="progressbar" style="width: 100%; height: 22px; margin-top: 20px;"></div> 
</div> 

<!-- 에러발생시 보여질 메세지 다이얼로그 입니다. --> 
<div title="Error" id="error-modal" style="display: none;"> 
	<p>생성실패.</p> 
</div>



</body>
</html>