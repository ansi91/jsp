<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	    Connection con = null;
	    Statement stmt = null;
	    ResultSet rs = null;
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>XML정보 읽어오기</title>
</head>
<body>
<table border="1" width="600">
		
		<tr><th>아이디</th><th>비밀번호</th><th>이름</th></tr>
		<%
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT mem_id, mem_pw, mem_name FROM member" );
			try{
				String jdbcDriver = "jdbc:apache:commons:dbcp:chap14";
				con = DriverManager.getConnection(jdbcDriver);
				stmt = con.createStatement();
				rs=stmt.executeQuery(sql.toString());
				for(;rs.next();) {
		%>
		
	<tr>
		<td><% 	out.print(rs.getString("mem_ID"));%> </td>
		<td><% 	out.print(rs.getString("mem_pw"));%> </td>
		<td><% 	out.print(rs.getString("mem_name"));%> </td>
	</tr>		

		<%
			  	}//////////end of for
				
			}catch(Exception e){
				out.println("exception:" + e.getMessage());
			}finally{//////////end of catch
		  		if(rs!=null) try{rs.close();} catch(SQLException ex){}
		  		if(stmt!=null) try{stmt.close();} catch(SQLException ex){}
		  		if(con!=null) try{con.close();} catch(SQLException ex){}
			}
		%>
	
	
</table>
</body>
</html>