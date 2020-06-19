package com.mvc3;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class DeptDao {
	Logger logger = Logger.getLogger(DeptDao.class);
	SqlSessionFactory sqlMapper = null;
	SqlSession sqlSes = null;
	
	public DeptDao() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
		sqlSes = sqlMapper.openSession();
	}
	
	public List<Map<String, Object>> boardList(Map<String, Object> pMap) {
		logger.info("deptList 호출 성공");
		List<Map<String,Object>> dlist = null;
		dlist = sqlSes.selectList("deptList", pMap);
		return dlist;
	}

}
