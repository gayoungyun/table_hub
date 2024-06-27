<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myReview.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
	$(document).ready( () => {
		$("#myReview").css("font-weight", "bold");
		$("#myReview").css("border-bottom", "2px solid #006ad5")
		$("#myReview").css("margin-bottom", "6px")
		
		$("#myContentMyReview").css("font-weight", "bold");
		$("#myContentMyReview").css("border-bottom", "2px solid #006ad5");
		$("#myContentMyReview").css("margin-bottom", "6px")
	})


</script>

<%@ include file="../../main/header.jsp" %>
</head>
<body>
	<div id="myPageWrapper">
	
		<!-- 좌측 메뉴 불러오기 -->
		<%@ include file="./myPageMenu.jsp" %>
		
		<!-- 실질적인 페이지 컨텐츠 내용 표시 -->
		<div id="myPageContentWrapper">
			<div id="myContentWrapper">
				<%@ include file="./myContentMyInfo.jsp" %>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../main/footer.jsp" %>
</html>