<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="html">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
#html, #body, .main_wrapper {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.side_bar {
	height: 100%;
	display: flex;
	justify-content: center;
}

.side_tab_menu {
	display: inline-block;
	width: 50px;
}

.right {
	float: right;
}

.menu {
	display: flex;
	flex-direction: column;
	height: 100%;
	width: 0;
	background-color: blue;
	overflow-x: hidden;
	transition: 0.5s;
	color: white;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	overflow: auto;
}
.booking_wrapper {
	width: 250px;
	height: 50px;
	background-color: yellow;
}
.booking_focus_in {
	height: 100px;
	background-color: red;
	
	overflow: hidden;
}


.menu.open {
	right: 0; /* 메뉴가 화면 안으로 들어오도록 설정 */
}

.tab_wrapper {
	text-align: center;
	background-color: red;
}
</style>


</head>
<body id="body">
	<div class="main_wrapper">
		<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>
		<div class="main_layout"></div>
		<div class="side_bar right">
			<div class="side_tab_menu">
				<div class="tab_wrapper">
					<p>예</p>
					<p>약</p>
					<p>현</p>
					<p>황</p>
				</div>
				<div class="tab_wrapper">
					<p>대</p>
					<p>기</p>
					<p>현</p>
					<p>황</p>
				</div>
			</div>
			<div id="menu" class="menu"></div>
		</div>
	</div>

	<script type="text/javascript">
		const body = document.getElementById("body");
		const menu = document.querySelector(".menu");
		let sse = new EventSource("http://localhost:8080/root/con/connect?articleId=${UserID}");
		
		$(document).ready(function() {
			var realSize = window.innerHeight - 56;
			$(".main_wrapper").css("height", realSize);
			$(".main_wrapper").css("display", "block");
		})
		$(window).resize(function() {
			var realSize = window.innerHeight - 56;
			if (realSize > 0) {
				$(".main_wrapper").css("height", realSize);
			}
			let a;
		});
		
		sse.addEventListener('connect', (e) => {
			const {data : receivedConnectData } = e;
			console.log('connect data: ', receivedConnectData);			
		})
		
		sse.addEventListener('newBooking', (e) => {
			let data = JSON.parse(e.data);
			console.log(data);
			
			const div_booking_wrapper = document.createElement('div');
			div_booking_wrapper.classList.add('booking_wrapper');
				
			menu.appendChild(div_booking_wrapper);
		})
		
		menu.addEventListener('click', function(event) {
			
			let is_alreadyClicked = false;
			
			if(event.target.classList.contains('booking_wrapper'))
			{
				const booking_wrapper = document.querySelectorAll('.booking_wrapper');
				
				console.log(booking_wrapper);
				
				if(event.target.classList.contains('booking_focus_in'))
				{
					event.target.classList.remove('booking_focus_in');
					is_alreadyClicked = true;
				}
				
				if(!is_alreadyClicked)
				{					
					for(let i = 0; i < booking_wrapper.length; i++)
					{
						booking_wrapper[i].classList.remove('booking_focus_in');
					}
					event.target.classList.add('booking_focus_in');	
				}
			}
		})
		
		
		body.addEventListener(
						"click",
						function(event) {
							let parent = event.target;
							const menu = document.getElementById('menu');

							for (let i = 0; i < 4; i++) {
								if (parent.getAttribute("class", "tab_wrapper") == "tab_wrapper") {
									menu.style.width = "300px";
									break;
								} else {
									if (parent.getAttribute("id", "body") == "body") {
										menu.style.width = "0";
										break;
									}
									parent = parent.parentElement;
								}
							}
						})
	</script>
</body>
</html>