package com.mvc3;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class TestController implements Controller2020 {
Logger logger = Logger.getLogger(TestController.class);
	String requestName= null;
	TestLogic tLogic = null;
	public TestController(String requestName) {
		this.requestName = requestName;
		tLogic = new TestLogic();
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//sendRidirect
		return null;
	}

	@Override
	public ModelAndView process(String work, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException { //forward
		ModelAndView mav = new ModelAndView(req, res);
		logger.info(":::::::::::::::::: TestController ::::::::::::::::::");
		logger.info("work : " + work);
		Map<String, String> pMap = new HashMap<>();
		String abcd = req.getParameter("a");
		logger.info("쿼리스트링 중 a의 값 : " + abcd);
		pMap.put("abcd", abcd);
		String text = tLogic.tSelect(pMap);
		mav.addObject("text", text);
		mav.setViewName("/test/c.jsp");
		
		return mav;
	}

}
