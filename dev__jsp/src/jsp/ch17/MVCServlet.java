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
		String uri = req.getRequestURI(); // member/memberList.kosmo
		String context = req.getContextPath(); // server.xml의 context path root
		logger.info("uri :" + uri);
		logger.info("context :" + context);
		String command = uri.substring(context.length()+1);
		System.out.println(command.length() +" " + command);  
		logger.info("command :" +command);
		int end = command.lastIndexOf('.'); //order/orderList. 점 앞에 오는 숫자 갯수
		System.out.println("end :" +end);
		command = command.substring(0,end); 
		System.out.println("command:" + command); //
		String imsi[] = null;
		imsi = command.split("/");
		
		int i=0;
		  for(String val:imsi) { 
			  System.out.println(val);
			  
		  }
		 
		MemberController  memCtrl = 	new MemberController();
		OrderController   orderCtrl = 	new OrderController();
		ProductController productCtrl = new ProductController();
		if(imsi[0].equals("member")) { //split한 것이 member니?
			System.out.println("멤버 컨트롤 호출 성공");
			memCtrl.excute(req,res);
		}else if(imsi[0].equals("order")) {
			System.out.println("오다 컨트롤 호출 성공");
			orderCtrl.excute(req,res);
		}else if(imsi[0].equals("product")) {
			System.out.println("상품 컨트롤 호출 성공");
			productCtrl.excute(req,res);
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
