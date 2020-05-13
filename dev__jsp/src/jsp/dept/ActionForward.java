package jsp.dept;
/*
 * 페이지 이동과 흐름제어에 필요한 유틸
 */
public class ActionForward {
	private String path = null; //URL정보 req.getRequestURI()
	private boolean isRedirect = true; //true:redirect, false: forward
	
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public boolean isRedirect() {
		return isRedirect;
	}
	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
	

	
}
