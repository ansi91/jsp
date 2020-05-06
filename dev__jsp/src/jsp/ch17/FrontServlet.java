package jsp.ch17;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebServlet(urlPatterns="/ch17/shopping.do")
public class FrontServlet extends HttpServlet {
	Logger logger = Logger.getLogger(FrontServlet.class);
	
	public void doService(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out =res.getWriter();
		
	
		String mode = req.getParameter("mode"); 	//url pattern -> shopping.do?mode=order
		
		if("order".equals(mode)) {//주문관리 인지?
			out.println("주문관리");
			System.out.println("주문관리");
			logger.info("주문관리");
			res.sendRedirect("./orderList.jsp");
		}else if("member".equals(mode)) {		//회원관리 인지?
			out.println("회원관리");
			logger.info("회원관리");
		}
	}
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
	
		doService(req,res);
		
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		
	}
	
}
