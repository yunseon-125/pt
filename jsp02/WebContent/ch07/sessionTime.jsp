<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
</head>
<body>
<h2>세션의 유효 시간</h2>
<%
//1200초(20분)으로 변경
session.setMaxInactiveInterval(1200);//세션 유효시간값을 보는 메서드
int timeout=session.getMaxInactiveInterval();
out.println("세션의 유효시간:"+timeout); //초단위
%>
</body>
</html>