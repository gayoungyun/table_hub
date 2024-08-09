<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/board/main.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%@ include file="../main/header.jsp" %>
</head>
<body id="board_body">
	<!--  게시판 바디  -->
	<div id="board_wrapper">
	
		<!-- 	보드 페이지에서 내정보와 메뉴 표시 -->
		<div id="board_left_container">
		
			<!--  내 정보 표시 로그인 안되있을 경우 로그인 페이지로 이동 -->
			<div id="board_left_myInfo">
				<h3>내 활동 내역</h3>
				<div id="board_left_myInfo_img">
					<img alt="" src="https://search.pstatic.net/sunny/?src=https%3A%2F%2Fpng.pngtree.com%2Fpng-vector%2F20240130%2Fourlarge%2Fpngtree-dry-leaves-isolated-tropical-dry-leaves-png-png-image_11519217.png&type=sc960_832">								
				</div>
				<div id="board_left_myInfo_info">
					<label class="nickname">하이루</label><br>
					<label class="myContent">작성글 5 · 댓글 13 </label>
				</div><br>
				<label class="myBoard">내 작성글</label>&nbsp;·&nbsp;<label class="myReply">내 댓글</label><br>
				<input id="writeBoard" type="button" value="글 작성하기">
			</div>
			
			<!-- 게시판 페이지 메뉴 표시 -->
			<div id="board_left_menu">
				<h3>Table Rounge</h3>
				<img alt="" src="resources/img/board/allBoard.png">
				<label class="menu_content">전체 글 보기</label><br>
				<img alt="" src="resources/img/board/notice.png">
				<label class="menu_content">공지사항</label><br>
				<img alt="" src="resources/img/board/menuBoard.png">
				<label class="menu_content">메뉴 추천</label><br>
				<img alt="" src="resources/img/board/freeBoard.png">
				<label class="menu_content">자유게시판</label><br>
				<img alt="" src="resources/img/board/add.png">
				<label class="menu_content">식당 홍보</label><br>
			</div>
			
		<!-- 보드 페이지에서 내정보와 메뉴 표시 end -->
		</div>
		
		<!-- 게시글이 표시되는 구간 -->
		<div id="board_right_container">
		
		
			<div id="board_main_notice">
				<div id="board_main_notice_title" class="board_main_title">
					<img class="mainImg" alt="" src="resources/img/board/notice.png">
					<label class="mainTitle">공지사항</label>
				</div>
				<div id="board_main_notice_content">
					<label class="main_notice_content_1 main_content">번호</label>
					<label class="main_notice_content_2 main_content">제목</label>
					<label class="main_notice_content_3 main_content">작성자</label>
					<label class="main_notice_content_4 main_content">작성일</label>
					<label class="main_notice_content_5 main_content">조회</label>
					<hr>
					<label class="main_notice_content_1 main_content">000123</label>
					<label class="main_notice_content_2 main_content">게시판 공간을 아름답게 사용해주세요.!</label>
					<label class="main_notice_content_3 main_content">운영자</label>
					<label class="main_notice_content_4 main_content">2024.07.31</label>
					<label class="main_notice_content_5 main_content">125</label>
					<hr>
					<label class="main_notice_content_1 main_content">000124</label>
					<label class="main_notice_content_2 main_content">반갑습니다. 테이블허브입니다.</label>
					<label class="main_notice_content_3 main_content">운영자</label>
					<label class="main_notice_content_4 main_content">2024.07.28</label>
					<label class="main_notice_content_5 main_content">225</label>
				</div>		
			</div>
			
			
			<div id="board_main_view">
				<div id="board_main_view_title" class="board_main_title">
					<img class="mainImg" alt="" src="resources/img/board/viewBest.png">
					<label class="mainTitle">베스트 조회수</label>
				</div>
				<div id="board_main_view_content">
					<label class="main_hitview_content_1 main_content">번호</label>
					<label class="main_hitview_content_2 main_content">제목</label>
					<label class="main_hitview_content_3 main_content">조회수</label>
					<hr>
					<label class="main_hitview_content_1 main_content">000125</label>
					<label class="main_hitview_content_2 main_content">방가방가!!!</label>
					<label class="main_hitview_content_3 main_content">30</label>
					<hr>
					<label class="main_hitview_content_1 main_content">000126</label>
					<label class="main_hitview_content_2 main_content">내일 점메주 부탁</label>
					<label class="main_hitview_content_3 main_content">13</label>
				</div>	
			</div>
			
			
			<div id="board_main_hit">
				<div id="board_main_hit_title" class="board_main_title">
					<img class="mainImg" alt="" src="resources/img/board/hitBest.png">
					<label class="mainTitle">베스트 추천글</label>
				</div>
				<div id="board_main_hit_content">
					<label class="main_hitview_content_1 main_content">번호</label>
					<label class="main_hitview_content_2 main_content">제목</label>
					<label class="main_hitview_content_3 main_content">추천수</label>
					<hr>
					<label class="main_hitview_content_1 main_content">000125</label>
					<label class="main_hitview_content_2 main_content">방가방가!!!</label>
					<label class="main_hitview_content_3 main_content">30</label>
					<hr>
					<label class="main_hitview_content_1 main_content">000126</label>
					<label class="main_hitview_content_2 main_content">내일 점메주 부탁</label>
					<label class="main_hitview_content_3 main_content">13</label>
				</div>	
			</div>
			
			
		<!-- 게시글이 표시되는 구간 end -->
		</div>
		
	<!--  게시판 바디 end -->
	</div>
</body>
<%@ include file="../main/footer.jsp" %>
</html>