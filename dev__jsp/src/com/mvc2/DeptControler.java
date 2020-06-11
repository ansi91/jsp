package com.mvc2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class DeptControler implements Controller {
	Logger log = Logger.getLogger(DeptControler.class);
	String crud = null;
	DeptLogic deptLogic = null;
	public DeptControler(String crud) {
		this.crud = crud;
		deptLogic = new DeptLogic();
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		log.info("process 호출성공, crud = " + crud);
		String path = "";
		if("deptList".equals(crud)) {
			List<Map<String,Object>> deptList = new ArrayList<Map<String,Object>>();
			Map<String,Object> pmap = new HashMap<String, Object>();
			req.setAttribute("deptList",deptList);
			path ="forward:/dept/dept.jsp";
		}
		
		
		return path;
	}

}
