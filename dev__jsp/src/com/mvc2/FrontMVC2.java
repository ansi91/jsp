package com.mvc2;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class FrontMVC2 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC2.class);
	
	public void doService(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		logger.info("doService 호출 성공");
	
		String requestURI = req.getRequestURI();	//==> dev_jsp/member/memberList.mvc2
		System.out.println("ru" + requestURI);
		String contextPath = req.getContextPath(); // ==> / ==> /dev_jsp
	
		String command = requestURI.substring(contextPath.length()+1); //   /member/member.mvc2 | /order/order.mvc2  | /price/price.mvc2
		Controller controller = null;
		logger.info("command= " + command);
		
		String crud = null;
		try {
			crud = req.getParameter("crud");
			controller = ControllerMapper.getController(command, crud);
			logger.info("crud ="+ crud);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		if (controller instanceof MemberController) {
			logger.info("MemberController 타입이면 회원관리 업무임...");
			String path = controller.process(req, res);
			String pageMove[] = null;
			pageMove = path.split(":"); //pageMove[] : MemberController의 process 메소드의 return값을 담는다 0번방 forward or sendRedirection | 1번방 memberList.jsp
			for (String str : pageMove) {
				System.out.println("str= " + str);
			}
			for (int i=0; i < pageMove.length; i++) {
				logger.info("pageMove:" + pageMove[i]);
			}
			if(pageMove != null) {
				String path2 = pageMove[1];
				if ("redirect".equals(pageMove[0])) {
					res.sendRedirect(path2);
				}else {
					RequestDispatcher view = req.getRequestDispatcher(path2);
					view.forward(req, res);
				}
			}
		}
	}
	
	public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		logger.info("doGet 호출성공");
		doService(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException {
		doService(req, res);
	}
}
/*
 * 테스트 시나리오 
 * member/memberList.mvc2
 * member/memberList.jsp
 * 
 * member/member.mvc2?crud=sel
 * member/member.mvc2?crud=ins
 * member/member.mvc2?crud=detail
 * member/member.mvc2?crud=update
 */

