package com.mvc3;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;

public class DeptLogic {
	Logger logger = Logger.getLogger(DeptLogic.class);
	DeptDao dDao = null;
	
	public DeptLogic() {
		dDao = new DeptDao();
	}
	
	public List<Map<String, Object>> deptList(Map<String, Object> pMap) {
		logger.info("deptList 호출 성공");
		List<Map<String, Object>> dlist = new ArrayList<>();
		dlist = dDao.boardList(pMap);
		return dlist;
	}

}
