<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List, java.util.Map" %>    
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="com.util.PageBar" %>    
<%@ page import="com.util.DBConnectionMgr"%>
<%@ page import="java.sql.*"%>
<%-- <%@ page import="chart.Chart"%> --%>

<%
	int tot = 0;
	if(session.getAttribute("s_tot")!=null){
		tot = 
				Integer.parseInt(session.getAttribute("s_tot").toString());
	}
	out.print("tot:"+tot);
//자바영역 - 서버에서 처리된 결과가 html코드에 합쳐져서 클라이언트 측으로
//다운로드 되는 것임
//이미 모든 값이 결정된 상태임-변경불가함.-정적임
	List<Map<String,Object>> boardList = 
			(List<Map<String,Object>>)request.getAttribute("boardList");
	//페이지 네비게이션 추가분
	int numPerPage = 2;
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--  공통코드 영역 (화면공통코드, 인증처리) -->
<%@include file="../common/jEasyUICommon.jsp" %>
<script type="text/javascript">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
	function boardList(){
		location.href = "/board/boardList.mvc3?cud=SEL";
		/*
		$.ajax({
			url: "/board/boardList.mvc3?cud=SEL"
		});
		*/
	}
	function board_ins(){
		alert("저장호출 성공");
		$("#f_write").attr("method","post");
		$("#f_write").attr("action","./boardINS.mvc3?cud=INS");
		$("#f_write").submit();
	}
	function writeForm(){
		$('#dlg_write').dialog({
		    title: '글쓰기 화면',
		    width: 600,
		    height: 400,
		    closed: false,
		    cache: false,
		    href: 'writeForm.jsp',
		    modal: true
		});
	}
</script>
</head>
<body>
    <table id="dg" title="My Users" class="easyui-datagrid" style="width:750px;height:350px"
            toolbar="#toolbar" pagination="true"
            rownumbers="true" fitColumns="true" singleSelect="true">
        <thead>
            <tr>
                <th field="bm_no" width="50">번호</th>
                <th field="bm_title" width="250">글제목</th>
                <th field="bm_writer" width="100">작성자</th>
                <th field="bs_file" width="120">첨부파일</th>
                <th field="bm_hit" width="90">조회수</th>
            </tr>
        </thead>
<%
	if(boardList!=null){
%>
		
		<tbody>
<%
//		for(int i=0;i<boardList.size();i++){
		for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
			if(tot == i) break;
			Map<String,Object> rmap = boardList.get(i);
%>        
			<tr>
				<td><%=rmap.get("BM_NO") %></td>
				<td>
<!-- 너 댓글이니? -->
<%
	String imgPath = "\\board\\";
	if(Integer.parseInt(rmap.get("BM_POS").toString())>0){
		for(int j=0;j<Integer.parseInt(rmap.get("BM_POS").toString());j++){
			out.print("&nbsp;&nbsp;");
		}////end of for
%>
	<img src="<%=imgPath %>r1.gif" border="0">
<%		
	}///////end of if
%>				
				<a href="./boardDetail.mvc3?cud=DET&bm_no=<%=rmap.get("BM_NO") %>">
				<%=rmap.get("BM_TITLE") %>
				</a>
				
				</td>
				<td><%=rmap.get("BM_WRITER") %></td>
				<td><a href="downLoad.jsp?bs_file=<%=rmap.get("BS_FILE")%>"><%=rmap.get("BS_FILE") %></a></td>
				<td><%=rmap.get("BM_HIT") %></td>
			</tr>
<%
		}/////////////end of for
%>
		</tbody>
<%
	}////////////////end of if
%>        
    </table>
    <div id="toolbar">
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="writeForm()">글쓰기</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="boardList()">조회</a>
    </div>
    <table border="1" style="width:750px;height:50px">
    	<tr>
    		<!-- <td align="center">1 2 3 4 5 6 7 8 9 10</td> -->
    		<td align="center">
<%
	String pagePath = "boardList.mvc3?cud=SEL";
	PageBar pb = 
			new PageBar(numPerPage, tot, nowPage, pagePath);
	String pagination = pb.getPageBar();
	out.print(pagination);
	
%>    		
    		</td>
    	</tr>
    </table>
    <!--===========[[ 글쓰기 화면 처리 시작 ]]=============-->
    <div id="dlg_write" class="easyui-dialog" data-options="closed:true">

    </div>
    <!--===========[[ 글쓰기 화면 처리   끝  ]]=============-->
    
    
    
</body>
</html>














