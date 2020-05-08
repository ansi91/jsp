<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<?xml version="1.0" encoding="UTF-8"?>
<%
	response.setContentType("text/xml; charset=UTF-8");
	String id = request.getParameter("mem_id");
	out.print("<recodes>");
	out.print("<record>");
	out.print("테스트");
	out.print("</record>");
	out.print("<recodes>");
	
%>
</body>
</html>