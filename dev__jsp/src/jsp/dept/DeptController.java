package jsp.dept;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class DeptController extends HttpServlet {
Logger logger = Logger.getLogger(DeptController.class);

	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		ActionForward af = new ActionForward();
		logger.info("DeptController 호출 성공");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
		String dept= req.getParameter("deptno");
		out.print(dept);
		logger.info(dept);
		DeptDao dDao = new DeptDao(); //jsonDeptList의 리턴값을 받기 위해 인스턴스화
		List<Map<String,Object>> deptList =null; 
		deptList = dDao.deptList(null);
		req.setAttribute("deptList", deptList);
		RequestDispatcher view =req.getRequestDispatcher("jsonDeptList.jsp"); //연결이 끊기지 않은채 URL유지하고 부분만 내용갱신하려면 디스패쳐를 쓴다
		view.forward(req, res);
		
	}
}
