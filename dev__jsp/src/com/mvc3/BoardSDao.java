package com.mvc3;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class BoardSDao {
	Logger logger = Logger.getLogger(BoardSDao.class);
	SqlSessionFactory sqlMapper = null; // SqlSession은 사용 할 수 있게 도와주는 친구
	SqlSession 				   sqlSes = null; //실제 DB를 옮겨줌
	
	public BoardSDao () {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public int boardINS(Map<String, Object> pmap) {
		logger.info("boardSINS 호춝성공");
		int result = 0;
		
		return result;
	}
	public int boardSINS(Map<String, Object> pMap) {
		logger.info("BoardSINS 호출성공");
		int result = 0;
		result = sqlSes.insert("boardSINS",pMap);
		logger.info("result:"+result);
		sqlSes.commit(true);
		return 0;
	}

}
