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
<div id="yellowMemo1"></div>
<div id="redMemo1"></div>
<div id="greenMemo1"></div>
<div id="Memo_1"></div>

<div id="memoDelete_2"></div>
<div id="yellowMemo2"></div>
<div id="redMemo2"></div>
<div id="greenMemo2"></div>
<div id="Memo_2"></div>

<div id="memoDelete_3"></div>
<div id="yellowMemo3"></div>
<div id="redMemo3"></div>
<div id="greenMemo3"></div>
<div id="Memo_3"></div>

<div id="memoDelete_4"></div>
<div id="yellowMemo4"></div>
<div id="redMemo4"></div>
<div id="greenMemo4"></div>
<div id="Memo_4"></div>

<div id="memoDelete_5"></div>
<div id="yellowMemo5"></div>
<div id="redMemo5"></div>
<div id="greenMemo5"></div>
<div id="Memo_5"></div>

<div id="memoDelete_6"></div>
<div id="yellowMemo6"></div>
<div id="redMemo6"></div>
<div id="greenMemo6"></div>
<div id="Memo_6"></div>

<div id="memoDelete_7"></div>
<div id="yellowMemo7"></div>
<div id="redMemo7"></div>
<div id="greenMemo7"></div>
<div id="Memo_7"></div>

<div id="memoDelete_8"></div>
<div id="yellowMemo8"></div>
<div id="redMemo8"></div>
<div id="greenMemo8"></div>
<div id="Memo_8"></div>

<div id="memoDelete_9"></div>
<div id="yellowMemo9"></div>
<div id="redMemo9"></div>
<div id="greenMemo9"></div>
<div id="Memo_9"></div>
<!-- <button onclick="saveMemo()">save</button> -->

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
			YellowMemo.innerHTML = '<button onclick="changeYellow('+i+')">yellow</button>';
			
			var RedMemo = document.getElementById("redMemo"+i);
			RedMemo.innerHTML = '<button onclick="changeRed('+i+')">red</button>';
			
			var GreenMemo = document.getElementById("greenMemo"+i);
			GreenMemo.innerHTML = '<button onclick="changeGreen('+i+')">green</button>';
			
			// 메모삭제 버튼
			var MemoDelete = document.getElementById("memoDelete_"+i);
			MemoDelete.innerHTML = '<button onclick="deleteMemo('+i+')" id="MemoDelete_'+i+'"'+'>x</button>';
					
			// 메모
			Memo.innerHTML = '<textarea id="memo_'+i+'"'+'></textarea>';
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
		location.href = "changeMemoColor?color=DED541"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
	}
	 
	function changeRed(changeNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "changeMemoColor?color=C94449"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
	}
	
	function changeGreen(changeNum){
		var str = getStr();
		var colorStr = getColorStr();
		location.href = "changeMemoColor?color=1AB557"+"&"+str+"&changeNum="+changeNum+"&"+colorStr;
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
			
			if(memoColorValue == "#DED541"){//1AB557  C94449  DED541
				memoColorValue = "DED541";
			}
			else if(memoColorValue == "#C94449"){
				memoColorValue = "C94449";
			}
			else if(memoColorValue == "#1AB557"){
				memoColorValue = "1AB557";
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