<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>a3.jsp</title>
</head>
<body>
<!--html영역 로컬pc의 브라우저가 처리  -->
<%

//스크립틀릿 - Tomcat이 처리 주체다 우선 순위 1 왜냐하면 서버이기 때문에
	int result=0;
	for(int i=1; i<=100; i++){
		result +=i;
	
	}
	out.print("1부터 100까지의 합 :" + result); //결정된 정보인 이순신만 보임
	request.setAttribute("result", result); //request저장소에 기록하기
	
	RequestDispatcher view = request.getRequestDispatcher("b3.jsp");
	view.forward(request,response);
%>

</body>
</html>