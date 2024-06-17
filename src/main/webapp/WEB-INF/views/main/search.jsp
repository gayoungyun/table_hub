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
	<h2>검색 결과</h2>
	<c:choose>
		<c:when test="${not empty dtoList }">
		    <table border="1">
		        <thead>
		            <tr>
		                <th>메뉴 이름</th>
		                <th>카테고리</th>
		            </tr>
		        </thead>
		        <tbody>
		            <!-- 검색 결과를 반복하여 표시 -->
		            <c:forEach var="search" items="${dtoList}">
		                <tr>
		                    <td>${search.store_menu_name}</td>
		                    <td>${search.store_menu_category}</td>
		                </tr>
		            </c:forEach>
		        </tbody>
		    </table>
    	</c:when>
    	<c:otherwise>
    		<p>검색 결과가 없습니다.</p>
    	</c:otherwise>
    </c:choose>
</body>
</html>





