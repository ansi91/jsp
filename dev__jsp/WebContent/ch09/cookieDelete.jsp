<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	Cookie c_notebook = new Cookie("c_notebook","");
	c_notebook.setMaxAge(0);
	response.addCookie(c_notebook);
	out.print(c_notebook.getName() + "," +c_notebook.getValue());
%>
</body>
</html>