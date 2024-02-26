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
<h1>Front Controller 예제입니다.</h1>
<hr/>

<!-- http://localhost:8282/jsp_sjy_front/insert.do -->
<a href="insert.do">insert</a>
<hr/>
<!-- http://localhost:8282/insert.do -->
<a href="/insert.do">insert</a>
<hr/>

<a href="http://localhost:8282<%=request.getContextPath() %>/update.do">update</a>
<hr/>


<a href="http://localhost:8282{pageContext.request.contextPath}/select.do">select</a>

<hr/>

<a href="{pageContext.request.contextPath}/delete.do">delete</a>

<hr/>




</body>
</html>