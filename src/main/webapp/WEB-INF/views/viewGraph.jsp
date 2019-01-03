<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
window.onload = function() {
 
var dps = [[]];
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2", // "light1", "dark1", "dark2"
	exportEnabled: true,
	animationEnabled: true,
	title: {
		text: "Time graph (${date})"
	},
	data: [{
		type: "pie",
		showInLegend: "true",
		legendText: "{label}",
		yValueFormatString: "#,###\"분\"",
		indexLabelFontSize: 16,
		indexLabel: "{label} - {y}",
		dataPoints: dps[0]
	}]
});
 
var yValue;
var label;
 
<c:forEach items="${dataPointsList}" var="dataPoints" varStatus="loop">	
	<c:forEach items="${dataPoints}" var="dataPoint">
		yValue = parseFloat("${dataPoint.y}");
		label = "${dataPoint.label}";
		dps[parseInt("${loop.index}")].push({
			label : label,
			y : yValue,
		});		
	</c:forEach>	
</c:forEach> 
 
chart.render();
}
</script>
</head>
<body>

<a href="dailyManagement">Back</a>
<h4> search another day's graph</h4>
<form action ="canvasjschart">
input date : <input type="text" name="Date_graph"> Input Format(0000-00-00)
<input type="submit" value="search">
</form>


	<div id="chartContainer" style="height: 370px; width: 100%;"></div>
	<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script> <!-- 자바 스크립트 차트 라이브러리  -->
</body>
</html>                              