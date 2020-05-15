<%@page import="chap08.MemberInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="chap08.MemberInfo"/>
<%
	member.setId("chii23");
	member.setName("조현성");
%>
<jsp:forward page="/useObject.jsp"/>