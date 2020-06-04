package com.mvc3;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import com.mvc3.ModelAndView;

public class MemberController3 implements Controller2020 {
	Logger logger = Logger.getLogger(MemberController3.class);
	String cud = null;
	MemberLogic3 memLogic = null;
	public MemberController3(String cud) {
		this.cud = cud;
		memLogic = new MemberLogic3();
	}
	@Override
	public ModelAndView process(String requestName,HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException {
		logger.info("process 호출 성공[ModelAndView], requestName:"+requestName);
		ModelAndView mav = new ModelAndView(req,res);
		mav.setViewName(requestName);
		if("member/memberList".equals(requestName)) {
			//res.sendRedirect(req.getContextPath()+"/"+requestName+".jsp");
			mav.setViewName("/member/memberList3.jsp");
			//return null;
		}
		else if("zipcodeList".equals(requestName)) {
			return null;
		}
		
		return mav;
	}
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException,IOException  {
		logger.info("process[String] 호출 성공, crud:"+cud);
		String path = "";
		if("login".equals(cud)){
			String u_id = req.getParameter("mem_id");
			String u_pw = req.getParameter("mem_pw");
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("mem_id",u_id);
			String s_name = memLogic.login(pMap);
			HttpSession session = req.getSession();
			session.setAttribute("s_name", s_name);
			return "forward:mapDesign4.jsp";
		}
		else if("memberList".equals(cud)) {
			List<Map<String,Object>> memList = null;
			Map<String,Object> pMap = new HashMap<>();
			memList = memLogic.memberList(pMap);
			if(memList==null) {
				memList = new ArrayList<>();//memList.size()=0
			}
			req.setAttribute("memList", memList);
			path = "forward:/member/memberList.jsp";
		}
		else if("memberAdd".equals(cud)) {
			int result = 0;//1이면 등록 성공, 0이면 실패
			Map<String,Object> pMap = new HashMap<>();
			pMap.put("mem_id",req.getParameter("mem_id"));
			pMap.put("mem_name",req.getParameter("mem_name"));
			pMap.put("mem_pw",req.getParameter("mem_pw"));
		//pMap.put("mem_addr",req.getParameter("mem_addr"));
		//	pMap.put("mem_zipcode",req.getParameter("mem_zipcode"));
			result = memLogic.memberAdd(pMap);
			path = "redirect:/member/member.mvc3?cud=memberList";
		}
		return path;
	}

}





