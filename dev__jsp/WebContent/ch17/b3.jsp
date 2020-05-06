<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b3.jsp</title>
</head>
<body>
<%					//integer 다름
	int result = (Integer)request.getAttribute("result"); 
	
	out.print("1부터 100까지의 합 :" + result );
%>
</body>
</html>