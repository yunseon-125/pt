<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="../include/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btnJoin").click(function(){
		var userid=$("#userid").val();
		var passwd=$("#passwd").val();
		var name=$("#name").val();
		var email=$("#email").val();
		var hp=$("#hp").val();
		
		var param={"userid":userid, "passwd":passwd, "name":name,
				"email":email, "hp":hp};
		$.ajax({
			type: "post",
			url: "/jsp02/project_servlet/projectmembership.do",
			data: param,
			success: function(){
				alert("가입되었습니다.");
			}
		});
	});
});

</script>

<style type="text/css">
body {
background-image: url(../images/member.jpg);
}
.hoho{
	text-align: center;
	font-size: 2em;
	padding-top: 3em;
}
</style>

</head>
<body>
<div class="hoho">
<h1 style="color: purple;">회원가입</h1>
아이디 : <input id="userid"> <br>
비밀번호 : <input type="password" id="passwd"><br>
이름 : <input id="name"> <br>
이메일 : <input id="email"> <br>
휴대폰 : <input id="hp"> <br>
<button id="btnJoin">회원가입</button>
</div>
</body>
</html>