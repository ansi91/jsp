package com.mvc2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

public class MemberController implements Controller {
	Logger logger = Logger.getLogger(MemberController.class);
	String crud = null;
	MemberLogic memLogic = null;
	public MemberController(String crud) {
		this.crud = crud;
		memLogic = new MemberLogic();
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		logger.info("process 호출 성공, crud:"+crud);
		String path = "";
		if("login".equals(crud)){
			String u_id = req.getParameter("mem_id");
			String u_pw = req.getParameter("mem_pw");
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("mem_id",u_id);
			String s_name = memLogic.login(pMap);
			HttpSession session = req.getSession();
			session.setAttribute("s_name", s_name);
			return "forward:mapDesign3.jsp";
		}
		else if("memberList".equals(crud)) {
			List<Map<String,Object>> memList = null;
			Map<String,Object> pMap = new HashMap<>();
			memList = memLogic.memberList(pMap);
			if(memList==null) {
				memList = new ArrayList<>();//memList.size()=0
			}
			
			
			req.setAttribute("memList", memList);
			path = "forward:/member/memberList.jsp";
		}
		
		else if("memberList".equals(crud)) {
			int result=0;
			Map<String,Object>pmap = new HashMap<>();
			pmap.put("mem_id", req.getParameter("mem_id"));
			pmap.put("mem_name", req.getParameter("mem_name"));
			pmap.put("mem_pw", req.getParameter("mem_pw"));
			//pmap.put("mem_zipcode", req.getParameter("mem_zipcode"));
			//pmap.put("mem_addr", req.getParameter("mem_addr"));
			result = memLogic.memberAdd(pmap);
			path="redirect:/member/member.mvc2?crud=memberList";
		}
		return path;
	}

}
