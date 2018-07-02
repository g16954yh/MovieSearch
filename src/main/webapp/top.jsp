<%@page import="servlet.Top, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
List<String> titleList = (List<String>)request.getAttribute("titleList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>映画情報検索</title>
</head>
<body>
 <h1>上映開始時間から作品を検索</h1>
        <form action="/TitleSearch" method="post">
        <input type = "checkbox" name = "time" value = "09"> 9:00-10:59
        <input type = "checkbox" name = "time" value = "11"> 11:00-12:59
        <input type = "checkbox" name = "time" value = "13"> 13:00-14:59
        <br>
        <input type = "checkbox" name = "time" value = "15"> 15:00-16:59
        <input type = "checkbox" name = "time" value = "17"> 17:00:18:59
        <input type = "checkbox" name = "time" value = "19"> 19:00-20:59
        <input type = "checkbox" name = "time" value = "21"> 21:00-
        <br>
        <input type="submit" id="button" value="作品検索"> 
        </form>
        
        <h1>作品の上映時間を検索</h1>
        現在公開中の作品　
        <form action="/TimeSearch" method="post">
        <select name = "movie">
        <% for(int i=0; i<13; i++){ %>
        <option value= "<%= i %>"><%= titleList.get(i) %></option>
        <% } %>
        </select>
        <br>
        <input type="submit" id="button" value="時間検索">    
        </form>
        
</body>
</html>