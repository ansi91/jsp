<%@page import="java.util.Random"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page import="com.util.DBConnectionMgr"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.mvc3.Chart"%>
<%
	Connection con = null;
Statement stmt = null;
ResultSet rs = null;
DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
Chart c = new Chart();
List<Map<String, Object>> clist = c.ca();
List<Map<String, Object>> clist2 = c.ca2();
%>

<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["남자", "여자", { role: "style" }]
        <%String colors[] = {"yellow", "red", "green", "blue", "pink", "cyan"};

for (int i = 0; i < clist.size(); i++) {
	Map<String, Object> cmap = clist.get(i);%>
        
        	  ,['<%=cmap.get("ename").toString()%>',<%=Integer.parseInt(cmap.get("sal").toString())%>,'<%=colors[i]%>']

     <%}%>
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "월매출",
        width: 600,
        height: 400,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.BarChart(document.getElementById("barchart_values"));
      chart.draw(view, options);
  }
    
     </script>
	<script type="text/javascript">
     google.charts.setOnLoadCallback(drawChart);
     function drawChart() {
       var data = google.visualization.arrayToDataTable([
     	  ["품목", "판매량", { role: "style" }]
           <%String color = "blue";

for (int i = 0; i < clist2.size(); i++) {
	Map<String, Object> cmap2 = clist2.get(i);%>
           
           	  ,['<%=cmap2.get("gubun_vc").toString()%>',<%=Integer.parseInt(cmap2.get("s").toString())%>,'<%=color%>']

        <%}%>
       ]);

       var options = {
         title: '금일 판매 현황',
         pieHole: 0.4,
       };

       var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
       chart.draw(data, options);
     }
     </script>
	<script type="text/javascript">
     
     google.charts.load('current', {'packages':['corechart']});
     google.charts.setOnLoadCallback(drawChart);

     function drawChart() {
       var data = google.visualization.arrayToDataTable([
         ['날짜', '판매현황', '입고현황'],
         ['2020/06/01',  1000,      400],
         ['2020/06/02',  1170,      460],
         ['2020/06/03',  660,       1120],
         ['2020/06/04',  1030,      540]
       ]);

       var options = {
         title: '입출고 현황 그래프',
         curveType: 'function',
         legend: { position: 'bottom' }
       };

       var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

       chart.draw(data, options);
     }
   </script>
	</script>
	<div id="barchart_values" style="width: 900px; height: 400px;"></div>
	<div id="donutchart" style="width: 500px; height: 300px;"></div>
	 <div id="curve_chart" style="width: 900px; height: 500px"></div>
</body>
</html>