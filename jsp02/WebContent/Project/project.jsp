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
	$("#btnLogin").click(function(){
		var param="userid="+$("#userid").val()
		+"&passwd="+$("#passwd").val();
		$.ajax({
			type: "post",
			url: "/jsp02/project_servlet/project.do",
			data: param,
			success: function(result){
				$("#result").html(result);
			}
		});
	});
});
</script>

<style type="text/css">
body {
	font: 16px"함초롱 바탕채";
	background-color: black;
}

footer{
	width: 1100px;
	padding: 20px 0;
	background-color: yellow;
	text-align: center;
	color: black;
	clear: both;
}

.container{
	position: absolute;
	width: 1100px;
	margin: 0 auto;
	background-color: #fff;
	border: 1px solid #e7e7e7;
}
header{
	position: relative;
	height: 450px;
	background-image: url(../images/fit1.jpg);
	background-repeat: no-repeat;
	background-position: left top;
}
header h1{
	position: absolute;
	right: 50px;
	bottom: 280px;
	font-size: 4em;
	color: blue;
	text-shadow: 0px 3px 2px #000;
}
header h2{
	position: absolute;
	right: 50px;
	bottom: 260px;
	font-size: 2em;
	color: yellow;
	text-shadow: 0px 2px 10px #000;
}
.navi{
	position: relative;
	background: black;
	margin-top: -15px;
	width: 1100px;
	height: 60px;
}
.navi ul{
	list-style: none;
	height: 40px;
	padding-top: 10px;
	padding-bottom: 5px;
}
.navi ul li{
	display: inline;
	float: left;
	font-size: 15px;
}
.navi a, .navi a:visited {
	padding: 10px 5px 5px 35px;
	display: block;
	color: #fff;
	width: 150px;
	text-decoration: none;
}
.navi a:hover .vavi a:active, .vavi a:focus{
	text-shadow: 0px 2px 2px #000;
	color: #fc0;
}
.sidebar{
	float: right;
	width: 250px;
	height:730px;
	background-color: gray;
	padding-top: 5px;
	padding-left: 10px;
	padding-right: 10px;
}
.sidebar img{
	margin-bottom: 2px;
	border: 1px solid #ccc;
	text-align: center;

}
.content{
	background-color: #ffffff;
	padding-top: 5px;
	padding-left: 10px;
	width: 720px;
	float: left;
}
header, section, footer, aside articel, figure{
	display: block;
}
.banner{
	margin: 0px 10px 15px 10px;
	padding: 0;
}
</style>

</head>
<body>

<div class="container">

<header>
<h1>SUNNY FIT</h1>
<h2>자신에게 건강함을 선물하세요☆</h2>
</header>

<nav class="navi">
<ul>
<li><a href="project-sunny.jsp">SUNNY FIT 소개</a></li>
<li><a href="list.jsp">후기(review)</a></li>
<li><a href="https://www.youtube.com/results?
search_query=%ED%97%AC%EC%8A%A4">운동영상</a></li>
<li><a href="https://www.google.co.kr/maps">오시는길</a></li>
<li><a href="projectmembership.jsp">☆회원 가입하기☆</a></li>
</ul>
</nav>

<br>
<h3>★로그인★</h3>
아이디 : <input id="userid"> <br>
비번 : <input type="password" id="passwd"> <br>
<button id="btnLogin">로그인</button>
<div id="result"></div>

<article>
<section class="content">
<h2>SUNNY FIT</h2>
<h3>운동을하면 삶 속에서 많은것들이 변화합니다.</h3>
<p>불필요한 지방을 태워줍니다!!</p>
<p>근력향상에 도움을 줍니다!!</p>
<p>신진대사가 활발해 집니다!!</p>
<p>스트레스해소엔 운동!!</p>
<p>숙면에 도움을 줍니다!!</p>

<div class="banner">
<img alt="SUNNY" src="../images/fit2.jpg" width="700" height="300">
</div>

</section>
</article>

<aside class="sidebar">
<h3>요즘 핫!한 소도구</h3>
<p>집에서도 간편하게<br>
운동하며 관리하자!</p>
<img alt="" src="../images/fit3.png" width="190">
<img alt="" src="../images/fit4.jpg" width="190">
<img alt="" src="../images/fit5.jpg" width="190">
</aside>

<footer>
<p>서울특별시 성북구 써니동</p>
<address>
예약문의 010-1234-1234<a href="mailto:sunny@gmail.com">sunny@gmail.com</a>
</address>
<p>사업자등록 번호:123-456789-1011   대표:써니</p>
</footer>

</div>
</body>
</html>