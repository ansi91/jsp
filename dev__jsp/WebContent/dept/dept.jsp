<%@page import="java.util.HashMap"%>
<%@page import="com.mvc3.DeptDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%

 /*    List<Map<String,Object>> dlist = 
	(List<Map<String,Object>>)request.getAttribute("deptList");
		Map<String,Object> rmap = null;
		String deptno = null;
		String dname = null;
		String loc = null;
		
			deptno = rmap.get("DEPTNO").toString();
			dname = rmap.get("DNAME").toString();
			deptno = rmap.get("LOC").toString() ;*/
    
 	
	DeptDao dDao = new DeptDao();
	Map<String,Object> pmap = new HashMap<>();

	List<Map<String,Object>> dlist = dDao.boardList(pmap); 
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<th>DEPTNO</th><th>DNAME</th><th>DNAME</th>
	<%
	for (int i=0; i < dlist.size(); i++){
		
	%>
	<tr> <td><%out.print(pmap.get("DEPTNO")); %></td> <td><%out.print(pmap.get("DNAME")); %></td> <td><%out.print(pmap.get("LOC")); %></td> </tr>
	 <%
	} 
	 %>
</table>
</body>
</html>