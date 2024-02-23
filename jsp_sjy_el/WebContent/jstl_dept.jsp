<%@page import="edu.sejong.ex.DeptVO"%>
<%@page import="edu.sejong.ex.DeptDao"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.*"%>
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
<%
      DeptDao deptDao = new DeptDao();       
        List<DeptVO> dtos = deptDao.deptList();
        
       pageContext.setAttribute("dtos", dtos);        
%>
   <table border="1">
      <c:forEach var="dto" items="${dtos}">
         <tr>            
               <td>부서번호 : ${dto.deptno}</td>
                <td>직종이름 : ${dto.dname }</td>
                <td>지역 : ${dto.getLoc()}</td>
         </tr>
      </c:forEach>
  </table>
</body>
</html>