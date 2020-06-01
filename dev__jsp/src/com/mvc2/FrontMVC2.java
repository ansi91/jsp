package com.mvc2;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import jsp.dept.DeptController;
import jsp.dept.DeptDao;

public class FrontMVC2 extends HttpServlet {
	Logger logger = Logger.getLogger(FrontMVC2.class);
	public void doService(HttpServletRequest req
			                   , HttpServletResponse res)
	throws ServletException, IOException
	{
		logger.info("doService 호출 성공");
		//insert here
		//  ==> dev_jsp/member/memberList.mvc2
		String requestURI = req.getRequestURI();
		logger.info("requestURI : "+requestURI);
		//  ==> dev_jsp
		String contextPath = req.getContextPath(); 
		logger.info("contextPath : "+contextPath);
		// ==> /member/memberList.mvc2	
		String command = 
				requestURI.substring(contextPath.length()+1);
		// ==> member/memberList.mvc2	
		
		Controller controller = null;
		logger.info("command : "+command);
		String crud = null;
		crud = req.getParameter("crud");
		logger.info("crud ==> "+crud);
		//insert here - 인스턴스화 and process call
		try {
			controller = 
					ControllerMapper.getController(command, crud)
;		} catch (Exception e) {
			// TODO: handle exception
		}
		if(controller instanceof MemberController) {
			logger.info("MemberController 타입이면...회원관리 업무임.");
			String path = controller.process(req, res);
			String pageMove[] = null;
			pageMove = path.split(":");
			for(int i=0;i<pageMove.length;i++) {
				logger.info("pageMove:"+pageMove[i]);
			}
			if(pageMove !=null) {
				String path2 = pageMove[1];
				if("redirect".equals(pageMove[0])) {
					res.sendRedirect(path2);
				}
				else {
					RequestDispatcher view
								= req.getRequestDispatcher(path2);
					view.forward(req, res);
				}
				
			}
		}
	}
	public void doGet(HttpServletRequest req
			, HttpServletResponse res)
					throws ServletException, IOException
	{
		logger.info("doGet 호출 성공");
		doService(req,res);
	}
	public void Post(HttpServletRequest req
			, HttpServletResponse res)
					throws ServletException, IOException
	{
		logger.info("doPost 호출 성공");
		doService(req,res);
	}
	
}
