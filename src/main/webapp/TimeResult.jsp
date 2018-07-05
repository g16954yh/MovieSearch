<%@page import="servlet.TimeSearch, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<String> result = (List<String>)request.getAttribute("result");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
	body{
		text-align: center;
	}
	h2{
		position: absolute;
		top: 10%;
		right: 0px;
		bottom: 0px;
		left: 0px;
		margin: auto;
		font-family: arial black;
	}
	.time{
		font-family: Microsoft Sans Serif;
	}
	.box{
		position: absolute;
		top: 30%;
		right: 0px;
		bottom: 0px;
		left: 0px;
		margin: auto;
	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>時間検索結果</title>
</head>
<body>
<h2><%= result.get(0) %></h2>
<br>
<div class = "box">
<div class = "time">
<% for(int i=1; i<result.size(); i++){%>
	<h3><%= result.get(i) %>-</h3>
	<br>
<% } %>
 </div>
</div>
</body>
</html>