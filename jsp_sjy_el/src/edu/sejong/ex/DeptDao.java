package edu.sejong.ex;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


/*Data Access Object*/

public class DeptDao{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url =  "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "scott";
	String pw = "tiger";
	
	public DeptDao() {
		try{
			//oracle.jdbc.driver.OracleDriver 객체 생성
			//oracle.jdbc.driver.OracleDriver oracleDriver = new oracle.jdbc.driver.OracleDriver()
			Class.forName(driver);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//db테이블 내용을 List에 저장
	public List<DeptVO> deptList(){
		List<DeptVO> depts = new ArrayList<>();
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql = "select * from dept";

		try {			
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int deptno = rs.getInt("deptno");
				String dname = rs.getString("dname");
				String loc = rs.getString("loc");
				
				DeptVO vo = new DeptVO(deptno,dname,loc);
				
				depts.add(vo);

			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(stmt!=null)
					stmt.close();
				if(con!=null)
					con.close();
			
			}catch (Exception e) {
				
			}
		}
	
		return depts;		
	}
}
