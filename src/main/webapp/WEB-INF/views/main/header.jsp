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
			
				<select id="search_category" name="search_category">
					<option value="">ALL</option>
					<option value="menu_name">Menu Name</option>
					<option value="menu_category">Menu Category</option>
				</select>
				
				<input type="text" id="search_keyword" name="search_keyword" placeholder="search for..">
				<div type="button" class="search-icon" onclick="submitSearch()">
					<img class="icon" 
					src="https://media.istockphoto.com/id/663931836/ko/%EB%B2%A1%ED%84%B0/%EB%8F%8B%EB%B3%B4%EA%B8%B0-%EB%AA%A8%EC%96%91%EC%9D%98-%EA%B2%80%EC%83%89-%EC%95%84%EC%9D%B4%EC%BD%98-%EC%9D%BC%EB%9F%AC%EC%8A%A4%ED%8A%B8-%EB%A0%88%EC%9D%B4-%EC%85%98-%EB%94%94%EC%9E%90%EC%9D%B8.jpg?s=612x612&w=0&k=20&c=UyX-bsNA_IZZBjNFzoCHqLSRZqV5O6XgVJ9icR1LtlY=">
				</div>
			</div>
		</div>
		
	</div>
</body>

<script>
function submitSearch() {
    var category = document.getElementById('search_category').value;
    var keyword = document.getElementById('search_keyword').value.trim();

    // 검색어가 유효한 경우에만 검색 실행
    if (keyword !== '') {
        var path = '<%= request.getContextPath() %>';
        var url = path + '/main/search';

        if (category !== '') {
            url += '?searchType=' + category + '&keyword=' + encodeURIComponent(keyword);
        } else {
            url += '?keyword=' + encodeURIComponent(keyword);
        }

        window.location.href = url; // 검색 결과 페이지로 이동
    } else {
        alert('검색어를 입력하세요.');
    }
}
</script>

</html>






