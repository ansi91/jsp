<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Map<String, Object> pMap = new HashMap<>();
	Gson gson = new Gson();
	pMap.put("text", request.getAttribute("text"));
	String result = gson.toJson(pMap);
	out.print(result);
%>
