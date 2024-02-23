<%@page import="edu.sejong.ex.Student"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL 리터널 표현식</h1>
문자열:${"홍길동" }<br>
문자열:<%="홍길동" %><br>
정수:${20}<br>
실수:${3.14}<br>
boolean:${true}, ${false}<br>
null:${null}<br><!-- 빈문자("")로 출력 -->
<%
int a=10;
String str = "하늘";
%>
<h1>EL과 스크립틀릿(익스프레션) 차이(중요)</h1>
변수 a출력:<%=a %><br>
EL a출력:${a}<br>
변수 str출력:<%=str %><br>
EL str출력:${str}

<h1>EL 표현식으로 값 꺼내기</h1>
<%
pageContext.setAttribute("sea","바다");
pageContext.setAttribute("scores",new int[]{90,80,70});

Map<String,Integer> map = new HashMap<>();
map.put("1",2);
map.put("2",3);
map.put("3",4);

session.setAttribute("map",map);


Student student = new Student();
student.setAge(10);
student.setName("홍길동");

pageContext.setAttribute("student",student);


%>
EL str출력:${sea}<br> 
EL scores출력:${scores[0]}<br>
EL scores출력:${scores[1]}<br>
EL scores출력:${scores[2]}<br>

EL map출력:${map["1"]}<br>
EL map출력:${map["2"]}<br>
EL map출력:${map["3"]}<br>

EL map출력:${student.age}<br>
EL map출력:${student.name}<br>

EL student출력:${student.getAge()}<br>
EL student출력:${student.getName()}<br>
EL student출력:${student.setName("홍길순")}<br>
EL student출력:${student.name}<br>



<h1>EL에서 null check</h1>
<%
pageContext.setAttribute("title","EL연산자");
%>
null체크${empty title}, ${empty "EL연산자" }


</body>
</html>