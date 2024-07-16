<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
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

.modal{
  position:absolute;
  display:none;
  
  justify-content: center;
  top:0;
  left:0;

  width:100vw;
  height:100vh;

  background-color: rgba(0,0,0,0.4);
  
  z-index: 10;
}

.modal_body1{
	display: none;
  	position:absolute;
  	top:50%;  

  	width:400px;  
  	height:400px; 

  	padding:40px;  

	  background-color: rgb(255,255,255); 
  	border-radius:10px;  
  	box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

	  transform:translateY(-50%);  
}

.modal_body2 {
	display: none;
  	position:absolute;
  	top:50%;  

  	width:600px;  
  	height:800px; 

  	padding:40px;  

	background-color: rgb(255,255,255); 
  	border-radius:10px;  
  	box-shadow:0 2px 3px 0 rgba(34,36,38,0.15); 

	transform:translateY(-50%);
	
	overflow: scroll;
}

.tbModal {
  width: 400px;
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
.modal_circle_num {
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

.font_color_white {
	color: white;
}

.color_deepBlue {
	background-color: #191E36;
}

.modal_body_header {
	display: flex;
	justify-content: center;
	
}

.modal_body_header > span {
	font-size: 30px;
	font-weight: bold;
}
.modal_body_body {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 90%;
}
.modal_circle_num > span {
	font-size: 40px;	
}

.waitTable {
	display: flex;
	justify-content: space-around;
	
	width: 100%;
	height: 30px;
	
	margin-top: 8px;
	
	background-color: #f1f3f5;
	border-radius: 8px; 
}
.wait_time {
	display: block;
	width: 60px;
}

.qr {
	height: 150px;
	width: 150px;
}
.bold {
	font-weight: bold;
}
</style>

</head>
<body id="body">
	<div class="main_wrapper">
		<div class="modal">
			<div class="modal_body1">
				<div class="modal_body_header">
					<span>대기 번호</span>
				</div>
				<div class="modal_body_body">
					<div class="modal_circle_num color_deepBlue font_color_white">
						<span>0</span>
					</div>	
				</div>
			</div>
			<div class="modal_body2">
			</div>
		</div>
	
		<div class="left_body">
			<div class="store_introduction">
				
			</div>
			<div class="store_waitingNumber_wrapper">
				<p class="store_name p_center">${store_id}</p>
				<p class="store_waitingNumber p_center">현재 입장번호</p>
				<div class="store_circleNumber color_orange store_circleNumber_white">
					<span>0</span>
				</div>
			</div>
			<div class="store_footer">
				<div class="now_team footer_common">
					<div class="div_wrapper">
						<p class="p_center p_footer">현제 웨이팅</p>
					</div>
					<div class="dom_wrapper team">
						<span class="color_orange font_size store_teamWait">0팀</span>
					</div>
				</div>
				<div class="avg_time footer_common">
					<div class="div_wrapper">
						<p class="p_center p_footer">예상 시간</p>
					</div>
					<div class="dom_wrapper time">
						<span class="color_orange font_size average_time">0분</span>
					</div>
				</div>
			</div>
		</div>
		<div class="right_body">
			<div class="store_introduction">
				<img class="qr" src="data:image/jpeg;base64,${qrCode}" alt="QR Code">
			</div>
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
		
		fetch("http://localhost:8080/root/api/todayWait", {
			headers : {"Content-Type": "application/json",
						"store_id" : '${store_id}'},
		})
		.then((response) => response.json())
		.then((data) => {
			const store_teamWait = document.querySelector('.store_teamWait');	
			store_teamWait.innerText = data.length + "팀";
			
			for(let i = 0; i < data.length; i++)
			{
				makeWaitTable(data[i].wait_num, data[i].person_num, data[i].wait_date);
			}
		})	
		averageTime();
		nowWaitNum();
	})
	// 현재 대기 번호 가져오기
	function nowWaitNum() {
		fetch("http://localhost:8080/root/api/nowWaitNum", {
			headers : {"Content-Type": "application/json",
						"store_id" : '${store_id}'},
		})
		.then((response) => response.json())
		.then((data) => {
			if(data == null)
				return ;
			else {
				const store_circleNumber = document.querySelector('.store_circleNumber');
				store_circleNumber.firstElementChild.innerText = data;	
			}
		})			
		
	}
	// 평균 시간 가져오기
	function averageTime() {
		fetch("http://localhost:8080/root/api/averageTime", {
			headers : {"Content-Type": "application/json",
						"store_id" : '${store_id}'},
		})
		.then((response) => response.json())
		.then((data) => {
			const average_time = document.querySelector('.average_time');
			average_time.innerText = Math.floor(data/60)  + "분";
		})			
	}
	
	function makeWaitTable(wait_num, person_num, wait_date) {
		
		const modal_body2 = document.querySelector('.modal_body2');
		
		const waitTable = document.createElement('div');
		waitTable.classList.add('waitTable');
		waitTable.dataset.wait_num = wait_num;
		// 맨 앞 컬럼 순서 
		const div_columNum = document.createElement('div');
		const span_columNum = document.createElement('span');
		
		div_columNum.classList.add('wait_number');
		span_columNum.innerText = Number(modal_body2.childElementCount + 1);
		div_columNum.appendChild(span_columNum);
				
		// 컬럼 순서 테이블에 넣기
		waitTable.appendChild(div_columNum);
		
		const div_waitNum = document.createElement('div');
		const span_waitNum = document.createElement('span');
		
		span_waitNum.classList.add('bold');
		span_waitNum.innerText = wait_num;
		
		div_waitNum.appendChild(span_waitNum);
		
		// 대기 번호 테이블에 넣기
		waitTable.appendChild(div_waitNum);
		
		const div_personNum = document.createElement('div');
		const span_personNum = document.createElement('span');
		
		span_personNum.innerText = "인원 " + person_num + "명";
		div_personNum.appendChild(span_personNum);
		
		// 인원 테이블에 넣기
		waitTable.appendChild(div_personNum);
		
		const div_waitTime = document.createElement('div');
		const span_waitDate = document.createElement('span');
		const sec = time(wait_date);
		
		span_waitDate.classList.add('wait_time');
		span_waitDate.innerText = parseInt(sec/60) + ":" + sec%60;
		div_waitTime.appendChild(span_waitDate);
		waitTable.appendChild(div_waitTime);
		
		modal_body2.appendChild(waitTable);
	}
	// 시간 증가
	 setInterval(function() {
		const time = document.querySelectorAll('.wait_time');
		
		for(let i = 0; i < time.length; i++)
		{
			const str = time[i].innerText.split(':');
			let bun = Number(str[0]);
			let cho = Number(str[1]);
			
			if(cho == 59)
			{
				bun++;
				cho = 00;					
			}
			else
				cho++;
			time[i].innerText = bun + ":" + cho;
		}
	}, 1000);
	
	
	// 시간 계산
	function time(wait_date) {
		const currentDate = new Date();

		const db_wait_date = wait_date.split('.')[0];
		const formattedDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate() + " " + currentDate.getHours()+ ':' + currentDate.getMinutes() + ':' + currentDate.getSeconds();
		
		const dateA = new Date(formattedDate); 
		const dateB = new Date(db_wait_date);
		
		const diffMSec = (dateA.getTime() - dateB.getTime()) / 1000;
		
		return diffMSec;
	}
	
	// 소켓
	function connectWs() {
		console.log("tttttt")
		var ws = new SockJS("http://localhost:8080/root/send");
		socket = ws;
		
		ws.onopen = function(e) {
			console.log('open');
		}

		ws.onmessage = function(event) {
			const data = event.data.split(',');
			
			// 보낸 대기요청에 모든 키값 클라이언트가 응답받았다는 의미
			if(data[0] == 0)
			{
				console.log("전송 받음");
				setWait(data);
				const currentDate = new Date();
				const formattedDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate() + " " + currentDate.getHours()+ ':' + currentDate.getMinutes() + ':' + currentDate.getSeconds() + ".0";
				makeWaitTable(data[1], data[3], formattedDate);
			}
			else if(data[0] == 1)
			{
				console.log("전송 받음");
				manageWait(data);
			}
			else if(data[0] == -1)
			{
				alert("호스트가 로그인 되어 있지 않습니다.");
				location.href="/root/pos/wait_login";
			}
		}

		ws.onclose = function(e) {
		    console.log('close');		    
		}
		
		ws.onerror = function(e) {
			console.log("error");
		}
	}
	
	function manageWait(data) {		
		const wait_num = data[1];
		const store_circleNumber = document.querySelector('.store_circleNumber');
		store_circleNumber.firstElementChild.innerText = wait_num;	
		
		const span_wait = document.querySelector('.store_teamWait');
		let span_num = span_wait.innerText;
		let num = span_num.split('팀');
		num[0]--;
		span_wait.innerText = num[0] + "팀";	
		
		const waitTable = document.querySelectorAll('.waitTable');
		const wait_number = document.querySelectorAll('.wait_number');
		let changeFirstNum = false;
		
		for(let i = 0; i < waitTable.length; i++)
		{
			
			if(waitTable[i].dataset.wait_num == wait_num)
			{
				waitTable[i].remove();
				changeFirstNum = true;
			}
			else if(changeFirstNum == true)
			{
				wait_number[i].firstChild.innerText = i;		
			}
		}
		
	}
	
	function setWait(data) {
		console.log(data);		
		const wait_num = data[1];
		const wait_name = data[2];
		const wait_person = data[3];
		
		const span_wait = document.querySelector('.store_teamWait');
		let span_num = span_wait.innerText;
		let num = span_num.split('팀');
		num[0]++;
		span_wait.innerText = num[0] + "팀";
		
		// 모달창에서 작동하는거 추가하기
		
		if(data[4] == '${key}')
		{			
			const modal = document.querySelector('.modal');
			const modal_body1 = document.querySelector('.modal_body1');
			const modal_body2 = document.querySelector('.modal_body2');
			const modal_circle_num = document.querySelector('.modal_circle_num');
			
			modal_circle_num.lastElementChild.innerText = wait_num;
			
			modal.style.display = "flex";
			modal_body1.style.display = "block";
		}
	}
	
	body.addEventListener("click", function(event) {
		let parent = event.target;
		
		if(event.target.classList.contains('modal') || event.target.classList.contains('modal_body1') || event.target.classList.contains('modal_body2'))
		{
			const modal = document.querySelector('.modal');
			const modal_body1 = document.querySelector('.modal_body1');
			const modal_body2 = document.querySelector('.modal_body2');
			modal_body2.style.display = 'none';
			modal_body1.style.display = 'none';
			modal.style.display = 'none';
		}
		
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
				
				const modal = document.querySelector('.modal');
				const modal_body2 = document.querySelector('.modal_body2');
				modal.style.display='flex';
				modal_body2.style.display='block';
				
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
				else if(person_num.innerText == "0")
				{
					alert("인원을 입력해 주세요!!");		
				}	
				else {
					// 이름, 인원, 보내는 곳 종류, 목표
					socket.send(input_text.value + "," + person_num.innerText + "," + 0 + "," + '${store_id}');
					input_text.value = "";
					person_num.innerText = 0;
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