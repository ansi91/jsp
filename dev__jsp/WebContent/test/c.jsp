<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <% String result = null;
    
    if(request.getAttribute("text")!=null){
    	result = (String)request.getAttribute("text");
    }
    %>
<%@include file="../common/jEasyUICommon.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="easyui-datagrid">
    <thead>
        <tr>
            <th data-options="field:'code'">Code</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><%=result%></td>
        </tr>
    </tbody>
</table>


</body>
</html>