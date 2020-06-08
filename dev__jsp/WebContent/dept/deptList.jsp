<%@page import="jsp.dept.ActionForward"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>DeptList 페이지</title>
<%@include file="../common/jEasyUICommon.jsp" %>
<script type="text/javascript">
	 function selectDept(){
		 $('#t').datagrid({
			 url:'jsonDeptList.jsp'
			 
		 });
	 }
</script>
</head>
<body>
<button onclick="selectDept()">조회</button>
<table id="t" class="easyui-datagrid" title="부서목록" >
</table>
</body>
</html>