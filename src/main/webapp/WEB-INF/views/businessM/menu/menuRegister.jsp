<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/businMinfo.css?after">
<script src="${path}/resources/js/businessM/businMmenu.js"></script>
</head>
<body>
<header class="header">
<%@ include file="../../main/header.jsp" %>
</header>

<div class="center-box">

<h1>내 가게 메뉴 등록창 </h1>

</div>
</body>
</html>