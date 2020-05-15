<%@page import="java.net.*"%>
<%@ page import="java.io.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String clientId = "eqSxBVPowtRnziXh3OXE"; //애플리케이션 클라이언트 아이디값";
	String clientSecret ="s9obtji2I4"; //애플리케이션 클라이언트 시크릿값";
	try{
		String code = "0"; // 키 발급시 0,  캡차 이미지 비교시 1로 세팅
        String apiUrl = "https://openapi.naver.com/v1/captcha/nkey?code=" + code;
        URL url = new URL(apiUrl);
      	HttpURLConnection con =   (HttpURLConnection)url.openConnection();
      	con.setRequestMethod("GET");
      con.setRequestProperty("X-Naver-Client-Id", clientId);
        con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
        int responseCode = con.getResponseCode();
        BufferedReader br = null;
        
        if(responseCode==200){
        	br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        }else{
        	br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
        }
        String line = null;
        StringBuffer sb_line = new StringBuffer(); // 멀티스레드에서 안전 / 문자열을 추가로 붙이거나 뺀다.
        while((line=br.readLine())!=null){	
        	sb_line.append(line);
        }
        br.close(); //사용한 자원 반납하기
        out.print(sb_line.toString());
	}catch(Exception e){
		out.print(e.toString());
	}
		
%>
