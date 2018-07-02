<%@page import="servlet.Top, java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%
List<String> titleList = (List<String>)request.getAttribute("titleList");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
	body{
		text-align: center;
	}
	h1{
		font-family: arial black;
	}
	h4{
		font-family: Tahoma;
	}
	h5{
		font-family: Microsoft Sans Serif;
	}
	.combo {
		overflow: hidden;
		width: 50%;
		margin: 2em auto;
		text-align: center;
	}
	.combo select {
		width: 100%;
		padding-right: 1em;
		cursor: pointer;
		text-indent: 0.01px;
		text-overflow: ellipsis;
		border: none;
		outline: none;
		background: transparent;
		background-image: none;
		box-shadow: none;
		-webkit-appearance: none;
		appearance: none;
	}
	.combo select::-ms-expand {
		display: none;
	}
	.combo.x {
		position: relative;
		border-radius: 2px;
		border: 2px solid #da3c41;
		background: #ffffff;
	}
	.combo.x::before {
		position: absolute;
		top: 0.8em;
		right: 0.8em;
		width: 0;
		height: 0;
		padding: 0;
		content: '';
		border-left: 6px solid transparent;
		border-right: 6px solid transparent;
		border-top: 6px solid #da3c41;
		pointer-events: none;
	}
	.combo.x select {
		padding: 8px 38px 8px 8px;
		color: #da3c41;
	}
	input[type="submit"]{
		display: inline-block;
    	padding: 0.3em 1em;
    	text-decoration: none;
    	color: white;
    	border: solid 3px black;
    	border-radius: 12px;
    	transition: .4s;
    	background: black;
    	font-family: Microsoft Sans Serif;
    	font-size: 14px;
    	
	}
	input[type="submit"]:hover{
		background: white;
    	color: black;
	}
	.check {
		-webkit-box-sizing: border-box;
		box-sizing: border-box;
	}
	.check:before, .check:after {
		-webkit-box-sizing: inherit;
		box-sizing: inherit;
	}
	.check .box {
		margin: 2em auto;
		border: 1px solid white;
		border-radius: 3px;
		background: #ffffff;
		text-align: left;
		margin-left: 30%;
        margin-right: 30%;
	}
	.check input[type="checkbox"] {
		display: none;
	}
	.check label:focus,
	.check label:hover,
	.check label:active,
	.check input:checked + label {
		color: #da3c41;
	}
	.check label:focus:before,
	.check label:hover:before,
	.check label:active:before,
	.check input:checked + label:before {
		border-color: #da3c41;
		background: #ffffff;
	}
	.check label {
	 	font-family: Microsoft Sans Serif;
		font-size: 1em;
		font-weight: bold;
		line-height: 1;
		position: relative;
		display: block;
		overflow: hidden;
		padding: 1em 1em 1em 3em;
		cursor: pointer;
		-webkit-transition: all 0.15s ease;
		transition: all 0.15s ease;
		white-space: nowrap;
		text-overflow: ellipsis;
		background: #ffffff;
	}
	.check label:before {
		position: absolute;
		top: 1em;
		left: 1em;
		width: 10px;
		height: 10px;
		content: '';
		border: 0.2em solid #cccccc;
	}
	.check input:checked + label:before {
		border-color: #da3c41;
		background: #da3c41;
	}
	.box1 {
        border:1px solid black;
        margin-left: 20%;
        margin-right: 20%;
 	}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>映画情報検索</title>
</head>
	<body>
		<h1>Movie Search</h1>
		<br>
		<br>
		<div class="box1">
 		<h4>上映開始時間から作品を検索</h4>
        <form action="/TitleSearch" method="post">
        	<div class = "check">
        		<div class = "box">
        			<input type = "checkbox" name = "time" value = "09" id = "check0" checked> <label for="check0">9:00-10:59</label>
        			<input type = "checkbox" name = "time" value = "11" id = "check1"> <label for="check1">11:00-12:59</label>
        			<input type = "checkbox" name = "time" value = "13" id = "check2"> <label for="check2">13:00-14:59</label>
        			<br>
        			<input type = "checkbox" name = "time" value = "15" id = "check3"> <label for="check3">15:00-16:59</label>
        			<input type = "checkbox" name = "time" value = "17" id = "check4"> <label for="check4">17:00:18:59</label>
        			<input type = "checkbox" name = "time" value = "19" id = "check5"> <label for="check5">19:00-20:59</label>
        			<input type = "checkbox" name = "time" value = "21" id = "check6"> <label for="check6">21:00-</label>
        		</div>
        	</div>
        	<br>
        	<input type="submit" id="button" value="作品検索"> 
        	<br>
        	<br>
        	<br>
        </form>
        </div>
        <br>
        <br>
        <div class ="box1">
        <h4>作品の上映時間を検索</h4>
        <br>
        <h5>現在公開中の作品</h5>
        <form action="/TimeSearch" method="post">
        	<div class = "combo x">
        		<select name = "movie">
        			<% for(int i=0; i<13; i++){ %>
        			<option value= "<%= i %>"><%= titleList.get(i) %></option>
        			<% } %>
        		</select>
        	</div>
        	<br>
        	<br>
        	<input type="submit" id="button" value="時間検索">    
        </form>
        <br>
        <br>
        <br>
        </div>
        
	</body>
</html>