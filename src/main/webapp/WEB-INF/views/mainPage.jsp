<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>
	Hello world! main 페이지 입니다!
</h1>
<button type="button" onclick="main">main</button>
	<c:choose>
		<c:when test="${userId != null}">
			<a href="/root/member/logout">로그아웃</a>
		</c:when>
		<c:otherwise>
			<a href="/root/member/login">로그인</a>
		</c:otherwise>
	</c:choose>	
<br>
</body>
</html>