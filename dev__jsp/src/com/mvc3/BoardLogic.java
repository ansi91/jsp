package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardLogic {
	Logger logger = Logger.getLogger(BoardLogic.class);
	BoardMDao bmDao = null;
	BoardSDao bsDao = null;
	public BoardLogic () {
		
		bmDao = new BoardMDao();
		bsDao = new BoardSDao();
	}
	
	
	public List<Map<String, Object>> boardList(Map<String, Object> pmap) {
		logger.info("boardList 호출 성공");
		List<Map<String,Object>> blist = null;
		blist = bmDao.boardList(pmap);
		return blist;
	}

	public int boardINS(Map<String, Object> pmap) {
		logger.info("boardINS 호출 성공");
		int result = 0;
		result = bmDao.boardMINS(pmap);
		return result;
	}

	public int boardUPD(Map<String, Object> pmap) {
		logger.info("boardUPD 호출 성공");
		int result = 0;
		result = bmDao.boardUPD(pmap);
		//첨부파일이 있을때만 bsDao.boardSINS(pmap);
		return result;
	}

	public int boardDEL(Map<String, Object> pmap) {
		logger.info("boardDEL 호출 성공");
		int result = 0;
		result = bmDao.boardDEL(pmap);
		//첨부파일이 있을때만 bsDao.boardSINS(pmap);
		return result;
	}
}
