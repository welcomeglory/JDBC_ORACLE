<%@page import="edu.sejong.ex.DeptVO"%>
<%@page import="java.util.List"%>
<%@page import="edu.sejong.ex.DeptDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	 <h1>Tag - gugudan</h1>
	 <table border="1">
	 	<c:forEach var="i" begin="1" end="9" >
	 		<tr>	
	<c:forEach var="j"  begin="2" end="9" >
	 <c:if test="${j%2==1 }"> 
	<td>	${j} x ${i} = ${i*j} 	</td>
	</c:if>
	</c:forEach> 
	</tr>
	</c:forEach> 
	</table>
	<%
DeptDao deptDao = new DeptDao();

List<DeptVO> dtos = deptDao.deptList();

pageContext.setAttribute("dtos", dtos);
for(DeptVO vo : dtos){
    
    out.print("부서번호 : " + vo.getDeptno() +
         " 직종이름 : " + vo.getDname() + 
         " 지역 : " + vo.getLoc() + "<br>");     
  }
%>
	<table border="1">
	 	<c:forEach var="dto" items="${dtos}" >
	 		<tr>	
	 		<td>부서번호 : ${dto.deptno}</td>
                <td>직종이름 : ${dto.dname }</td>
                <td>지역 : ${dto.getLoc()}</td>
	
	</tr>
	</c:forEach> 
	</table>
</body>
</html>



