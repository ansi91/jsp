<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.HttpURLConnection"%>
<%@page import="java.net.URL"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
String user = request.getParameter("user");
String key  = request.getParameter("key");
	String clientId = "eqSxBVPowtRnziXh3OXE"; //애플리케이션 클라이언트 아이디값";
	String clientSecret ="s9obtji2I4"; //애플리케이션 클라이언트 시크릿값";
	
	
	try{
		String code = "0";
		String apiURL = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
								//
	        URL url = new URL(apiURL);
	        HttpURLConnection con = (HttpURLConnection)url.openConnection();
	        con.setRequestMethod("GET");
	        con.setRequestProperty("X-Naver-Client-Id", clientId);
	        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	        
	        int responseCode =  con.getResponseCode();
	        BufferedReader br = null;
	        //네이버에서 서버에서 요청에 대한 응답을 성공처리
	       if(200==responseCode){
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));    	   
	       }
	        
	        String inputLine = null;
	        StringBuilder res = new StringBuilder();
	        
	        while((inputLine = br.readLine())!=null){
	        	res.append(inputLine);
	        }
	        br.close();
	        key = res.toString();
	        key = key.substring(8,24);
	    //    out.print("key="+key );
	        String apiURL2 = "?key="+key; //{"key":"asdassdf"}
	        out.print(apiURL2); 
	     //   String responseBody = get(apiURL,requestHeaders);
		//	System.out.println(responseBody);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	%>