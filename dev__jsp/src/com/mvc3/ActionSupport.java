package com.mvc3;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.mvc2.Controller;
import com.mvc2.ControllerMapper;
import com.mvc2.MemberController;

public class ActionSupport extends HttpServlet {
	Logger logger = Logger.getLogger(ActionSupport.class);
	public void doService(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doService 호출 성공");
//insert here

		String requestURI = req.getRequestURI();//  ==> /dev_jsp/member/memberList.mvc3
		logger.info("requestURI : " + requestURI);//  
		String contextPath = req.getContextPath(); // ==> /dev_jsp
		logger.info("contextPath : " + contextPath);	

		String command = requestURI.substring(contextPath.length() + 1);// ==> member/memberList.mvc2	
		
		logger.info("before command : " + command); // ==> member/memberList.mvc3
		int end = command.lastIndexOf("."); //문자열에서 탐색하는 문자열이 마지막으로 등장하는 위치에 대한 index를 반환 마지막 위치까지 포함
		logger.info("[end] =" + end);
		String requestName = null; 
		requestName = command.substring(0,end); //member/memberList.mvc3
		Controller2020 controller = null;
		logger.info("after command : " + requestName);
	
	
	
			//insert here - 인스턴스화 and process call
		String cud = req.getParameter("cud");
		logger.info("[cud]=" + cud);
		try {
			controller = ControllerMapper3.getController(command);   // ==> member/memberList.mvc3
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(controller != null) {
			String pageMove[] = null; 
			try {
				//Object에 오는 타입이 두 가지 이다.
				//하나는 ModelAndView 나머지 하나는 String
				Object robj = null;
				if (cud==null) {
					logger.info("cud가 null인 경우 처리");
					robj = controller.process(requestName, req,res); 
					
				}else { //입력이야? 수정할거니? 삭제할거니?
					logger.info("cud가 null이 아닌 경우 처리");
					robj = controller.process( req,res);
					
				}//ModelAndView인지 아니면 String인지 찍어 보자.
				
				
				if(robj instanceof String) {
					pageMove = robj.toString().split(":");
					logger.info("[robj String] =" + robj);
					//logger.info("pageMove[0] =" + pageMove[0] + "pageMove[1] = " + pageMove[1]);
				}
				else if (robj instanceof ModelAndView) {
					ModelAndView mav = (ModelAndView)robj;
					logger.info("[robj ModelAndView] =" + robj);
					pageMove = new String[2];
					pageMove[0] = "forward";
					pageMove[1] = mav.getViewName();
				}
			} catch (Exception e) {
				logger.info("[Exception] =  " + e.toString());
			}
			if(pageMove != null) {
				String path=pageMove[1];
				if("redirect".equals(pageMove[0])) { // redirect 할거야? 힌트 return "redirect:/member/memberList.mvc3
					res.sendRedirect(path);
				}else{ // forward 할거야?
					if("forward".equals(pageMove[0])) {
						RequestDispatcher view = req.getRequestDispatcher(path);
						view.forward(req, res);
					}else {
						res.sendRedirect("/error/pageMoveFail.jsp");
					}
				}
			}	
			
		} // if - controller not null
		
	} // end of doService

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출 성공");
		doService(req, res);
	}

	public void Post(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출 성공");
		doService(req, res);
	}

}
