<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
 Connection connection;
Statement statement;
ResultSet rs;

String driver = "oracle.jdbc.driver.OracleDriver";
String url =  "jdbc:oracle:thin:@//localhost:1521/xe";
String id = "scott";
String pw = "tiger";

String sql = "select  empno, ename, job, mgr, HIREDATE, SAL, comm, DEPTNO from emp";
try{
	Class.forName(driver);
	connection = DriverManager.getConnection(url, id, pw);
	statement = connection.createStatement();
	rs = statement.executeQuery(sql);
	
	while(rs.next()){
		int EMPNO= rs.getInt("EMPNO");
		String ENAME= rs.getString("ENAME");
		String JOB= rs.getString("JOB");
		int MGR= rs.getInt("MGR");
		String HIREDATE= rs.getString("HIREDATE");
		int SAL= rs.getInt("SAL");
		int COMM= rs.getInt("COMM");
		int DEPTNO= rs.getInt("DEPTNO");
		
		out.print("부서번호 : " + EMPNO +
	            ", 부서명 : " + ENAME + 
	            ", 지역 : " + JOB +
	            ", 매니저번호 :"+MGR+
	            ", 입사일 :"+HIREDATE+
	            ", 임금 :"+SAL+
	            ", COMM :"+COMM+
	            ", 부서번호 :"+DEPTNO+ 
	             "<br>");
	}
}catch(Exception e){
	
}
%>
</body>
</html>