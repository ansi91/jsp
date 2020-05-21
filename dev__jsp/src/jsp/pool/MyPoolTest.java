package jsp.pool;


import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MyPoolTest {
	
  public static void main(String[] args) {
	try {
		InitialContext ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/dbPool");
		System.out.println(ds);
	} catch (Exception e) {
		e.printStackTrace();
	}	
  }
}
