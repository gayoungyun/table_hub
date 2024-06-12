<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/storeCSS.css?after">
</head>
<body>
<div style= text-align:center>
	<img src="resources/img/결01.jpg" width="100px">
	<div class="infoBox">
		아침엔 상쾌한 브런치카페, 저녁엔 조용한 혼밥플레이스
	</div>
</div>

<script>
	for (let i = 1; i <= 100; i++) {
	    document.write(i + "<br>");
	}
</script>

</body>
</html>