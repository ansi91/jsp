package jsp.ch17;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;


public class MVCServlet extends HttpServlet {
	Logger logger = Logger.getLogger(FrontServlet.class);
	ServletConfig config = null;
	public void init(ServletConfig config) throws ServletException{
		this.config = config;
		this.init();
	}
	public void doService(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		logger.info("doService 호출 성공" );
		MemberController memCtrl = new MemberController();
		memCtrl.excute(req,res);
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
	
		
		
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
	}
	
}
