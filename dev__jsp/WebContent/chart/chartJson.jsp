<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.JSONObject"%>
<%
    //커넥션 선언
    Connection con = null;
	 String _driver = "oracle.jdbc.driver.OracleDriver";
	 	 String _URL = "jdbc:oracle:thin:@127.0.0.1:1521:orcl11";
		
		 String _USER = "scott";
		 String _PW = "tiger";	
    try {
        //드라이버 호출, 커넥션 연결
        Class.forName(_driver);
        con = DriverManager.getConnection(_URL,_USER,_PW);	
 
        //ResultSet : 쿼리문에 대한 반환값
        ResultSet rs = null;
 
        //DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값
        List barlist = new LinkedList();
 
      
 
        String query = "SELECT * FROM dept";
        PreparedStatement pstm = con.prepareStatement(query);
 
        rs = pstm.executeQuery();
        
        //ajax에 반환할 JSON 생성
        JSONObject responseObj = new JSONObject();
        JSONObject barObj = null;
        
        //소수점 2번째 이하로 자름
     //	   DecimalFormat f1 = new DecimalFormat("");
        //rs의 다음값이 존재할 경우
        while (rs.next()) {
          	int deptno = rs.getInt("deptno");
            String dname = rs.getString("dname");
           String loc = rs.getString("loc");
            barObj = new JSONObject();
            barObj.put("deptno", deptno);
            barObj.put("dname", dname);
            barObj.put("loc", loc);
            barlist.add(barObj);
        }
 
        responseObj.put("dept", barlist);
        out.print(responseObj.toString());
 
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (con != null) {
            try {
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
 
    }
%>