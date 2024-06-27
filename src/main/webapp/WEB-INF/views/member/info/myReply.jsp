<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myReply.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready( () => {
		$("#myReply").css("font-weight", "bold");
		$("#myReply").css("border-bottom", "2px solid #006ad5")
		$("#myReply").css("margin-bottom", "6px")
		$("#myContentMyReply").css("font-weight", "bold");
		$("#myContentMyReply").css("border-bottom", "2px solid #006ad5")
		$("#myContentMyReply").css("margin-bottom", "6px")

	})


</script>

<%@ include file="../../main/header.jsp" %>
</head>
<body>
	<div id="myPageWrapper">
		<%@ include file="./myPageMenu.jsp" %>
		<div id="myPageContentWrapper">
			<div id="myContentWrapper">
				<%@ include file="./myContentMyInfo.jsp" %>
			</div>
		</div>
	</div>
</body>
<%@ include file="../../main/footer.jsp" %>
</html>