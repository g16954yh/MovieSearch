<%@page import="servlet.TimeSearch, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<String> result = (List<String>)request.getAttribute("result");
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>時間検索結果</title>
</head>
<body>
<h2><%= result.get(0) %>の上映時間</h2>
<% for(int i=1; i<result.size(); i++){%>
	<%= result.get(i) %>-
	<br>
<% } %>

</body>
</html>