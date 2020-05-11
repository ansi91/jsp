package jsp.ch03;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

public class ParameterServlet extends HttpServlet {
	Logger logger = Logger.getLogger(ParameterServlet.class);
	
	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		Map<String, Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.binder(pmap);
		Object keys[] = null;
		keys = pmap.keySet().toArray();
		for(int i=0; i<keys.length;i++) {
			
			logger.info(pmap.get(keys[i]));
		}
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)throws IOException, ServletException{
		Map<String, Object> pmap = new HashMap<>();
		HashMapBinder hmb = new HashMapBinder(req);
		hmb.binder(pmap);
		Object keys[] = null;
		keys = pmap.keySet().toArray();
		for(int i=0; i<keys.length;i++) {
			
			logger.info(pmap.get(keys[i]));
		}
	}
}
