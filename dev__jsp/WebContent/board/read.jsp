<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    <%
    /*list-jsp는 n건, read.jsp는 1건 ->select
    	logic 한개 Dao 한개
    	Controller 두 개 
    */
    	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
    	int size=0;
    	Map<String,Object> rmap = boardList.get(0);
    	if (boardList != null){
    		size=boardList.size(); //null이 아니라면 무조건 1건만 담긴다?
    	}
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통코드 영역 (화면 공통 코드, 인증처리)  -->
<%@include file="../common/jEasyUICommon.jsp" %>
</head>
<body>

</body>
</html>