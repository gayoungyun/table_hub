<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM.css?after">
</head>
<body>

<a href="register01">1단계 돌아가기</a>
<div class="skill-box">
	<div class="skill-bar">
		<span class="per05">
			<span class="tooltip05">100%</span>
		</span>
	</div>
</div>
<img src="resources/img/로고.png" width="100px"
		onclick="window.location.href='http://localhost:8080/root/'">

</body>
</html>