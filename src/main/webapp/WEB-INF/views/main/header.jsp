<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="${path}/resources/css/default/header.css?after"/>
</head>
<body>
	<div class="flex-container">
		<div class="flex-sub-container-1">
			<div class="flex-item">
				<a href="#">Profile</a>
			</div>
			<div class="flex-item">
				<a href="#">Board</a>
			</div>
		</div>
		<div class="flex-item-title">
			<a href="/root/main/mainPage1">Tabel HUB</a>
		</div>
		<div class="flex-sub-container-2">
			<div class="flex-item">
				<a href="#">Login</a>
			</div>
			<div class="search">
				<input type="text" id="store_menu_name" name="store_menu_name" placeholder="search for..">
				<input type="text" id="store_menu_category" name="store_menu_category" placeholder="category..">
				<button type="button" class="search-icon" onclick="submitSearch()">
					<img class="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
				</button>
			</div>
		</div>
		
	</div>
</body>

<script>
function submitSearch() {
    var searchText = document.getElementById('store_menu_name').value.trim(); // 메뉴 이름 가져오기
    var category = document.getElementById('store_menu_category').value.trim(); // 카테고리 가져오기

    // 검색어가 유효한 경우에만 검색 실행
    if (searchText !== '' || category !== '') {
        var path = '<%= request.getContextPath() %>';
        var url = path + '/main/search?store_id=123';

        // 검색어가 있는 경우에만 파라미터 추가
        if (searchText !== '') {
            url += '&store_menu_name=' + encodeURIComponent(searchText);
        }
        // 카테고리가 있는 경우에만 파라미터 추가
        if (category !== '') {
            url += '&store_menu_category=' + encodeURIComponent(category);
        }

        window.location.href = url; // 검색 결과 페이지로 이동
    } else {
        alert('검색어를 입력하세요.');
    }
}
</script>

</html>






