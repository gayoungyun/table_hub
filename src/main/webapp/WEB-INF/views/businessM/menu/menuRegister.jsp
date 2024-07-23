<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/menuRegister.css?after">
<script src="${path}/resources/js/businessM/menuRegister.js"></script>
</head>
<body>
<header class="header">
<%@ include file="../../main/header.jsp" %>
</header>

<div class="center-box">
<div class="white-box">
<h1>내 가게 메뉴 등록창 </h1>

       <form id="menuForm" action="menuRegister" method="POST" enctype="multipart/form-data">
		<button type="button" class="button01" onclick="addRow()">+</button>
        <table class="menu-form" id="menuTable" border="1">
            <thead>
                <tr>
                    <th>카테고리</th>
                    <th>메뉴 이름</th>
                    <th>가격</th>
                    <th>사진</th>
                    <th>설명</th>
                </tr>
            </thead>
            <tbody id="menuBody">
                <tr>
                    <td><select name="menu_category1">
	                         <option value="에피타이저">에피타이저</option>
	                         <option value="메인">메인</option>
	                         <option value="사이드">사이드</option>
	                         <option value="음료">음료</option>
	                         <option value="술">술</option>
	                         <option value="디저트">디저트</option>
	                         </select></td>
                    <td><input type="text" name="menu_name1"></td>
                    <td><input type="number" name="menu_price1"></td>
                    <td><input type="file" name="menu_photo1"></td>
                    <td><input type="text" name="menu_note1"></td>
                </tr>
            </tbody>
        </table>
        <button type="submit" class="button02" onclick="submitForm()">저장</button>
    </form> 
    
</div>
</div>

</body>
</html>