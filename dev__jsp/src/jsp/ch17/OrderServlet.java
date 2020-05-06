package jsp.ch17;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@WebServlet(urlPatterns="/ch17/order.do")
public class OrderServlet extends HttpServlet {
	Logger logger = Logger.getLogger(OrderServlet.class);
	
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
	
		logger.info("doGet 메소드 호출");
		String mem_name = req.getParameter("mem_name");
		logger.info("입력한 사람은? " + mem_name);
		java.util.List<Map<String,Object>> olist = new ArrayList<>();
		Map<String, Object> rmap = new HashMap<>();
		rmap.put("deptno", 10);
		rmap.put("dname","개발부");
		rmap.put("loc", "인천");
		olist.add(rmap);
		req.setAttribute("olist", olist);
		RequestDispatcher view = req.getRequestDispatcher("./orderList.jsp");
		view.forward(req, res);
	}
	
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		logger.info("doPost 메소드 호출");
		String mem_name = req.getParameter("mem_name");
		logger.info("입력한 사람은? " + mem_name);
	}
	
}
