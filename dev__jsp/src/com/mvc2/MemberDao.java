package com.mvc2;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MemberDao {
	Logger logger = Logger.getLogger(MemberDao.class);
	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	public String login(Map<String,Object> pmap){
			String s_name = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			s_name = sqlSes.selectOne("login",pmap);
			logger.info("s_name :" + s_name);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return s_name; 
	}
	public List<Map<String, Object>> memberList(Map<String, Object> rmap) {
		logger.info("MemberDao memberList 호출 성공");
		List<Map<String,Object>> memList = null;
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			memList = sqlSes.selectList("memList",rmap);
			logger.info("memList :" + memList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memList;
	}
}
