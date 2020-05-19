<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Cookie[] cookies = request.getCookies();
	String h_no = null;
	if(cookies!= null && cookies.length > 0){
		for (int i = 0; i < cookies.length; i++){
			if ("c_hno".equals(cookies[i].getName())){
				h_no = cookies[i].getValue();
		
			}
		}
	}
	out.print("c_hno:"+h_no);
	String daps[] = {"1","1","2","3"};
	String users [] = new String[4];
	Cookie[] c_htest = request.getCookies();
	String c_test = null;
	if(c_htest!= null && c_htest.length > 0){
		for (int i = 0; i < c_htest.length; i++){
			if ("chtest[i]".equals(c_htest[i].getName())){
				users[i] = c_htest[i].getValue();
				out.print(users[i]);
			}
		}
	}
	out.print("c_test:"+c_test);

	
	
	
	


	
%>