package jsp.dept;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
@WebServlet(urlPatterns="/dept/deptList.km")
public class DeptControllerVer2 extends HttpServlet {
	Logger logger = Logger.getLogger(DeptController.class);	
	
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException {
		ActionForward af = new ActionForward();
		logger.info("DeptController 호출 성공");
		 
		DeptDao dDao = new DeptDao(); //jsonDeptList의 리턴값을 받기 위해 인스턴스화
		List<Map<String,Object>> deptList =null; 
		deptList = dDao.deptList(null);
		req.setAttribute("deptList", deptList);
		af.setRedirect(false); //redirect:true sendRedirect, redirect:false forward
		af.setPath("jsonDeptList.jsp");
		if(af!=null) {
			if(af.isRedirect()) {
				res.sendRedirect(af.getPath());
			}else {
				RequestDispatcher view = req.getRequestDispatcher(af.getPath());
				view.forward(req, res);
			}
			
		}
		
		
		
	}
}
