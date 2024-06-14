<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<link href="<%=request.getContextPath()%>/resources/css/pos/header.css"
	rel="stylesheet">
</head>
<body>
	<div id="pos_header">
		<div class="logo_wrapper"></div>
		<div>
			<div class="header_tab_wrapper">
				<div class="header_tab_left header_tab">
					<span>주문 관리</span>
				</div>
				<div class="header_tab_right header_tab">
					<span>매장 관리</span>
				</div>
			</div>
		</div>
	</div>
</body>


<script type="text/javascript">
	const header_tab = document.querySelector(".header_tab_wrapper");
	header_tab.addEventListener('click', function(e) {
		// 나중에 경로 추가
		if (e.target.innerHTML === "주문 관리")
			location.href="<%=request.getContextPath()%>/pos/order";
		if (e.target.innerHTML === "매장 관리")
			location.href="<%=request.getContextPath()%>/pos/set";
	})
</script>
</html>