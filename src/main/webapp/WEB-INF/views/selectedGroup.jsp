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
		
		location.href = "increaseMemoCount?increasedMemoCount="+i+"&"+str;
		
	}
</script>

<script type="text/javascript">
	function wholeMemo(){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("Memo_"+i);
			var memoData = document.getElementById("memoData"+i);
			
			
			// test
			var MemoDelete = document.getElementById("memoDelete_"+i);
			MemoDelete.innerHTML = '<button onclick="deleteMemo('+i+')" id="MemoDelete_'+i+'"'+'>x</button>';
						
			Memo.innerHTML = '<textarea id="memo_'+i+'"'+'></textarea>';
			
			var memos = document.getElementById("memo_"+i);
			memos.value = memoData.value;
		}
	}
</script>	

<script type="text/javascript">
	function deleteMemo(deleteNum){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str = getStr();
		
		// test
		//window.alert(deleteNum);
		
		location.href = "deleteOneMemo?deleteNum="+deleteNum+"&"+str;
		
		
	}
</script>





<script type="text/javascript">
	function saveMemo(moveTo){
		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str = "saveMemo?";
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("memo_"+i);
			
			if(i==1){
				str = str+"memo"+i+"="+Memo.value;
			}
			if(1<i<j){
				str = str+"&memo"+i+"="+Memo.value;
			}
		}
		
		location.href = str+"&count="+j+"&moveTo="+moveTo;
	}
</script>

<script type="text/javascript">
	
 	function getStr(){ // href를 중복으로 사용하는 것은 불가능하기 때문에 str을 구해 get방식으로 넘겨주기 위한 함수
 		var memocount = document.getElementById("memocount");
		var j = memocount.value;
		var str;
		
		for(i = 1 ; i<=j ; i++){
			var Memo = document.getElementById("memo_"+i);
			
			if(i==1){
				str = "memo"+i+"="+Memo.value;
			}
			if(1<i<j){
				str = str+"&memo"+i+"="+Memo.value;
			}
		}
		str = str+"&count="+j;
		return str;
	} 
</script>

</head>
<body onload="wholeMemo()">

<%String memocount = (String)session.getAttribute("memoCount"); %>
<input type="hidden" value="<%=memocount%>" id="memocount"></input>

<a href="#" onclick="saveMemo('groupHome')">Back</a>  

<%String selectedGroup = (String)session.getAttribute("selectedGroup"); %>
<%String constructor = (String)session.getAttribute("constructor"); %>
<%String loginUser = (String)session.getAttribute("userId"); %>

Group Name : <%=selectedGroup %>
</br></br>

<button onclick="newMemeo()">new memo</button>
</br></br>

<div id="memoDelete_1"></div>
<div id="Memo_1"></div>
<div id="memoDelete_2"></div>
<div id="Memo_2"></div>
<div id="memoDelete_3"></div>
<div id="Memo_3"></div>
<div id="memoDelete_4"></div>
<div id="Memo_4"></div>
<div id="memoDelete_5"></div>
<div id="Memo_5"></div>
<div id="memoDelete_6"></div>
<div id="Memo_6"></div>
<div id="memoDelete_7"></div>
<div id="Memo_7"></div>
<div id="memoDelete_8"></div>
<div id="Memo_8"></div>
<div id="memoDelete_9"></div>
<div id="Memo_9"></div>
<!-- <button onclick="saveMemo()">save</button> -->



<!-- memoDatas -->
<%
List memoDataList = (List)request.getAttribute("memoDataList");
Iterator iter = memoDataList.iterator();
int i = 1;
while(iter.hasNext()) {
	String memoData = (String)iter.next();
	
	// test
	if(memoData==null){
		memoData = "";
	}
	
	out.print("<input type='hidden' id='memoData"+i+"' value='"+memoData+"'></input>");
	i++;
}

%>

<div align="right">
	</br>
	<a href="addComment">comment</a>
	</br>
	<a href="#" onclick="saveMemo('addMemberPage')">AddMember</a>
	</br>
	<a href="#" onclick="saveMemo('MemberList')">MemberList</a>
	</br>
	
	<c:set var="constructor" value="<%=constructor %>"/>
	<c:set var="loginUser" value="<%=loginUser %>" />
					
	<c:if test="${constructor eq loginUser}">
		<a onclick="deleteGroup('<%=selectedGroup %>')">Delete Group</a>
	</c:if>	
	
	
</div>

</body>
</html>