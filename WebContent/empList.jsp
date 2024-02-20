<%@page import="edu.sejong.ex.vo.EmpVO"%>
<%@page import="edu.sejong.ex.dao.EmpDao"%>
<%@page import="edu.sejong.ex.vo.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="edu.sejong.ex.dao.DeptDao"%>
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
 EmpDao empDao = new EmpDao();

List<EmpVO> etos = empDao.empList();
for(EmpVO evo : etos){
// 	out.print("부서번호 : " + evo.getEMPNO() +
//             ", 부서명 : " + evo.getENAME() + 
//             ", 지역 : " + evo.getJOB() +
//             ", 매니저번호 :"+evo.getMGR()+
//             ", 입사일 :"+evo.getHIREDATE()+
//             ", 임금 :"+evo.getSAL()+
//             ", COMM :"+evo.getCOMM()+
//             ", 부서번호 :"+evo.getDEPTNO()+ 
//              "<br>");	
	

}
	


%>
</body>
</html>