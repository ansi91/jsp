package com.mvc3;

import java.util.Iterator;
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
		logger.info("boardList 호출 성공"+pMap.get("bm_no"));
		List<Map<String, Object>> bList = null;
		bList = sqlSes.selectList("boardList",pMap);
		logger.info("bList:"+bList.size());
		return bList;
	}
	public  List proc_boardList(Map<String, Object> pMap) {
		logger.info("boardList 호출 성공");
		List<Map<String,Object>> bList = null;
		sqlSes.selectOne("proc_boardList",pMap);
		bList = (List<Map<String,Object>>)pMap.get("key");
		logger.info("bList:"+bList.size());
		Iterator iter = bList.iterator();
		while(iter.hasNext()) {
			Map<String,Object> bVO2 = (Map<String,Object>)iter.next();
			logger.info("저자 : "+bVO2.get("BM_WRITER"));
		}
		return bList;
	}
	public int getBmNo(Map<String, Object> pMap) {
		logger.info("getBmNo 호출 성공");
		int bm_no = 0;
		bm_no = sqlSes.selectOne("getBmNo",pMap);
		logger.info("bm_no:"+bm_no);
		return bm_no;
	}
	public int getBmGroup(Map<String, Object> pMap) {
		logger.info("getBmGroup호출 성공");
		int bm_group = 0;
		bm_group = sqlSes.selectOne("getBmGroup",pMap);
		logger.info("bm_group:"+bm_group);
		return bm_group;
	}

	public int boardMINS(Map<String, Object> pMap) {
		logger.info("boardMINS 호출 성공");
		int result = 0;
		result = sqlSes.insert("boardMINS",pMap);
		logger.info("result:"+result);
		sqlSes.commit(true);
		return result;
	}
	
	public int bmStepUpdate(Map<String, Object> pMap) {
		logger.info("bmStepUpdate 호출 성공");
		int result = 0;
		result = sqlSes.update("bmStepUpdate",pMap);
		logger.info("result:"+result);
		sqlSes.commit(true);
		return result;
	}
	

	

	public int boardUPD(Map<String, Object> pMap) {
		logger.info("boardUPD 호출 성공");
		return 0;
	}

	public int boardDEL(Map<String, Object> pMap) {
		pMap.get("bm_pw");
		logger.info("boardDel 호출 성공");
		int result = 0;
		result = sqlSes.delete("boardDel",pMap);
		logger.info("result:::::::::::::::::::::::::::::::::::"+result);
		sqlSes.commit(true);
		return result;
	}

}
