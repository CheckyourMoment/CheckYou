<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		
		if(i==11){
			window.alert("생성할 수 있는 메모의 개수를 초과하셨습니다.(10/10)");
			return true;
		}
		
		location.href = "increaseMemoCount?increasedMemoCount="+i;
		
	}
</script>

<script type="text/javascript">
	function wholeMemo(){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("Memo_"+i);
			Memo.innerHTML = '<textarea id="memo_'+i+'"'+'></textarea>';
		}
		
	}
</script>	

<script type="text/javascript">
	function saveMemo(){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str = "saveMemo?";
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("memo_"+i);
			
			/* // test
			window.alert(Memo.value); */
			
			if(i==1){
				str = str+"memo"+i+"="+Memo.value;
			}
			if(1<i<j){
				str = str+"&memo"+i+"="+Memo.value;
			}
		}
		
		//window.alert(str);
		location.href = str+"&count="+j;
		
		
	}
</script>



</head>
<body onload="wholeMemo()">

<%String memocount = (String)session.getAttribute("memoCount"); %>
<input type="hidden" value="<%=memocount%>" id="memocount"></input>

<a href="groupHome">Back</a>  

<%String selectedGroup = (String)session.getAttribute("selectedGroup"); %>
<%String constructor = (String)session.getAttribute("constructor"); %>
<%String loginUser = (String)session.getAttribute("userId"); %>

Group Name : <%=selectedGroup %>
</br></br>

<button onclick="newMemeo()">new memo</button>
</br></br>


<div id="Memo_1" value="1"></div>
<div id="Memo_2" value="2"></div>
<div id="Memo_3" value="3"></div>
<div id="Memo_4"></div>
<div id="Memo_5"></div>
<div id="Memo_6"></div>
<div id="Memo_7"></div>
<div id="Memo_8"></div>
<div id="Memo_9"></div>
<div id="Memo_10"></div>

<button onclick="saveMemo()">save</button>













<div align="right">
	</br>
	<a href="addComment">comment</a>
	</br>
	<a href="addMemberPage">AddMember</a>
	</br>
	<a href="MemberList">MemberList</a>
	</br>
	
	<c:set var="constructor" value="<%=constructor %>"/>
	<c:set var="loginUser" value="<%=loginUser %>" />
					
	<c:if test="${constructor eq loginUser}">
		<a onclick="deleteGroup('<%=selectedGroup %>')">Delete Group</a>
	</c:if>	
	
	
</div>

</body>
</html>