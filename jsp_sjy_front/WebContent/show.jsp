<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>show.jsp입니다.</h1>
<hr>
        id : <%=request.getAttribute("id")%><br/>
        pw : <%=request.getAttribute("pw")%>
		
		<hr>
		id:${id}<br/>
		pw:${pw}<br/>
</body>
</html>