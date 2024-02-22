<%@page import="com.seoung.ex.dto.MemberDto"%>
<%@page import="com.seoung.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>로그인 OK 페이지</h1>
	<%
//요청의 문자 인코딩을 "UTF-8"로 설정합니다.
request.setCharacterEncoding("UTF-8");

//요청 파라미터에서 사용자의 아이디(id), 비밀번호(pw), 이메일(email), 주소(address)를 가져옵니다.
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String email = request.getParameter("email");
String address = request.getParameter("address");

//MemberDto 객체를 생성하여 사용자 정보를 담습니다.
MemberDto member = new MemberDto(id, pw, email, address);

//MemberDao 객체를 생성합니다.
MemberDao dao = new MemberDao();

//회원 정보를 데이터베이스에 삽입하고 결과를 받습니다.
int result = dao.insertMember(member);
System.out.println(result);

//회원 정보 삽입이 실패한 경우
if(result == 0 ){			
 // "join.jsp" 페이지로 리다이렉트합니다.
 response.sendRedirect("join.jsp");
//회원 정보 삽입이 성공한 경우
}else if(result > 0){
 // 세션에 회원 정보를 저장합니다.
 session.setAttribute("member", member);		
 // "main.jsp" 페이지로 리다이렉트합니다.
 response.sendRedirect("main.jsp");
}

	
%>


</body>
</html>