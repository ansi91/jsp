package jsp.ch09;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch09/LoginServlet.do")
public class LoginServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		String menu = null;
		menu = req.getParameter("menu");
		if(menu == null) {
			
			String mem_id = req.getParameter("mem_id");
			String mem_pw = req.getParameter("mem_pw");
			Cookie c_name = new Cookie("c_name","김유신");
			c_name.setPath("/");
			c_name.setMaxAge(-1);
			res.addCookie(c_name);
			res.sendRedirect("/ch09/main.jsp");
		}else if("logout".equals(menu)){
			Cookie c_name = new Cookie("c_name","");
			c_name.setPath("/");
			c_name.setMaxAge(0);
			res.addCookie(c_name);
			res.sendRedirect("/ch09/main.jsp");
			
		}
		
	}
	
}
