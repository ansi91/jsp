<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>b.jsp[a.jsp에 포함될 내용]</title>
</head>
<body>
b1<br>
b2<br>
<br>
<%  
	 request.setAttribute("mem_name", "이순신"); 
	 out.print(1+2);
	 %>
b3<br>

</body>
</html>