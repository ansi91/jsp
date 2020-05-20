<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키에서 ch09-1에서 읽음</title>
<script type="text/javascript">
	function cookDel(){
		location.href = "cookieDelete1.jsp";
	}
</script>
</head>
<body>
<%
	Cookie[] cookies = request.getCookies();
	for (int i=0; i < cookies.length; i++){
		out.print(cookies[i].getName() + " " + cookies[i].getValue() +"<br>");
	}
%>
<input type="button" value="쿠키삭제" onclick="cookDel()"> 
</body>
</html>