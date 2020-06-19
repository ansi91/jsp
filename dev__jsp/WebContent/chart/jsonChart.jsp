<%@page import="com.google.gson.Gson"%>
<%@page import="com.mvc3.Chart"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%
    	Chart chart = new Chart();
    	List<Map<String,Object>> clist = chart.ca();
    	Gson g = new Gson();
    	String imsi = g.toJson(clist);
    	out.print(imsi); //json포맷 
    	
    %>
    