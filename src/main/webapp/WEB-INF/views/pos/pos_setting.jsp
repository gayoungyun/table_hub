<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/resources/css/pos/setting.css"
	rel="stylesheet">
</head>
<body id="setting_body">
	<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>
	
	<div class="main_wrapper">
		<div class="left_sidebar">
			<div class="payment tab" data-id="1"><span>결재내역 조회</span></div>
			<div class="reservation tab" data-id="2"><span>예약정보 조회</span></div>
			<div class="setting tab" data-id="3"><span>설정</span></div>
		</div>
		<div class="right_sidebar">
			<div class="set_store_layout">
				<span>가게 배치도</span>
				<button type="button" onclick="goSetLayout()">설정하기</button>
			</div>
		</div>
	</div>
		<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/pos/pos_setting.js"></script>
		<script type="text/javascript">
			const main_wrapper = document.querySelector(".main_wrapper");
			main_wrapper.addEventListener("click", function(event) {
				var parent = event.target;
				for(let i = 0; i < 2; i ++)
				{
					console.log(parent.dataset.id);	
					if(parent.dataset.id === undefined)
					{
						parent = parent.parentElement;
						console.log(parent);
					}
				}
				
			})
		
			function goSetLayout() {
				location.href="<%=request.getContextPath() %>/pos/layout"
			}
			
			
		</script>
</body>
</html>