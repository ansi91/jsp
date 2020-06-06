package com.mvc3;

import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class TestDao {

	Logger logger = Logger.getLogger(this.getClass());
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public TestDao() {
		sqlMapper =  MyBatisCommonFactory.getSqlSessionFactory();
		 sqlSes = sqlMapper.openSession();
	}
	
	public String tSelect(Map<String, String> pMap) {
		logger.info("쿼리스트링 중 abcd의 값 : " + pMap.get("abcd"));
		logger.info("TestDao tSelect 호출 성공");
		List<Map<String,Object>> rList = null;
		String text = null;
		try {
			text = sqlSes.selectOne("testList",pMap);
			logger.info("text값 : " + text);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return text;
	}
}
