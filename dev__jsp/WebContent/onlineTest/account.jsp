<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int score =0;
	String htest1 = request.getParameter("htest1");
	String htest2 = request.getParameter("htest2");
	String htest3 = request.getParameter("htest3");
	String htest4 = request.getParameter("htest4");

	int h1 = Integer.parseInt(htest1);
	int h2 = Integer.parseInt(htest2);
	int h3 = Integer.parseInt(htest3);
	int h4 = Integer.parseInt(htest4);
	if(h1==1){
		score+=25;
	}else{
		out.print("오답");
	}
	
	if(h2==1){
		score+=25;
	}else{
		out.print("오답");
	}
	
	if(h3==2){
		score+=25;
	}else{
		out.print("오답");
	}

	if(h4==3){
		score+=25;
	}else{
		out.print("오답");
	}
	
	switch(score){
		case 100: out.print("참 잘했습니다. 점수=" + score +"점" );
		break;
		
		case 75: out.print("잘했습니다. 점수=" + score +"점");
		break;
		
		case 50: out.print("분발 하세요. 점수=" + score +"점");
		break;
		
		case 25: out.print("이게 뭡니까. 점수=" + score +"점");
		break;
		
		default: out.print("... 점수=" + score +"점");
	}	
	
	
%>