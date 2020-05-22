package com.mvc2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import chap08.Controller;

public class FrontMVC2 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC2.class);
	
	public void doService(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		logger.info("doService 호출 성공");
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		String command = requestURI.substring(contextPath.length()+1); //   /member/member.mvc2 | /order/order.mvc2  | /price/price.mvc2
		Controller controller = null;
		logger.info("command" + command);
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		logger.info("doGet 호출성공");
		doService(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doService(req, res);
	}
}
