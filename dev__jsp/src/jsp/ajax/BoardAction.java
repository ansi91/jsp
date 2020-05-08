package jsp.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class BoardAction extends HttpServlet {
Logger logger = Logger.getLogger(BoardAction.class);

public void doService(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
	logger.info("doGet호출");
	String mem_id = getInitParameter("mem_id");
	logger.info(mem_id);
	ServletContext ctx = this.getServletContext();
	String driver = ctx.getInitParameter("driver");
	logger.info("Driver :" + driver);
	res.setContentType("text/html; charset=UTF-8");
	PrintWriter out = res.getWriter();
	out.print("서블릿에서 전송한 정보");
	
}
@Override
public void doGet(HttpServletRequest req,HttpServletResponse res)throws IOException, ServletException{
	doService(req,res);
 }//end of doGet

@Override
public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
 
}//end of doPost

}//end of boardAction

	
	

