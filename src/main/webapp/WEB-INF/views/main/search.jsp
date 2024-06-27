<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
                            <td>${search.store_name}</td>
                            <td>
                                <c:set var="seenCategories" value="" />
                                <!-- 특정 카테고리로 검색 시 -->
                                <c:forEach var="category" items="${fn:split(search.store_category, '/')}">
                                    <c:if test="${fn:contains(category, param.keyword)}">
                                        <c:if test="${not fn:contains(seenCategories, category)}">
                                            <c:if test="${!empty seenCategories}">
                                                /
                                            </c:if>
                                            ${category}
                                            <c:set var="seenCategories" value="${seenCategories}${category}/" />
                                        </c:if>
                                    </c:if>
                                </c:forEach>
                                
                                <!-- "ALL" 또는  메뉴 이름으로 검색 시 모든 카테고리 출력 -->
                                <c:if test="${param.searchType == 'menu_name' || param.searchType == '' || param.searchType == null}">
                                    <c:forEach var="category" items="${fn:split(search.store_category, '/')}">
                                        <c:if test="${not fn:contains(seenCategories, category)}">
                                            <c:if test="${!empty seenCategories}">
                                                /
                                            </c:if>
                                            ${category}
                                            <c:set var="seenCategories" value="${seenCategories}${category}/" />
                                        </c:if>
                                    </c:forEach>
                                </c:if>
                                
                            </td>
                        </tr>
		            </c:forEach>
		        </tbody>
		    </table>
    	</c:when>
    	<c:otherwise>
    		<p>검색 결과가 없습니다.</p>
    	</c:otherwise>
    </c:choose>
    <a href="/root/main/mainPage1">메인페이지</a>
</body>
</html>





