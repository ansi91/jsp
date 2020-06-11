package com.mvc2;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class DeptLogic {
	Logger log = Logger.getLogger(DeptLogic.class);
	DeptDAO dDao = new DeptDAO();
	
	public List<Map<String,Object>> deptList(Map<String,Object> pmap){
		List<Map<String,Object>> deptList = null;
		log.info("DeptLogic deptList 호출 성공");
		deptList = dDao.deptList(pmap);
		
	}
	
}
