package edu.sejong.ex.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import edu.sejong.ex.vo.DeptVO;
import edu.sejong.ex.vo.EmpVO;

/*Data Access Object*/

public class EmpDao{
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url =  "jdbc:oracle:thin:@//localhost:1521/xe";
	String id = "scott";
	String pw = "tiger";
	
	public EmpDao() {
		try{
			//oracle.jdbc.driver.OracleDriver 객체 생성
			//oracle.jdbc.driver.OracleDriver oracleDriver = new oracle.jdbc.driver.OracleDriver()
			Class.forName(driver);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//db테이블 내용을 List에 저장
	public List<EmpVO> empList(){
		List<EmpVO> emps = new ArrayList<>();
		Connection con=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql = "select * from emp";

		try {			
			Class.forName(driver);
			con = DriverManager.getConnection(url, id, pw);
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int EMPNO = rs.getInt("EMPNO");;
				String ENAME= rs.getString("ENAME");
				String JOB= rs.getString("JOB");
				int MGR= rs.getInt("MGR");
				String HIREDATE= rs.getString("HIREDATE");
				int SAL= rs.getInt("SAL");
				int COMM= rs.getInt("COMM");
				int DEPTNO= rs.getInt("DEPTNO");
				
				EmpVO vo = new EmpVO(EMPNO,ENAME,JOB,MGR,HIREDATE,SAL,COMM,DEPTNO);
				
				emps.add(vo);

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
	
		return emps;		
	}
}
