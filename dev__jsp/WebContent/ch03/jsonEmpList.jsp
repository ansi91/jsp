<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="orm.dao.SqlMapEmpDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%--jsp 전용 주석 --%>
<%
//html주석은 사용 불가 - 소스 보기 했을 때 주석이 보이므로 json형식에 맞지 않음
	String empno = request.getParameter("empno");
	int iempno = 0;
	if(request.getParameter("empno")!=null){
		iempno = Integer.parseInt(empno);		
	}
	SqlMapEmpDao smed = new SqlMapEmpDao();
	Map<String,Object> pmap = new HashMap<>();
	pmap.put("empno",iempno);
	List<Map<String,Object>> elist = smed.empList(pmap);
	Gson g = new Gson();
	String imsi = g.toJson(elist);
	out.print(imsi);
%>
