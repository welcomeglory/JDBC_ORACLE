<%@page import="edu.sejong.ex.Student"%>
<%@page import="java.util.ArrayList"%>
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
	<h1>Tag-out 태그</h1>
	<c:out value="welcome to jstl"></c:out><br/>
	<c:set var="data" value="my_data"></c:set>
	<c:out value="${data }"></c:out><br/>
	
	<c:set scope="session" var="name" >홍길동</c:set>
	
<%-- <c:set var="name" >홍길동</c:set> --%>
	<c:out value="${name }"></c:out><br/>
	<%
	int a=123;
	String name = "홍길동";
	//<c:set var="name" >홍길동</c:set>
	pageContext.setAttribute("name","홍길동");
	
	%>
<!-- setAttribute 약자-->	
    <c:set var="num" value="<%=a %>"></c:set>
	<c:out value="${num }"></c:out><br/>
	
	<c:set var="income" value="${400*900 }"/>
	인컴:<c:out value="${income }"/>
	
	<h1>Tag - set remove(변수삭제)</h1>
	<%pageContext.removeAttribute("income"); %>
	<c:remove var="income"/>
	인컴:<c:out value="${income }"/>
	
	<h1>Tag - 조건문</h1>
	<c:set var="salary" value="${100*100 }"/>
	<c:if test="${salary>100 }">
	<p>나의 봉급은 ${salary} 입니다.</p>
	</c:if>
	
	<c:if test="${empty income }">
	<p>수입이 없습니다.</p>
	</c:if>
	
	<h1>Tag - choose when</h1>
	<c:set var="grade" value="${50 }"/>
	<c:choose>
	<c:when test="${grade>=90 }">
	수입니다.
	</c:when>
	<c:when test="${grade>=80 }">
	우입니다.
	</c:when>
	<c:when test="${grade>=70 }">
	미입니다.
	</c:when>
	<c:otherwise>
	가입니다.
	</c:otherwise>
	</c:choose>
 <h1>Tag - 반복문</h1>
	<c:forEach var="i" begin="1" end="10">
	${i}<br>
	</c:forEach> 
	<hr>
	<%
	ArrayList<Student> list = new ArrayList<>();
	list.add(new Student(10,"홍길동"));
	list.add(new Student(15,"홍길순"));
	list.add(new Student(20,"바둑이"));
	list.add(new Student(30,"스미쓰"));
	
	pageContext.setAttribute("students",list);
	int [] intArr ={1,2,3,4,5};
	
	pageContext.setAttribute("intArr",intArr);
	
	%>
	<c:forEach var="student" items="${students}">
	나이: ${student.age}
	이름: ${student.name}<br>
	</c:forEach>
	<c:forEach var="num" items="${intArr}">
	번호:${num} <br>
	</c:forEach>
	<h1>Tag-토큰을 이용한 반복문</h1>
	<c:forTokens var="fruit" items="사과,포도,바나나,수박,딸기" delims="">
	과일:${fruit}<br>	
	</c:forTokens>
	
			
</body>
</html>



