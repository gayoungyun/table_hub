<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myBooking.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready( () => {
		$("#myBooking").css("font-weight", "bold");
		$("#myBooking").css("border-bottom", "2px solid #006ad5")
		$("#myBooking").css("margin-bottom", "6px")
		
	})


</script>

<%@ include file="../../mainPage.jsp" %>
</head>
<body>
	<div id="myPageWrapper">
		
		<%@ include file="./myPageMenu.jsp" %>
	
	
		
		<div id="myPageContentWrapper">
			<div id="bookContentReadyWrapper">
				<h2>방문 대기중인 예약</h2>
				<hr>
				<div id="readyContent">
					<div class="readyContentInfo">
						<label class="bookingStoreName">흥부네 닭강정</label>
						<label class="bookingStatus">방문대기</label>
						<a class="bookingDelete">X</a><br>
						<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>
						<label class="bookingDate">2024년 6월 24일 17:00</label><br>
						<label class="bookingPerson">성인 2명 어린이 1명</label>
						<hr>
						<label class="bookingStatusReady">방문 후 리뷰 작성 가능</label>
					</div>
				</div>
			</div>
			<div id="bookContentAlreadyWrapper">
				<h2>방문 완료된 예약</h2>
				<hr>
				<div id="readyContent">
					<div class="readyContentInfo">
						<label class="bookingStoreName">흥부네 닭강정</label>
						<label class="bookingStatus">방문완료</label>
						<a class="bookingDelete">X</a><br>
						<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>
						<label class="bookingDate">2024년 6월 24일 17:00</label><br>
						<label class="bookingPerson">성인 2명 어린이 1명</label>
						<hr>
						<label class="bookingStatusReviewReady">후기 작성</label>
					</div>
					<div class="readyContentInfo">
						<label class="bookingStoreName">흥부네 닭강정</label>
						<label class="bookingStatus">방문완료</label>
						<a class="bookingDelete">X</a><br>
						<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>
						<label class="bookingDate">2024년 6월 24일 17:00</label><br>
						<label class="bookingPerson">성인 2명 어린이 1명</label>
						<hr>
						<label class="bookingStatusReviewComplete">후기 작성 완료</label>
						<label class="bookingStatusReviewScore">평점 : 3점</label>
					</div>
					<div class="readyContentInfo">
						<label class="bookingStoreName">흥부네 닭강정</label>
						<label class="bookingStatus">방문완료</label>
						<a class="bookingDelete">X</a><br>
						<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>
						<label class="bookingDate">2024년 6월 24일 17:00</label><br>
						<label class="bookingPerson">성인 2명 어린이 1명</label>
						<hr>
						<label class="bookingStatusReviewTimeout">후기 작성 기간 만료</label>
					</div>
					<div class="readyContentInfo">
						<label class="bookingStoreName" title="흥부네 닭강정 ㅁㄴㅇㄹ">흥부네 닭강정ㅁㄴㅇㄹ</label>
						<label class="bookingStatus">방문완료</label>
						<a class="bookingDelete">X</a><br>
						<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>
						<label class="bookingDate">2024년 6월 24일 17:00</label><br>
						<label class="bookingPerson">성인 2명 어린이 1명</label>
						<hr>
						<label class="bookingStatusReviewTimeout">후기 작성 기간 만료</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>