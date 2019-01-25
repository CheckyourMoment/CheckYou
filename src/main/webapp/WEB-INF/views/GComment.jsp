<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>groupComment</title>


</head>
<body>
	<form action="addComment">
		<table>
			<tr>
				Input Comment :
				<input type="text" id="groupComment" name="groupComment" value="${dto.groupComment}" />
			</tr>
			</br>
		</table>
		<div>
			<a onClick="history.back();">Back</a>&nbsp;&nbsp; 
			<input type="submit" value="Save" />
		</div>

	</form>

</body>
</html>