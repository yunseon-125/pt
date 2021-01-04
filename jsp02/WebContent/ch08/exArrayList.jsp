<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
</head>
<body>
<%
ArrayList<String> items = new ArrayList<>();
items.add(0, "kim");
items.add(1, "1234");
items.add(2, "kim@gmail.com");
items.add(3, "010-1234-5678");
items.add(4, "전산");
request.setAttribute("items", items);
%>
<jsp:forward page="exArrayList_result.jsp"></jsp:forward>
</body>
</html>