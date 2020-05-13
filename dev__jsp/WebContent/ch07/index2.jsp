<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String menu = null;
    	if(request.getParameter("menu")!=null)
    		menu=request.getParameter("menu");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table width="1000px" height="500px" border="1" borderColor="orange">
<!--Top.jsp  -->
	<tr>
		<td colspan=2 width="1000px" height="50px">
			<table width="1000px" height="100%" border="1" >
				<tr>
					<td>온라인 시험 솔루션 개발</td>
				</tr>
		
	<!--Top 끝  -->
	<!--Main  -->
		</td>
	</tr>
		</table>  
	<tr>
		<td width="250px" height="450px">
			<%@include file="menu2.jsp" %>
		</td>	
		<td width="750px" height="450px">
		asdsd
			<%
	if(menu==null || "intro".equals(menu)) {
%>		
		<%@include file="intro.jsp" %>
				
<%
	}else if("login".equals(menu)){
%>
		<%@include file="login.jsp" %>
<%
	}else if("board".equals(menu)){
%>
		<%@include file="board.jsp" %>
<%
	}
%>
		</td>
	</tr>
</table>	
</body>
</html>