package com.mvc2;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.log4j.Logger;

public class DeptDAO {
	Logger log = Logger.getLogger(DeptDAO.class);
	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	
	public DeptDAO() {
		sqlMapper = MyBatisCommonFactory.getSqlSessionFactory();
	}
	
	public List<Map<String, Object>> deptList(Map<String, Object> pmap) {
		log.info("DAO:::::::deptList호출 성공");
		List<Map<String,Object>> dlist = new ArrayList<>();
		SqlSession sqlSes = sqlMapper.openSession();
		dlist = sqlSes.selectList("deptList", pmap);
		log.info("::::::::::::dlist:::::::::::" + dlist.size());
		return dlist;
	}

}
