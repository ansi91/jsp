<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	//자바영역 - 서버에서 처리된 결과가 html코드에 합쳐져서 클라이언트 측으로 다운로드 되는 것임
    	// 이미 모든 값이 결정된 상태임 - 변경불가함. -정적임
    	List<Map<String,Object>> boardList = (List<Map<String,Object>>)request.getAttribute("boardList");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 공통코드 영역 (화면 공통 코드, 인증처리)  -->
<%@include file="../common/jEasyUICommon.jsp"%>

<script type="text/javascript">
	function writeForm(){
		$('#f_write').dialog({
		    width: 600,
		    height: 400,
		    closed: false,
		    cache: false,
		    href: 'writeForm.jsp',
		    modal: true
		});
	}
	
	function boardList(){
		location.href="/board/boardList.mvc3?cud=SEL";
	}
</script>
</head>
<body>
 <table id="dg" title="My Users" class="easyui-datagrid" style="width:750px;height:350px"
           
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="bm_no" width="30">글번호</th>
                <th field="bm_title" width="150">글제목</th>
                <th field="bm_writer" width="50">작성자</th>
                <th field="bs_file" width="100">첨부파일</th>
                <th field="bs_hit" width="50">조회수</th>
            </tr>
        </thead>
        <%
         	if(boardList!=null) {
         %>
         
        		<tbody>
        <% 		
         		for(int i=0; i < boardList.size(); i++){
         			Map<String,Object>rmap = boardList.get(i);
         	
        %>
        	<tr>
        		<td><%=rmap.get("BM_NO")%></td>
        		<td><%=rmap.get("BM_TITLE")%> </td>
        		<td><%=rmap.get("BM_WRITE")%></td>
        		<td><%=rmap.get("BM_FILE")%> </td>
        		<td><%=rmap.get("BM_HIT")%> </td>
        	</tr>
        </tbody>
        
    </table>
        <%
         	} //end of for 
        }//end of if
        %>
        
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="writeForm()">글쓰기</a>
		        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="boardList()">조회</a>
    </div>
    <div id="f_write"></div>
    <!--===================글쓰기 화면 처리 시작  ======================-->
    	<div id="dlg_write" class="easyui-dialog" data-options="closed:true">
    	asdasdsad
    	</div>
    <!--===================글쓰기 화면 처리 종료  ======================-->
</body>
</html>