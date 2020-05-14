<%@page import="java.util.HashMap"%>
<%@page import="jsp.dept.DeptDao"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* 	DeptDao dDao = new DeptDao();
	Map<String,Object> dmap = new HashMap<>();
	String deptno= request.getParameter("deptno");
	dmap.put("deptno",deptno);
	List<Map<String,Object>> deptList = dDao.deptList(dmap);
	 */
	List<Map<String,Object>> deptList = (List<Map<String,Object>>)request.getAttribute("deptList"); //forward ->servlet 
	Gson g = new Gson();
	String imsi = g.toJson(deptList);
	out.print(imsi); //json포맷

%>