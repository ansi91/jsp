<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<!--Load the AJAX API-->
		<script type="text/javascript" src="https://www.google.com/jsapi"></script>
		<script type="text/javascript" src="jquery-1.8.1.js"></script> 
		<script type="text/javascript" src="ajax-sample.js"></script>
		<script type="text/javascript">
		google.load('visualization', '1', {'packages':['corechart']});
		 
		// Set a callback to run when the Google Visualization API is loaded.
		google.setOnLoadCallback(drawChart);

		function drawChart() {
			var jsonData = $.ajax({
				url: "./chartJson.jsp",
				dataType:"json",
				async: false
			}).responseText;
			
			// Create our data table out of JSON data loaded from server.
			var data = new google.visualization.DataTable(jsonData);

			// Instantiate and draw our chart, passing in some options.
			var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
			chart.draw(data, {width: 400, height: 240});
		}
		</script>
	</head>

	<body>
		<!--Div that will hold the pie chart-->
		<div id="chart_div"></div>
		<button id="btn" type="button" onclick="drawChart()">reflesh</button>
	</body>
</html>