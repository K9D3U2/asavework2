<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<style>
	*{
		margin: 0;
		padding: 0;
	}
	
	h1{
		margin-bottom: 10px;
	}

	li{
		list-style: none;
		display: inline-block;
		margin-right: 0;
		height: 80px;
	}

	a{
		text-decoration: none;
		display: inline-block;
		width: 150px;
		line-height: 80px;
		text-align: center;
		vertical-align: middle;
		background-color: yellow;
		font-size: 20px;
	}
	
	a:hover{
		text-decoration: underline;
		color: pink;
	}
</style>
<script>
	window.onload=function(){
		var back=document.getElementById("back");
		
		back.addEventListener("click", func);
	}
	
	function func(){
		history.go(-1);	
	}
</script>
</head>
<body>
	<h1>success</h1>
	<ul>
		<li><a href="#">모든ID조회</a></li>
		<li><a href="#" id="back">처음으로</a></li>
	</ul>
	<h2 id="loginInfo">
	</h2>
</body>
</html>