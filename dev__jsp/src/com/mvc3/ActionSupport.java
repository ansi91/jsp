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
		int end = command.lastIndexOf(".");
		String requestName = null;
		requestName = command.substring(0,end); //member/memberList.mvc3
		Controller2020 controller = null;
		logger.info("after command : " + requestName);
	
	
	
			//insert here - 인스턴스화 and process call
		try {
			controller = ControllerMapper3.getController(command);   // ==> member/memberList.mvc3
		} catch (Exception e) {
			e.printStackTrace();
		}
		if(controller != null) {
			String pageMove[] = null; 
			try {
				Object robj = controller.process(requestName, req,res);
			} catch (Exception e) {

			}
		}
		
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doGet 호출 성공");
		doService(req, res);
	}

	public void Post(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("doPost 호출 성공");
		doService(req, res);
	}

}
