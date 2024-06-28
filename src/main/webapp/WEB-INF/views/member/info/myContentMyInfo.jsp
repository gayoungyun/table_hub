<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myContentMyInfo.css?after" rel="stylesheet"/>
<script>
	$(document).ready = ( () => {
		
	})
</script>
</head>
<body>
	<h3 class="myContentTitle">내 활동 내역</h3>
	<table id="myContentmyInfo">
		<tr>
			<td>
				<img id="myContentmyImg" alt="" src="">
			</td>
			<td>
				<b id="myContentmyId">하이루</b><br>
				<label>작성 리뷰 <b>2</b> ·</label>
				<label>평균 평점 <b>3.5</b></label>
			</td>
		</tr> 
	</table>
	<a class="myContentMenu" href="myBoard" id="myContentMyBoard">작성글</a>
	<a class="myContentMenu" href="myReply" id="myContentMyReply">작성댓글</a>
	<a class="myContentMenu" href="myReview" id="myContentMyReview">작성리뷰</a>
	<hr class="myContentHr">
</body>
</html>