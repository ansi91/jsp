<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--html영역 로컬pc의 브라우저가 처리  -->
<%

//스크립틀릿 - Tomcat이 처리 주체다 우선 순위 1 왜냐하면 서버이기 때문에
	String name = "이순신";
	out.print("이름 :" + name); //결정된 정보인 이순신만 보임
	response.sendRedirect("b.jsp");
%>

</body>
</html>