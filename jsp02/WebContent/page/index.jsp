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
//페이지 로딩 되자마자 자동으로 실행되는 코드
/* $(document).ready(function(){
	list();
}); */
$(function(){
	list('3');//1페이지란 뜻, 
});
function list(curPage){
	var param="curPage="+curPage;
	$.ajax({
		type: "post",
		url: "${path}/page_servlet/list.do",
		data: param,
		success: function(result){//콜백함수(서버의 응답 처리)
			$("#result").html(result);
		}
	});
}
</script>

</head>
<body>
<h2>페이지 나누기</h2>
<div id="result"></div>
</body>
</html>