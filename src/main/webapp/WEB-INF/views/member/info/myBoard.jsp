<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myBoard.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready( () => {
		$("#myBoard").css("font-weight", "bold");
		$("#myBoard").css("border-bottom", "2px solid #006ad5")
		$("#myBoard").css("margin-bottom", "6px")
		$("#myContentMyBoard").css("font-weight", "bold");
		$("#myContentMyBoard").css("border-bottom", "2px solid #006ad5")
		$("#myContentMyBoard").css("margin-bottom", "6px")
		
		let currentPage = 1;
		
		boardPage(1);
	})
	function boardPage(page) {
		currentPage = page;
		$.ajax({
			url : "/root/member/myPage/board?page="+page,
			type : "get",
			dataType : "json",
			success : function ( data ) {
				console.log("data : ", data)
				let html = "";
                if (data.list != null) { // 불러온 데이터가 존재할 경우 실행
	                html += `<tr>`
	                html += `<th class="boardTitle">선택</th>`
	                html += `<th class="boardTitle">번호</th>`
	                html += `<th class="boardTitle">게시판</th>`
	                html += `<th class="boardTitle">제목</th>`
	                html += `<th class="boardTitle">작성일</th>`
	                html += `<th class="boardTitle">조회</th>`
	                html += `</tr>`
					data.list.forEach(function (item, index) { // list값을 반복하여 꺼내온다.
						
						// 불러온 시간형식을 표시할 수 있도록 형변환을 한다.
		                let date = new Date(item.create);
		                let createDate = (date.getFullYear() + '.') +
		                    ('0' + (date.getMonth() + 1)).slice(-2) + "." +
		                    ('0' + (date.getDate())).slice(-2) 
	
		                // 테이블 값을 표현한다.
						html += `<tr>`
						html += `<td class="boardContent">`
						html += `<input class="boardContentSelect" type="checkbox">`
						html += `</td>`
						html += `<td class="boardContent">`
						html += `<label class="boardContentNum" onclick="location.href='/root/board/`+item.id+`'">`+item.id+`</label>`
						html += `</td>`
						html += `<td class="boardContent">`
						html += `<label class="boardContentCategory">db값 없음</label>`
						html += `</td>`
						html += `<td class="boardContent">`
						html += `<label class="boardContentTitle" title="`+item.title+`" onclick="location.href='/root/board/`+item.id+`'">`+item.title+`</label>`
						html += `</td>`
						html += `<td class="boardContent">`
						html += `<label class="boardContentDate">`+createDate+`</label>`
						html += `</td>`
						html += `<td class="boardContent">`
						html += `<label class="boardContentView">`+item.view+`</label>`
						html += `</td>`
						html += `</tr>`
					})
					html += `<tr>`
					html += `<td class="boardContent" colspan="6">`
					console.log("totalPage : ", data.totalPage)
					console.log("currentPage : ", currentPage)
					let i = Math.floor((currentPage-1)/10)*10 + 1;
					console.log("i : ", i)
					let endNum = i + 9;
					console.log("1 : ", Math.floor((currentPage) / 10))
					console.log("2 : ", Math.floor(data.totalPage/10))
					if (data.totalPage > 1) {
						//현재 페이지 라인이 마지막 페이지라인인지 확인
						if (Math.floor((currentPage-1) / 10) == Math.floor(data.totalPage/10)) {
							console.log("마지막 페이지 라인")
							html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage-1)+`)"><</a>`
							for ( ; i <= data.totalPage; i++) {
								html += `<a class="boardContentPage" onclick="boardPage(`+i+`)">`+i+`</a>`
							}
							if (currentPage == data.totalPage) {
								html += `<a class="boardContentPage pageDisabled">></a>`							
							} else {
								html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage+1)+`)">></a>`														
							}
						} else {
							if (currentPage == 1) {
								html += `<a class="boardContentPage pageDisabled"><</a>`							
							} else {
								html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage-1)+`)"><</a>`														
							}
							for ( ; i <= endNum; i++) {
								html += `<a class="boardContentPage" onclick="boardPage(`+i+`)">`+i+`</a>`
							}
							html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage+1)+`)">></a>`
						} //페이징 if end
					} else {
						if (currentPage == 1) {
							html += `<a class="boardContentPage pageDisabled"><</a>`							
						} else {
							html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage-1)+`)"><</a>`														
						}
						for ( ; i <= endNum; i++) {
							html += `<a class="boardContentPage" onclick="boardPage(`+i+`)">`+i+`</a>`
						}
						if (currentPage == data.totalPage) {
							html += `<a class="boardContentPage pageDisabled">></a>`							
						} else {
							html += `<a class="boardContentPage" onclick="boardPage(`+(currentPage+1)+`)">></a>`
						}
						
					}
					html += `</td>`
					html += `</tr>`
                } else {
                	html = "작성한 게시글이 없습니다.";
                }// if end
				
				$("#myBoardTable").html( html );
			}, // success end
			error : function ( error ) {
				console.log("에러 발생")
				console.log(error)
			} // error end
		}) // ajax end
	}

</script>

<%@ include file="../../main/header.jsp" %>
</head>
<body>
	<div id="myPageWrapper">
	
		<!-- 좌측 메뉴 불러오기 -->
		<%@ include file="./myPageMenu.jsp" %>
		
		<!-- 실질적인 페이지 컨텐츠 내용 표시 -->
		<div id="myPageContentWrapper">
			<div id="myBoardWrapper">
				<%@ include file="./myContentMyInfo.jsp" %>
				<table id="myBoardTable">
				</table>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../main/footer.jsp" %>
</html>