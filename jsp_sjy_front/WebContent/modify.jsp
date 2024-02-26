<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>회원정보 수정페이지</h1>
	<form action="delete.do" method="post">
	 아이디:<input type="text" name="id"size="20"  value="${sessionScope.member.id}"><br> 
		패스워드 : <input type="password" name="pw"size="20"value="${sessionScope.member.pw}"><br> 
		이메일 : <input type="text" name="email" size="20" value="${sessionScope.member.email}"><br> 
		주소 : <input type="text" name="address"size="20"value="${sessionScope.member.address}"><br> 
		<%-- MemberDto member  = (MemberDto) session.getAttribute("member"); 
		아이디:<input type="text" name="id"size="20"  readonly value="<%= member.getId() %>"><br> 
		패스워드 : <input type="password" name="pw"size="20"value="<%=member.getPw() %>"><br> 
		이메일 : <input type="text" name="email" size="20" value="<%= member.getEmail() %>"><br> 
		주소 : <input type="text" name="address"size="20"value="<%= member.getAddress() %>"><br>  --%>
			
			<input type="submit"	value="수정" >
			<input type="reset" value="초기화">
	</form>
</body>
</html>