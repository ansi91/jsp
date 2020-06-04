package com.mvc3;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BoardController implements Controller2020 {
	Logger logger = Logger.getLogger(BoardController.class);
	String requestName = null;
	BoardLogic bLogic = new BoardLogic();
	public BoardController(String requestName) {
		this.requestName = requestName; //유지|공유
	
	}
/*********************************************
 * @param ActionSupport에서 넘겨 준 주소번지를 사용함.
 * @return String
 * 예시) "redirect:XXX.jsp 하거나 forward:xxx.jsp" 하면 됨
 *********************************************/
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		logger.info("process:string 호출 성공");
		String path="";
		if("boardList".equals(requestName)) { //조회 버튼
			List<Map<String,Object>> mlist = null;
			Map<String,Object> pmap = new HashMap<>();
			mlist = bLogic.boardList(pmap);
			path = "foward:memberList.jsp";
			
		}else if ("boardINS".equals(requestName)) {
			int result=0;
			Map<String,Object> pmap = new HashMap<>();
			result = bLogic.boardINS(pmap);
			if(result==1) {
				path="redirect:boardINSOK.jsp";
			}else if(result==0) {
				path="redirect:boardINSFail.jsp";
			}
			
		}else if ("boardUPD".equals(requestName)) {
			int result=0;
			Map<String,Object> pmap = new HashMap<>();
			result = bLogic.boardUPD(pmap);
			if(result==1) {
				path="redirect:boardUPDOK.jsp";
			}else if(result==0) {
				path="redirect:boardUPDFail.jsp";
			}
	
		}else if ("boardDEL".equals(requestName)) {
			int result=0;
			Map<String,Object> pmap = new HashMap<>();
			result = bLogic.boardDEL(pmap);
			if(result==1) {
				path="redirect:boardDELOK.jsp";
			}else if(result==0) {
				path="redirect:boardDELFail.jsp";
			}
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
