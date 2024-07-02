<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

html, body {
	width: 100vw;
	height: 100vh;
}

body {
	display: flex;
	justify-content: center;
	align-items: center;
	background-color: #E2E2E2;
	min-height: 500px;
}

.main_wrapper {
	display: flex;
	justify-content: center;
	width: 80vw;
	height: 90vh;
	width: 80vw;
}

.left_body {
	display: inline-block;
	width: 49.5%;
	height: 100%;
	background-color: #191E36;
	color: #fff;
	min-width: 300px;
	min-height: 700px;
}

.right_body {
	display: inline-block;
	width: 49.5%;
	height: 100%;
	background-color: #fff;
	color: black;
	min-width: 300px;
	min-height: 700px;
}

.store_introduction {
	display: flex;
	width: 100%;
	justify-content: center;
	height: 25%;
	align-items: center;
}

.store_waitingNumber_wrapper {
	width: 100%;
	display: flex;
	height: 45%;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	padding-bottom: 15px;
}

.store_name {
	font-size: 50px;
	border-width: 1px 0 1px 0;
	border-color: sliver;
	border-style: solid;
	width: 80%;
	padding: 7px;
}

.color_white {
	color: #fff;
}

.color_orange {
	color: #FF9616;
}

.store_waitingNumber {
	font-size: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.store_circleNumber {
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	width: 170px;
	height: 170px;
	position: relative;
}

.store_circleNumber_white {
	background-color: #fff;
}

.store_circleNumber_darkblue {
	background-color: #191E36;
}

.store_circleNumber>span {
	font-size: 60px;
}

.store_footer {
	width: 100%;
	height: 30%;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	border-top: 1px solid silver;
}

.store_footer>div {
	display: inline-block;
	width: 49%;
	height: 100%;
}

.p_center {
	text-align: center;
}

.p_footer {
	font-size: 25px;
	padding-top: 10px;
}

.dom_wrapper {
	display: flex;
	align-items: center;
	justify-content: center;
	min-height: 150px;
}

.font_size {
	font-size: 35px;
}

.div_wrapper {
	
}

.footer_common {
	display: flex;
	flex-direction: column;
}

.now_team {
	border-right: 0.5px solid silver;
}

.avg_time {
	border-left: 0.5px solid silver;
}

.input_name {
	width: 250xp;
	height: 30px; font-size : 15px;
	border: 0;
	border-radius: 15px;
	outline: none;
	padding-left: 10px;
	background-color: rgb(233, 233, 233);
	font-size: 15px;
}

.input_wrapper {
	margin-bottom: 18px;
}

.label {
	font-size: 20px;
}

.p_size20 {
	font-size: 20px;
}

.p_padding {
	padding-top: 20px;
	padding-bottom: 25px;
}

.minus {
	background-image:
		url('https://cdn-icons-png.flaticon.com/512/151/151856.png');
	background-size: cover;
	cursor: pointer;
	position: absolute;
	top: 65px;
	left: -50px;
	width: 40px;
	height: 40px;
}

.plus {
	background-image:
		url('https://cdn-icons-png.flaticon.com/512/25/25304.png');
	background-size: cover;
	cursor: pointer;
	position: absolute;
	top: 65px;
	right: -50px;
	width: 40px;
	height: 40px;
}

.right_body_footer {
	width: 100%;
	height: 30%;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
}

.right_body_footer>div {
	width: 49%;
	height: 100%;
}

.right_body_footer_common {
	display: flex;
	align-items: center;
	justify-content: center;
}

.div_button_wrapper {
	width: 100%;
}
</style>

</head>
<body id="body">
	<div class="main_wrapper">
		<div class="left_body">
			<div class="store_introduction"></div>
			<div class="store_waitingNumber_wrapper">
				<p class="store_name p_center">가게 이름</p>
				<p class="store_waitingNumber p_center">현재 입장번호</p>
				<div class="store_circleNumber color_orange store_circleNumber_white ">
					<span>0</span>
				</div>
			</div>
			<div class="store_footer">
				<div class="now_team footer_common">
					<div class="div_wrapper">
						<p class="p_center p_footer">현제 웨이팅</p>
					</div>
					<div class="dom_wrapper team">
						<span class="color_orange font_size">0팀</span>
					</div>
				</div>
				<div class="avg_time footer_common">
					<div class="div_wrapper">
						<p class="p_center p_footer">예상 시간</p>
					</div>
					<div class="dom_wrapper time">
						<span class="color_orange font_size">0분</span>
					</div>
				</div>
			</div>
		</div>
		<div class="right_body">
			<div class="store_introduction"></div>
			<div class="store_waitingNumber_wrapper">
				<div class="input_wrapper">
					<label for="input_text" class="label">이름</label> 
					<input id="input_text" type="text" placeholder="이름을 입력해 주세요." class="input_name">
				</div>
				<div>
					<p class="p_center p_size20 p_padding">인원 수</p>
				</div>
				<div class="store_circleNumber color_white store_circleNumber_darkblue">
					<div class="minus"></div>
					<span class="person_num">0</span>
					<div class="plus"></div>
				</div>
			</div>
			<div class="right_body_footer">
				<div class="right_body_footer_common">
					<div class="view_waiting div_button_wrapper">
						<p class="color_orange p_center p_padding p_size20 ">웨이팅 목록</p>
					</div>
				</div>
				<div class="right_body_footer_common">
					<div class="set_waiting div_button_wrapper">
						<p class="color_orange p_center p_padding p_size20 send_message">웨이팅 시작</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<script type="text/javascript">
	let socket = null;
	
	const body = document.getElementById('body');
	
	$(document).ready(function() {
		connectWs();
	})
	
	
	
	// 소켓
	function connectWs() {
		
		console.log("tttttt")
		var ws = new SockJS("http://localhost:8080/root/send");
		socket = ws;
		ws.onopen = function() {
			console.log('open');
		};

		ws.onmessage = function(event) {
			console.log("전송 받음");
		};

		ws.onclose = function() {
			console.log('close');
		};

	};

	body.addEventListener("click", function(event) {
		let parent = event.target;
		
		for (let i = 0; i < 4; i++) {
			// 마이너스 버튼을 누르면
			if (parent.classList.contains('minus')) {
				const person_num = document.querySelector('.person_num');

				if (person_num.innerText == 0) {
					break;
				}
				person_num.innerText = Number(person_num.innerText) - 1;
				break;
			}
			// 플러스 버튼을 누르면
			else if (parent.classList.contains('plus')) {
				const person_num = document.querySelector('.person_num');

				person_num.innerText = Number(person_num.innerText) + 1;
				break;
			}
			// 웨이팅 목록 버튼을 누르면
			else if (parent.classList.contains('view_waiting')) {
				break;
			}
			// 웨이팅 시작 버튼을 누르면
			else if (parent.classList.contains('set_waiting')) {
				const input_text = document.getElementById('input_text');
				const person_num = document.querySelector(".person_num");
				
				if(input_text.value == "")
				{
					alert("이름을 입력해 주세요!!");
				}
				else if(person_num.value == 0)
				{
					alert("인원을 입력해 주세요!!");		
				}	
				else {
					waitingNumber++;
					// 이름, 인원, 대기번호 순서, 보내는 곳 종류
					socket.send(input_text.value + "," + person_num.value + "," + 0);
				}
				
				break;
			}
			// 끝내기
			else if (parent == event.currentTarget) {
				break;
			} else {
				parent = parent.parentElement;
			}
		}
	})
</script>

</html>