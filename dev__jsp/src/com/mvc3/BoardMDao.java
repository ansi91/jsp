package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class BoardMDao {
	Logger logger = Logger.getLogger(BoardMDao.class);
	public List<Map<String, Object>> boardList(Map<String, Object> pmap) {
		logger.info("boardList 호출 성공");
		return null;
	}

	public int boardMINS(Map<String, Object> pmap) {
		logger.info("boardMINS 호출 성공");
		return 0;
	}

	public int boardUPD(Map<String, Object> pmap) {
		logger.info("boardUPD 호출 성공");
		return 0;
	}

	public int boardDEL(Map<String, Object> pmap) {
		logger.info("boardDEL 호출 성공");
		return 0;
	}

}
