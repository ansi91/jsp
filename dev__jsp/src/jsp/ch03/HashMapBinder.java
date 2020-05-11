package jsp.ch03;

import java.util.Enumeration;
import java.util.Map;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

public class HashMapBinder{

	/*
	 * 요청 객체는 사용자가 요청했을 때 요청을 받아주는 서블릿에서 주소번지를 받아와야 한다
	 * 그래야 그 사람에 대한 요청정보를 확인할 수 있는 것이다
	 * 이 말을 이해하고 설명 할수 있는지 확인 해보자
	 */
	
	HttpServletRequest req = null;
	public HashMapBinder() {}
	public HashMapBinder (HttpServletRequest req) {
		this.req = req;
	}
	
	public void binder(Map<String,Object> pmap) {
		
		pmap.clear(); //기존에 들어 있던 값이 있다면 모두 비운다
		Enumeration<String> en = req.getParameterNames();
		while(en.hasMoreElements()) { //enumeration에 값이 들어있는지 체크해 줌.
			String key = en.nextElement();// name, address, pet
			pmap.put(key, HangulConversion.toUTF(req.getParameter(key)));
			
		}
	}
	
}
