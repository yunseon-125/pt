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
<%@ page import="java.net.URLEncoder" %>
<%
//new Cookie("쿠키변수명","값"); String typt만 가능
Cookie cookie=new Cookie("id", "kim");
Cookie cookie2=new Cookie("pwd", "1234");
//톰캣 하위 버전에서는 특수문자, 한글을 쓰면 에러가 나기 때문에 
//아래처럼 인코딩을 해야함
//Cookie cookie3=new Cookie("id", URLEncoder.encode("김철수","utf-8"));
Cookie cookie3=new Cookie("name","김철수");
Cookie cookie4=new Cookie("age","20");

//cookie.setMaxAge(10);//쿠키의 유효시간(10초), 10초후 삭제됨
response.addCookie(cookie);//응답헤더에 쿠키 추가
response.addCookie(cookie2);
response.addCookie(cookie3);
response.addCookie(cookie4);
%>
쿠키가 생성되었습니다.<br>
<a href="useCookie.jsp">쿠키 확인</a>

<!-- 만약 쿠키를 사용하지 않는다면 쿼리스트링으로 값을 보낼 수 있다. -->
<!-- <a href="useCookie.jsp?id=kim&pwd=1234&name=김철수&age=20">
쿠키 확인</a> -->
</body>
</html>