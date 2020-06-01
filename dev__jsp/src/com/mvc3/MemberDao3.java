package com.mvc3;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class MemberDao3 {
	Logger logger = Logger.getLogger(MemberDao3.class);
	String resource = "orm/mybatis/Configuration.xml";
	SqlSessionFactory sqlMapper = null;
	
	public MemberDao3() {
		sqlMapper =  MyBatisCommonFactory.getSqlSessionFactory();
		
		}
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
		
			SqlSession sqlSes = sqlMapper.openSession();
			memList = sqlSes.selectList("memberList",rmap);
			logger.info("memList :" + memList.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memList;
	}
	public int memberAdd(Map<String, Object> pmap) {
		int result=0;
		logger.info("MemberDao memberAdd 호출 성공");
		try {
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("memberAdd",pmap);
			logger.info("result" + result);
			sqlSes.commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
