package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

import com.mvc2.MyBatisCommonFactory;

public class BoardMDao {
	Logger logger = Logger.getLogger(BoardMDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	public BoardMDao() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공");
		List<Map<String, Object>> bList = null;
		//bList라는 변수에 sqlSes의selectList라는 메소드를 실행하는데 매개변수(인자)로 스트링형인 "boardList" 와 Map형인 pMap을 넣는다.
		bList = sqlSes.selectList("boardList",pMap);
		logger.info("bList:"+bList.size());
		return bList;
	}

	public int boardMINS(Map<String, Object> pMap) {
		logger.info("boardMINS 호출 성공");
		return 0;
	}

	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD 호출 성공");
		return 0;
	}

	public int boardDEL(Map<String, Object> pMap) {
		logger.info("boardDEL 호출 성공");
		return 0;
	}

}
