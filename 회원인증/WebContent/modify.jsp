<%@page import="com.seoung.ex.dto.MemberDto"%>
<%@page import="com.seoung.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String id = (String)session.getAttribute("id");
MemberDao dao = new MemberDao();
MemberDto dto = dao.getMember(id);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">n 
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정페이지</h1>
	<form action="modify_ok.jsp" method="post">
	아이디:<%=dto.getId()%><br/>
		패스워드 : <input type="password" name="pw"size="20"><br> 
		이메일 : <input type="text" name="email" size="20" value="<%=dto.getEmail()%>"><br> 
		주소 : <input type="text" name="address"size="20"value="<%=dto.getAddress()%>"><br> 
			<input type="button"	value="수정" >
			<input type="reset" value="취소"onclick=javascript:window.location="login.jsp">
	</form>
</body>
</html>