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
<%
//전체 쿠기 삭제
Cookie[] cookies = request.getCookies();
if(cookies != null){
	for(int i=0; i<cookies.length; i++){
		//쿠키의 유효기간을 0으로 설정하여 만료시킨다.
		cookies[i].setMaxAge(0);
		//응답 헤더에 추가한다.
		response.addCookie(cookies[i]);
	}
}

//특정 쿠키만 삭제
/* Cookie cookie = new Cookie("id", "");
cookie.setMaxAge(0);
response.addCookie(cookie); */

%>
쿠키가 삭제되었습니다.
<a href="useCookie.jsp">쿠키 확인</a>
</body>
</html>