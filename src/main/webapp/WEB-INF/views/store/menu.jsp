<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/storeCSS.css">
</head>
<body>
<h1>메뉴 페이지입니다</h1>
<script>
	console.log("${dto}");
</script>
<c:choose>
	<c:when test="${dto != null}">
		<c:forEach var="item" items="${dto}">
			카테고리 : ${item.store_menu_category} &nbsp;
			메뉴 이름 : ${ item.store_menu_name } &nbsp;
			가격 : ${item.store_menu_price} &nbsp;
			사진 : <img src="/root/businessM/download?img=${ item.store_menu_img}"> &nbsp;
			설명 : ${item.store_menu_detail}<br>
		</c:forEach>
	</c:when>
	<c:otherwise>
		등록된 메뉴가 없습니다.
	</c:otherwise>

</c:choose>

</body>
</html>