package com.mvc3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.util.DBConnectionMgr;

public class Chart {

	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs  = null;
	DBConnectionMgr dbMgr = DBConnectionMgr.getInstance();
	
	public List<Map<String,Object>> ca(){
		StringBuilder sql = new StringBuilder();
		sql.append(" SELECT ename,sal FROM emp WHERE sal > 2000");
		List<Map<String,Object>> clist = new ArrayList<>();
		try{
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();
			Map<String,Object> cmap = null;
			while(rs.next()){
				cmap = new HashMap<>();
				cmap.put("ename", rs.getString("ename"));
				cmap.put("sal", rs.getInt("sal"));
				
				clist.add(cmap);
				
			}
			for(Map<String,Object> hha:clist) {
				System.out.println(hha);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return clist;
	}
	
	
	public List<Map<String,Object>> ca2(){
		StringBuilder sql = new StringBuilder();
sql.append("SELECT gubun_vc, sum(qty_nu) s   ");
sql.append(" FROM t_orderbasket             ");
sql.append(" WHERE indate_vc = '20040601'   ");
sql.append(" GROUP BY gubun_vc              ");
		List<Map<String,Object>> clist = new ArrayList<>();
		try{
			con = dbMgr.getConnection();
			pstmt = con.prepareStatement(sql.toString());
			rs= pstmt.executeQuery();
			Map<String,Object> cmap = null;
			while(rs.next()){
				cmap = new HashMap<>();
				cmap.put("gubun_vc", rs.getString("gubun_vc"));
				cmap.put("s", rs.getInt("s"));
				
				clist.add(cmap);
				
			}
			for(Map<String,Object> hha:clist) {
				System.out.println(hha);
			}
			
		}catch (Exception e){
			e.printStackTrace();
		}
		return clist;
	}
	
	
	public static void main(String[] args) {
	
		Chart c = new Chart();
		c.ca();
	}
}