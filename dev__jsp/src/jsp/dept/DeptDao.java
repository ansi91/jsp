package jsp.dept;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class DeptDao {
	SqlSessionFactory sqlMapper = null;
	
	public List<Map<String,Object>> deptList(Map<String,Object> pmap){
		List<Map<String,Object>> dlist = new ArrayList<>();
		
		String resource ="orm/mybatis/Configuration.xml";
		try {
			Reader reader =Resources.getResourceAsReader(resource);
			sqlMapper = new SqlSessionFactoryBuilder().build(reader);
			SqlSession sqlSes = sqlMapper.openSession();
			dlist =sqlSes.selectList("deptList",pmap);
			System.out.println("조회한 row수 " + dlist.size());
			
			
			for(int i=0; i<dlist.size(); i++) {
				System.out.println(dlist.get(i));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return dlist;
	}
	public static void main(String[] args) {
		DeptDao dd = new DeptDao();
		Map<String,Object> pmap = new HashMap<String, Object>();
		dd.deptList(pmap);
		
	}
}
