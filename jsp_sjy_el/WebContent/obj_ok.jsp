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
  String id = request.getParameter("id");
  String pw = request.getParameter("pw");
  %>
아이디:<%=id %><br/>
비번:<%=pw %>
<hr>
아이디:${param.id }<br/>
비번:${param.pw }<br/>
<hr>
아이디:${param["id"] }<br/>
비번:${param["pw"] }<br/>
<hr>
어플리케이션 스코프 ${applicationScope.application_name }<br/>
섹션 스코프 ${sessionScope.session_name }<br/>
페이지컨텍트 스코프 ${pageContextScope.pageContext_name }<br/>
리퀘스트 스코프 ${requestScope.request_name }


</body>
</html>