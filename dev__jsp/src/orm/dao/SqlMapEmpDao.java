package orm.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.apache.log4j.Logger;

public class SqlMapEmpDao {
	Logger logger = Logger.getLogger(SqlMapEmpDao.class); 
	SqlSessionFactory sqlMapper = null;
	String resource = "orm/mybatis/Configuration.xml";
	//INSERT INTO emp VALUES(?,?,?,?,?,?,?,?);
	public int empINS(Map<String,Object> pmap) {
		int result =0;
		logger.info("empINS 호출");
		try {
			
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.insert("empINS",pmap);
			sqlSes.commit();
			logger.info("result" + result); //excuteUpdate():int
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	//사원 수정 구현하기
	public int empUPD(Map<String,Object> pmap) {
		int result =0;
		logger.info("empUPD호출");
		try {
			
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			result = sqlSes.update("empUPD",pmap);
			sqlSes.commit();
			logger.info("result" + result); //excuteUpdate():int
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	/*************************************************
	 * 
	 * sql문 DELETE FROM 테이블명 WHERE 컬럼명 IN(값)
	 * @return : int 
	 ***********************************************/
	
	
	//사원 삭제 구현하기
	public int empDEL(String empnos[]) {
		int result =0;
		logger.info("empDEL호출");
		try {
			
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			List<Integer> elist = new ArrayList<Integer>();
			for(int i=0; i<empnos.length;i++) {
				elist.add(Integer.parseInt(empnos[i]));
			}
			result = sqlSes.delete("empDEL",elist);
			sqlSes.commit();
			logger.info("result" + result); //excuteUpdate():int
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	
	public List<Map<String,Object>> empList(Map<String,Object> pmap){
		logger.info("empList 호출성공");

		/*
			logger.debug("empList 호출성공");
			logger.warn(message);
			logger.error(message); 
			logger.fatal(message);
		 */
		List<Map<String,Object>> elist = new ArrayList<Map<String,Object>>();
		
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			//sql문을 요청하기 위한 SqlSession객체 생성하기
			SqlSession sqlSes = sqlMapper.openSession();
			elist = sqlSes.selectList("empList",pmap);
			System.out.println("조회한 row 수" + elist.size());
		} catch (Exception e) {
			e.printStackTrace();
		}	
		return elist;
	}
	
	public static void main(String[] args) {
		SqlMapEmpDao smed = new SqlMapEmpDao();
		//smed.empList(null);
		Map<String,Object> pmap = new HashMap<>();
//		pmap.put("empno", 9009);
		int result = smed.empUPD(pmap);
		System.out.println(result);
		
		
		//sqlSes.commit(open);
	}
}
