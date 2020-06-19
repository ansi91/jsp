package com.mvc3;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;



public class DeptContoller implements Controller2020 {
	Logger logger = Logger.getLogger(DeptContoller.class);
	String requestName = null;
	DeptLogic dlogic = null;
	 public DeptContoller(String requestName) {
		this.requestName = requestName;
		dlogic = new DeptLogic();
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String path =null;
		logger.info("String:::::::::::::::::::: process 호출성공" );
		if("deptList".equals(requestName)) {
			List<Map<String,Object>>dlist = null;
			Map<String,Object> pMap = new HashMap<>();
			dlist = dlogic.deptList(pMap);
			req.setAttribute("deptList", dlist);
			path = "forward:dept.jsp";
		}
		return path;
	}

	@Override
	public ModelAndView process(String work, HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		logger.info("process:ModelAndView 호출 성공");
		return null;
	}

}
