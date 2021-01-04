<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
</head>
<body>

<c:forEach var="i" begin="2" end="9">
  <h2>${i}단</h2>
  <c:forEach var="j" begin="1" end="9">
    ${i} x ${j} = ${i * j}<br>
  </c:forEach>
</c:forEach>


</body>
</html>