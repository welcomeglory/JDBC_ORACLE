<%@page import="com.seoung.ex.dto.MemberDto"%>
<%@page import="com.seoung.ex.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

//요청 파라미터에서 "id"와 "pw"를 가져옵니다.
String id = request.getParameter("id");
String pw = request.getParameter("pw");

//MemberDao 객체를 생성합니다.
MemberDao dao = new MemberDao();

//사용자 인증을 확인합니다.
int check = dao.userCheck(id, pw);

//만약 사용자 인증이 성공했다면
if( check == MemberDao.MEMBER_LOGIN_SUCCESS ){
 // 해당 아이디의 회원 정보를 가져옵니다.
 MemberDto member = dao.getMember(id);
 // 세션에 회원 정보를 저장합니다.
 session.setAttribute("member", member);
 // "main.jsp" 페이지로 리다이렉트합니다.
 response.sendRedirect("main.jsp");
//만약 사용자 인증이 실패했다면
}else if(check ==  MemberDao.MEMBER_LOGIN_FAIL){
 // "login.jsp" 페이지로 리다이렉트합니다.
 response.sendRedirect("login.jsp");
}

%>

	
</body>
</html>