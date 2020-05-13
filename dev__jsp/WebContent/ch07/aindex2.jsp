<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String menu = null;
    	if(request.getParameter("menu")!=null){
    		menu=request.getParameter("menu");
    	}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="1000px" height="500px" border="1" borderColor="orange">
  
	<tr>
		<td colspan="2" height="50px"><%@include file="top.jsp" %></td>
	</tr>
  	
	<tr>
		<td width="250px"><%@include file="menu.jsp" %></td><td width="750px"><%@include file="body.jsp" %></td>
	</tr>
</table>	

</body>
</html>