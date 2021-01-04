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
<%-- <h2>Java 코드</h2>
<%@ page import="java.util.Enumeration" %>
<%
//request 객체의 헤더 변수 집합
//getHeaderNames()는 일반 for문으로 못돌리기 때문에 Enumeration과
//while문으로 씀
Enumeration<String> headerNames=request.getHeaderNames();
while(headerNames.hasMoreElements()){//다음 요소가 있으면
	String key=(String)headerNames.nextElement();//다음 값을 읽음
	String value=request.getHeader(key);//헤더값 조회
	out.println(key+":"+value+"<br>");
}
%> --%>

<h2>JSTL 코드</h2>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="h" items="${header}">
  ${h.key} => ${h.value}<br>
</c:forEach>
<hr>
<!-- set var="변수명" value="값" scope="사용영역"
사용영역 : page < request < session < application
User-Agent: 웹브라우저 및 운영체제 정보
 -->
<c:set var="browser" value="${header['user-agent']}" scope="page" />

<!-- 출력문 -->
<c:out value="${browser}" />
${browser} <!-- 위 코드와 같다 -->
<hr>
<c:remove var="browser"/> <!-- java의 removeAttribute() 대체 -->
<c:out value="${browser}" />

</body>
</html>