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
<%@ include file="../include/header.jsp" %>

이름 : ${requestScope.items[0]}<br>
비번 : ${requestScope.items[1]}<br>
이메일 : ${requestScope.items[2]}<br>
HP : ${requestScope.items[3]}<br>
부서 : ${requestScope.items[4]}<br>

</body>
</html>