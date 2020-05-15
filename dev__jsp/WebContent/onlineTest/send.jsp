<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String htest1 = request.getParameter("htest1");
	String htest2 = request.getParameter("htest2");
	String htest3 = request.getParameter("htest3");
	String htest4 = request.getParameter("htest4");
	out.print(htest1);
	out.print(htest2);
	out.print(htest3);
	out.print(htest4);
	
	String h_no = request.getParameter("h_no");
	String h_name = request.getParameter("h_name");
	out.print("<br>");
	out.print(h_no+","+h_name);//null, null
%>
<form method="get" action="account.jsp">
<input type="hidden" name="htest1"  value="<%=htest1 %>"> 
<input type="hidden" name="htest2" value="<%=htest2 %>">
<input type="hidden" name="htest3" value="<%=htest3 %>">
<input type="hidden" name="htest4" value="<%=htest4 %>">
<input type="submit" value="채점하기">
</form>

