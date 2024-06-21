<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM.css?after">
<script src="${path}/resources/js/businessM.js"></script>
</head>
<body>


<div class="skill-box">
	<div class="skill-bar">
		<span class="per04">
			<span class="tooltip04">99%</span>
		</span>
	</div>
</div>

<div class="center-box">
<h1>영업시간 선택하기</h1><br>

	
		이메일<input type="text" name="store_email">
		인증번호<input type="text" name="AuthenticNum"><br>
		<button type="button">인증</button>
		<hr>
		<div style="display: flex; justify-content: space-between;">
			<button type="button" onclick=" window.history.back()">이전</button>
			<button type="submit">가게 등록 완료</button>
		</div>
	</form>
</div>

</body>
</html>