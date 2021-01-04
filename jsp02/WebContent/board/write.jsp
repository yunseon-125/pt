<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../include/header.jsp" %>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnSave").click(function(){
		document.form1.submit();
	});
});

</script>
</head>
<body>
<h2>글쓰기</h2>
<form name="form1" method="post" 
action="${path}/board_servlet/insert.do" enctype="multipart/form-data">
<table border="1" width="700px">
  <tr>
    <td>이름 </td>
    <td><input name="writer" id="wirter"> </td>
  </tr>
  <tr>
    <td>제목 </td>
    <td><input name="subject" id="subject" size="60"> </td>
  </tr>
  <tr>
    <td>본문 </td>
    <td><textarea rows="5" cols="60" name="content" id="content">
    </textarea> </td>
  </tr>
  <tr>
    <td>첨부파일 </td>
    <td><input type="file" name="file1" id="file1"> </td>
  </tr>
  <tr>
    <td>비밀번호 </td>
    <td><input type="password" name="passwd" id="passwd"> </td>
  </tr>
  <tr>
    <td colspan="2" align="center">
    <input type="button" value="확인" id="btnSave">
  </tr>
</table>
</form>

</body>
</html>