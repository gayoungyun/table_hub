<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<h1>사진 페이지입니다</h1>
<c:forEach var="Simg" items="${storeImg}">
    <img src="/root/businessM/download?img=${Simg}">
</c:forEach>
<c:forEach var="Rimg" items="${reviewImg}">
    <img src="/root/businessM/download?img=${Rimg}">
</c:forEach>



</body>
</html>