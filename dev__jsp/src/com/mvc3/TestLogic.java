package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class TestLogic {
	Logger logger = Logger.getLogger(this.getClass());

	public String tSelect(Map<String, String> pMap){
		logger.info("TestLogic tSelect 호출 성공");
		String text = null;
		TestDao tDao = new TestDao();
		
		logger.info("쿼리스트링 중 abcd의 값 : " + pMap.get("abcd"));
		text = tDao.tSelect(pMap);
		
		return text;
	}		
}