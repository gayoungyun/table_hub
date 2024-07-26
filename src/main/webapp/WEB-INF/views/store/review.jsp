<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>리뷰 페이지입니다</h1>

<c:choose>
	<c:when test="${dto != null}">
		<c:forEach var="item" items="${dto}">
			사용자 이름 : ${item.member_id} &nbsp;
			리뷰 내용 : ${ item.store_review_body } &nbsp;
			작성일자 : ${item.store_review_date_create} &nbsp;
			평점 : ${item.store_review_score} &nbsp;
			사진 : <img src="/root/businessM/download?img=${ item.store_review_img_image}"><hr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		등록된 리뷰가 없습니다.
	</c:otherwise>

</c:choose>

</body>
</html>