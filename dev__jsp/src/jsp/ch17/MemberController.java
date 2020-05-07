package jsp.ch17;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class MemberController {
	Logger logger = Logger.getLogger(MemberController.class);
	MemberDao mdao = new MemberDao();
	public void excute(HttpServletRequest req, HttpServletResponse res) {
		logger.info("excute 호출");
	//회원가입
	if(1==1) {
		
	}
	//회원조회
	else if(1==1) {
		
		//회원탈퇴
	}else if(1==1) {
		
		//회원 수정
	}else if(1==1) {
		
	}

 }
}