<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="restaurant.RestaurantDao" %>    
<%
		
	
//mapDesign.html문서에서 사용자가 화면에 입력한 아이디 가져오기
	String mem_id = request.getParameter("mem_id");
//mapDesign.html문서에서 사용자가 화면에 입력한 비번 가져오기
	String mem_pw = request.getParameter("mem_pw");
	//out.print("사용자가 입력한 아이디는 "+mem_id);
	RestaurantDao rdao = new RestaurantDao();
	String msg = null;
	msg = rdao.login(mem_id, mem_pw);
	Cookie c_name 	  = new Cookie("c_name",msg);
	response.addCookie(c_name);
	c_name.setMaxAge(300);
	c_name.setPath("/"); //루트로 해야 여러 컨텐츠에서 접근 가능 게임,쇼핑,스포츠 등등
	out.print(msg);
%>