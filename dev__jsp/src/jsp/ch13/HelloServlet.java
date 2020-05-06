package jsp.ch13;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

public class HelloServlet extends HttpServlet {

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		res.setContentType("text/html; charset=utf-8");
		String mem_id= req.getParameter("mem_id");
		PrintWriter out =res.getWriter();
		out.println(mem_id);
	}
	
}
