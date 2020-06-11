
public class Main {
	public static void main(String[] args) {
		String url = "/context/controller/method.do";
		String url2= "/controller/method.do";
		String url3= "";
		String context ="/context";
		
		String controller = url.substring(context.length() + 1, url.lastIndexOf('/'));
		String method = url.substring(url.lastIndexOf('/') + 1, url.lastIndexOf('.'));
		System.out.println(controller);
		System.out.println(method);
		
		String uri = url2.substring(url3.length()+1);
		System.out.println("uri:::::::::::::"+ uri);
		String uri5 = uri.substring(0, uri.lastIndexOf('/'));
		String method2 = uri.substring(uri.lastIndexOf('/')+1,  uri.lastIndexOf('.'));
		System.out.println(uri5);
		System.out.println(method2);
		
	}
}
