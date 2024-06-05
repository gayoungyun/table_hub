<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html id="login_html">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/pos/login.css"
	rel="stylesheet">

</head>
<body id="login_body" style="display: none;">
	<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>
	<div class="main_wrapper">
		<div class="form_wrapper">
			<form method="post" action="<%=request.getContextPath()%>/pos/pos_login_chk">
				<label id="label" for="input_id">POS 로그인</label><br> 
				<input type="text" id="input_id" name="id" placeholder="ID" required><br>
				<input type="password" id="input_pwd" name="pwd" placeholder="PASSWORD" required><br>
				<button type="submit" id="login_btn">로그인</button>
			</form>
		</div>
	</div>

	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/pos/pos_login.js"></script>

</body>
</html>