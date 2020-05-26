package chap08;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MemberController implements Controller {
	Logger logger = Logger.getLogger(MemberController.class);
	String crud = null;
	
	public MemberController(String crud) {
		this.crud = crud;
	}
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException {
		logger.info("process 호출 성공");
		if ("login".equals(crud)) {
			
		}else if ("memberInsert".equals(crud)) {
			
		}
		return "forward:memberList.jsp"; 
	}

}
