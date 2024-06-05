<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${path}/resources/css/default/header.css"/>
</head>
<body>
	<div class="flex-container">
		<div class="flex-sub-container-1">
			<div class="flex-item">
				<a href="#">tag1</a>
			</div>
			<div class="flex-item">
				<a href="#">tag2</a>
			</div>
		</div>
		<div class="flex-item-title">
			<a href="/root/main/mainPage1">Tabel HUB</a>
		</div>
		<div class="flex-sub-container-2">
			<div class="flex-item">
				<a href="#">tag3</a>
			</div>
			<div class="search">
				<input type="text" placeholder="search for..">
				<img class="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
			</div>
		</div>
		
	</div>
</body>
</html>






