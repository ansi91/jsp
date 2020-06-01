<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	List<Map<String,Object>>memList = (List<Map<String,Object>>)request.getAttribute("memList");
    if(memList == null){
    	memList = new ArrayList<>();
    }
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 목록</title>
<%@include file="../common/jEasyUICommon.jsp" %>

</head>
<body>
	
	<table class="easyui-datagrid"  data-options="toolbar:tbar">
    <thead >
        <tr>
            <th data-options="field:'mem_id',width:120">아이디</th>
            <th data-options="field:'mem_name',width:200">이름</th>
            
        </tr>
    </thead>
    <tbody>
    <%
    	if(memList.size() > 0){
    		for(int i=0; i < memList.size(); i++) {
    			Map<String,Object> rmap = memList.get(i);
    		
    %>
    	<tr>
    		<td><%=rmap.get("MEM_ID") %></td>	 
    		<td><%=rmap.get("MEM_NAME") %></td>
    	</tr>
    
    	<%
    		 	} // end of for문
    		}else{
    	%>
    	<tr>
    		<td colspan="2">목록이 없습니다.</td>
    	</tr>
    	<%
    		}	
    	%>
    </tbody>
    </table>
    	<div id="dl_add"></div>
    <script type="text/javascript">
        var tbar = [{
            text:'등록',
            iconCls:'icon-add',
            handler:function()  {
            	cmm_window_popup('memberAddForm.jsp','400','600','memberAddForm');
            }
        },{
            text:'삭제',
            iconCls:'icon-cut',
            handler:function(){alert('삭제')}
        },'-',{
            text:'수정',
            iconCls:'icon-edit',
            handler:function(){alert('수정')}
        },'-',{
            text:'조회',
            iconCls:'icon-search',
            handler:function(){$('#dl_memList').dialog({
            //	href:'/member/member.mvc2?crud=memberList'
            		href:'/dev_jsp/member/memberList.mvc3'
            });
            
            }
        }];
    </script>
</body>
</html>