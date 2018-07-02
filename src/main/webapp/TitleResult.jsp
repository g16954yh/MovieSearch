<%@page import="servlet.TitleSearch, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<List<String>> result = (List<List<String>>)request.getAttribute("result");
List<String> value = (List<String>)request.getAttribute("value");

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>作品検索結果</title>
</head>
<body>
<h2>上映作品</h2>
検索対象:
<% for(int i=0; i<value.size(); i++){ %>
<%= value.get(i) %>
<% } %>
<br>
<br>
<% for(List<String> list: result){ %>
	<% for(int i=0; i<list.size(); i=i+2){%>
		<%= list.get(i) %>   <%= list.get(i+1) %>
		<br>
	<% } %>
<% } %>

</body>
</html>