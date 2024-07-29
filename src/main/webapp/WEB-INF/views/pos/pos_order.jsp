<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="html">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}
#html {
	display: block;
	overflow: hidden;
}
.showIn {
	animation-duration: 2s;
	animation-name: slidein;
}

.showOut {
	animation-duration: 2s;
	animation-name: slideout;
}

.showDown {
	animation-duration: 2s;
	animation-name: slidedown;
}

.showUp {
	animation-duration: 2s;
	animation-name: slideup;
}

@keyframes slidein {
	from {
		margin-left: 100vw;
		width: 80%;
	}
	
	to {
		margin-left: 0vw;
		width: 80%;
	}
}

@keyframes slideout {
	from {
		margin-left: 0vw;
		width: 80%;
	}
	
	to {
		margin-left: 200vw;
		width: 80%;
	}
}

@keyframes slidedown {
	from {
		margin-top: 0%;
	}	
	to {
		margin-top: 100%;
	}
}
@keyframes slideup {
	from {
		margin-top: 100%;
	}	
	to {
		margin-top: 0%;
	}
}


.booking_button {
	width: 65px;
	height: 30px;
	
	cursor : pointer
}

.border_radius {
	border-radius: 10px;
}
.button_wrapper {
	margin-top:10px;
	width: 100%;
	display: flex;
	justify-content: space-around;
	border-radius: 10px;
}
.show_booking > p{
	font-size: 20px;
	padding-left: 7%;
	padding-top: 10px;
}

.span_booking {
	padding 3px;
	margin: 3px;
}

.main_wrapper {
	margin: 0;
	padding: 0;
	width: 100%;
	height: 100%;
	box-sizing: border-box;
}

.main_layout {
	display: inline-block;
	width: 100%;
	position: relative;	
	overflow-x: hidden;
	background-color: #a9a9a9;
}

.side_bar {
	display: flex;
	justify-content: center;
	position: absolute;
	right: 0;
	top: 57px;
}

.side_tab_menu {
	display: inline-block;
	width: 50px;
}

.right {
	float: right;
}
.wait{
	display: flex;
	flex-direction: column;
	height: 100%;
	width: 0;
	background-color: blue;
	overflow-x: hidden;
	transition: 0.5s;
	flex-direction: column;
	align-items: center;
	justify-content: flex-start;
	overflow-x: hidden;
	overflow-y: auto;
}

.booking_wrapper >p {
	padding-top: 3px;
	padding-left: 5px;
}

.display_booking {
	width: 80%;
}

.booking_wrapper {
	position: relative;
	margin-top: 7px;
	border-radius: 8px;
	width: 80%;
	height: 72px;
	background-color: #ffffff;
	overflow-y: clip;
	transition: 0.5s;
}
.all_booking{
	background-image: url('https://cdn-icons-png.flaticon.com/512/42/42449.png');
	background-size: cover;
	cursor : pointer;
	
	width: 50px;
	height: 50px;
	position: fixed;
	
	bottom: 15px;
	left: 15px;
	
}
.img_circle {
	position: absolute;
	top: 10px;
	right: 10px;
	
	width: 10px;
	height: 10px;
	
	border-radius: 50%;
	background-color: red;	
}

.booking_focus_in {
	height: 170px;
	background-color: #ffffff;
}

.tab_wrapper {
	text-align: center;
	background-color: red;
}

.public_booking_wrapper{
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.wait_table_wrapper {
	width: 200px;
	transition: 0.5s;
}
.wait_table {
	margin-top: 2px;
	display: flex;
	justify-content: space-between;
	width: 100%;
	background-color: red;
	border-radius: 8px;
}

.wait_table > div {
	height: 90px;
}

.wait_table_left {
	width: 130px;
}

.wait_table_right {
	width: 65px;
			
	display:flex;
	flex-direction: column;
	justify-content: space-around;
	align-items: center;
	
	margin-top: 5px;
}

.wait_table_right > button {
	border-radius: 8px;
	width: 50px;
}
.wait_accept {
	margin-top: 10px;
}
.wait_cancel {
	margin-bottom: 10px;
}
.wait_table_left > *{
	margin-left: 5px;
}
.wait_time_wrapper {
	width: 100%;
	display: flex;
	justify-content: space-between;
}

.point_yellow{
	color: #fa8a48;
}


</style>
</head>
<body id="body">
	<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>
	<div class="main_wrapper">
		<div class="main_layout">
			<div class="all_booking"></div>
			<div class="new show_booking" style="width: 100%">
				<p>신규 예약</p>
				<div class="public_booking_wrapper new_wrapper">
				
				</div>
			</div>
			<div class="save show_booking" style="width: 100%">
				<p>확정 예약</p>
				<div class="public_booking_wrapper save_wrapper">
				</div>
			</div>
		</div>
		<div class="side_bar right">
			<div class="side_tab_menu">
				<div class="tab_wrapper parent_wait">
					<p>대</p>
					<p>기</p>
					<p>현</p>
					<p>황</p>
				</div>
			</div>
			<div id="wait" class="wait">
				<div class="wait_table_wrapper">
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
	
	<script type="text/javascript">
	
		let socket = null;
		const body = document.getElementById("body");
		const main_layout = document.querySelector(".main_layout");
		let sse = new EventSource("/root/con/connect?articleId=${UserID}");	
		
		// 나중에 변경하기(넓이 지정 방식)
		$(document).ready(function() {
			var realSize = window.innerHeight - 57;
			$(".main_wrapper").css("height", realSize);
			$(".main_layout").css("height", realSize);
			$(".main_wrapper").css("display", "block");
			$(".side_bar").css("height", realSize);
			
			todayReservation();
			todayWaiting();
			connectWs();
		})
		$(window).resize(function() {
			var realSize = window.innerHeight - 57;
			if (realSize > 0) {
				$(".side_bar").css("height", realSize);
				$(".main_layout").css("height", realSize);
				$(".main_wrapper").css("height", realSize);
			}
		});
		
		// 소켓
		function connectWs(){
			console.log("tttttt")
			const ws = new SockJS("/root/send");
			socket = ws;
			console.log(socket);
			ws.onopen = function(e) {
				 console.log('open');
			};

			ws.onmessage = function(event) {
				const data = event.data.split(',');
				makeWaitTable(data[0], data[1], data[2], 0, 1);
			};

			ws.onclose = function(e) {
			    console.log('close');
			};
			
			ws.onerror = function(e) {
				console.log("error");
			}
		};

		sse.addEventListener('connect', (e) => {
			const {data : receivedConnectData } = e;
			console.log('connect data: ', receivedConnectData);			
		})
		
		sse.addEventListener('newBooking', (e) => {
			let data = JSON.parse(e.data);
			console.log(data);
			fetch("/root/api/bookingCount", {
				method : "POST",
				headers : {"Content-Type": "application/json",},
				body : JSON.stringify({
					"store_id" : data.store_id,
					"member_id": data.member_id
				})
			})
			.then((response) => response.json())
			.then((res) => {
				if(res != null)
				{
					data.review_count = res.review_count;
					console.log(res.review_count);
				}
					Reservation(data, 3);
			})	
		})
		
		body.addEventListener("click", function(event) {
							let parent = event.target;
							const wait = document.getElementById('wait');
							const wait_table_wrapper = document.querySelector('.wait_table_wrapper');
							for (let i = 0; i < 6; i++) 
							{
								if (parent.classList.contains("parent_wait")) 
								{
									console.log(parent.classList.contains("parent_wait"));
									console.log(parent);
									wait.style.width = "300px";
									
									break;
								}
								// 대기 테이블에 수락버튼을 클릭하면
								else if(parent.classList.contains('wait_accept'))
								{
									const wait_table_time = document.querySelectorAll('.wait_time');
									const wait_table = document.querySelectorAll('.wait_table');
									let wait_time;
									
									for(let i = 0; i < wait_table_time.length; i++)
									{
										if(wait_table_time[i].dataset.wait_num == parent.dataset.wait_num)
										{
											let data = wait_table_time[i].innerText.split(':');
											let wait_time = Number(data[0]) * 60 + Number(data[1]);
											
											console.log("히히히" + wait_time);
											console.log("히히히" + parent.dataset.wait_num);
											fetch("/root/api/wait1", {
												method : "PATCH",
												headers : {"Content-Type": "application/json",},
												body : JSON.stringify({
													"store_id" : '${UserID}',
													"wait_time": wait_time,
													"wait_num" : parent.dataset.wait_num
													})
												})
												.then((response) => response.json())
												.then((data) => {
													if(data == '1')
													{
														console.log("patch 성공!!");
													}
													else {
														console.log("patch 실패!!")
														console.log(data);
													}
												})
											wait_table[i].remove();
											
											// 소켓 전송
											socket.send(1 + "," + '${UserID}' + "," + parent.dataset.wait_num);		
											break;
										}	
									}
									break;
								}	
								else 
								{
									if (parent.getAttribute("id", "body") == "body") 
									{
										wait.style.width = "0";
										break;
									}
									parent = parent.parentElement;
								}
							}
		})
		// booking_wrapper에 클릭이 들어오면 
		main_layout.addEventListener("click", function(event) {
			let parent = event.target;
			
			for(let i = 0; i < 6; i++)
			{
				if(parent.classList.contains("booking_wrapper"))
				{
					const arr = parent.childNodes;
					
					// 빨간 점 없애는 반복문
					for(let j = 0; j < arr.length; j ++)
					{
						if(arr[j].classList.contains('img_circle'))
						{
							arr[j].classList.remove('img_circle');
							break;
						}
					}
					
					if(parent.classList.contains("booking_focus_in"))
					{
						parent.classList.remove("booking_focus_in");
						break;
					}
					const arr_booking = document.querySelectorAll(".booking_wrapper");
					for(let j = 0; j < arr_booking.length; j++ )
					{
						if(arr_booking[j].classList.contains("booking_focus_in"))
						{
							arr_booking[j].classList.remove("booking_focus_in");	
						}
					}
					
					parent.classList.add("booking_focus_in");
					break;
				}
				// 현제 부모가 main_layout 이라면 booking_wrapper가 클릭된게 아니니 종료
				else if(parent == event.currentTarget)
				{
					break;	
				}
				else if(parent.classList.contains("accept"))
				{
					acceptBooking(parent.getAttribute("data-value"));
					
					break;
				}
				else if(parent.classList.contains("cancel"))
				{
					console.log("취소 실행");
					cancelBooking(parent.getAttribute("data-value"));
					parent = parent.parentElement;
					parent = parent.parentElement;
					
					parent.classList.add("showOut");
					
					setTimeout(function() {
						parent.remove();
					}, 1500);
					
					break;
				}
				// 예약관리 버튼이 눌리면 !!!!!(추후 추가) !!!!!!!!!!
				else if(parent.classList.contains("management"))
				{
					const booking_id = parent.dataset.value;
					
					fetch("/root/api/bookingStatus", {
						method : "PATCH",
						headers : {"Content-Type": "application/json",},
						body : JSON.stringify({
							"booking_id" : booking_id,
							"booking_status": 1
						})
					})
					.then((response) => response.json())
					.then((data) => {
						if(data == '1')
						{
							const booking_wrapper = document.querySelectorAll('.booking_wrapper');
							
							for(let i = 0; i < booking_wrapper.length; i++)
							{
								if(booking_wrapper[i].dataset.id == booking_id)
								{
									booking_wrapper[i].remove();
								}
							}
						}
					})
					break;
				}
				else{
					parent = parent.parentElement;
				}
			}
		})
		// 오늘 대기 가져오기
		function todayWaiting() {
			fetch("/root/api/todayWait", {
				headers : {"Content-Type": "application/json",
							"store_id" : '${UserID}'},
			})
			.then((response) => response.json())
			.then((data) => {
				for(let i = 0; i < data.length; i++)
				{
					console.log(data[i]);
					makeWaitTable(data[i].wait_num, data[i].wait_name, data[i].person_num, data[i].wait_date, 0);	
				}
			})		
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
															
		// 대기 테이블 만들기(type == 0 이면 DB에서 읽어 오는값 아니면 소켓에서 가져오는값)
		// wait_date 값이 0이면 소켓에서 실시간으로 전송해 준 데이터;
		function makeWaitTable(wait_num, wait_name, person_num, wait_date, type) {
			
			const wait_table_wrapper = document.querySelector('.wait_table_wrapper');
			
			const table_wrapper = document.createElement('div');
			const div_left = document.createElement('div');
			const div_right = document.createElement('div');
			
			table_wrapper.classList.add("wait_table");
			
			div_left.classList.add("wait_table_left");
			div_right.classList.add("wait_table_right");
			
			const p_left_wait_num = document.createElement('p');
			p_left_wait_num.innerText = "대기번호 : " + wait_num;
			
			const p_left_wait_name = document.createElement('p');
			p_left_wait_name.innerText = "이름 : " + wait_name;
			
			const p_left_person_num = document.createElement('p');
			p_left_person_num.innerText = "인원 : " + person_num;
			
			const div_left_wait_time = document.createElement('div');
			div_left_wait_time.classList.add("wait_time_wrapper");
			
			const span_wait_time_first = document.createElement('span');
			
			span_wait_time_first.innerText = "대기시간 : ";
			const span_wait_time_set = document.createElement('span');
			
			if(wait_date == 0)
			{
				span_wait_time_set.innerText = "00:00";
			}
			else 
			{
				const sec = time(wait_date);
				span_wait_time_set.innerText = parseInt(sec/60) + ":" + sec%60;	
			}
			span_wait_time_set.classList.add('wait_time');
			span_wait_time_set.dataset.wait_num = wait_num;
			
			div_left_wait_time.appendChild(span_wait_time_first);
			div_left_wait_time.appendChild(span_wait_time_set);
			
			div_left.appendChild(p_left_wait_num);
			div_left.appendChild(p_left_wait_name);
			div_left.appendChild(p_left_person_num);
			div_left.appendChild(div_left_wait_time);
			
			// 버튼 만들기
			const accept_button = document.createElement('button');
			const cancel_button = document.createElement('button');
			
			accept_button.innerText = '입장';
			cancel_button.innerText = '취소';
			
			accept_button.dataset.wait_num = wait_num;
			cancel_button.dataset.wait_num = wait_num;
			
			accept_button.classList.add('wait_accept');
			accept_button.classList.add('wait_button');
			cancel_button.classList.add('wait_cancel');
			cancel_button.classList.add('wait_button');
			
			div_right.appendChild(accept_button);
			div_right.appendChild(cancel_button);
			
			table_wrapper.appendChild(div_left);
			table_wrapper.appendChild(div_right);
			
			wait_table_wrapper.appendChild(table_wrapper);
		}
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
		
		
		// 가게에서 예약 수락시
		function acceptBooking(booking_id) {	
			fetch("/root/api/bookingStatus", {
				method : "PATCH",
				headers : {"Content-Type": "application/json",},
				body : JSON.stringify({
					"booking_id" : booking_id,
					"booking_status": 4
				})
			})
			.then((response) => response.json())
			.then((data) => {
				if(data == 1) 
				{
					const save_wrapper = document.querySelector(".save_wrapper");
					const arr_booking_wrapper = document.querySelectorAll(".booking_wrapper");
					
					for(let i = 0; i < arr_booking_wrapper.length; i++)
					{
						if(arr_booking_wrapper[i].getAttribute("data-id") === booking_id && arr_booking_wrapper[i].parentElement.classList.contains("new_wrapper"))
						{
							arr_booking_wrapper[i].classList.add("showOut");
							setTimeout(function() {
								arr_booking_wrapper[i].classList.remove("showOut");
								
								// 버튼 변경
								const change_button = arr_booking_wrapper[i].lastChild.firstChild;
								change_button.classList.remove("accept");
								change_button.classList.add("management");
								
								change_button.innerText="예약관리";
								
								arr_booking_wrapper[i].classList.add("showIn");
								save_wrapper.appendChild(arr_booking_wrapper[i]);	
								
							}, 1500);
						}
					}
				}
				else{
					console.log("실패 3");
				}
			})
		}
		// 가게에서 예약 취소시
		function cancelBooking(data) {
			fetch("/root/api/bookingStatus", {
				method : "PATCH",
				headers : {"Content-Type": "application/json",},
				body : JSON.stringify({
					"booking_id" : data,
					"booking_status": 3
				})
			})
			.then((response) => response.json())
			.then((data) => {
				if(data == 1) 
				{
					console.log("성공 -1");	
				}
				else{
					console.log("실패 -1");
				}
			})	
		}
		
		// 오늘 예약 가져오기
		function todayReservation() {
			fetch("/root/api/todayReservation")
			.then((response) => response.json())
			.then((data) => {
				for(let i = 0; i < data.length; i++)
				{
					if(data[i].booking_status == 0)
					{
						Reservation(data[i], 0);
					}
					else if(data[i].booking_status == 4) {
						Reservation(data[i], 1);	
					}	
				}	
			})
		}
		
		// 신규 예약 쪽에 DOM객체로 생성
		function Reservation(data, num) {
			const div_booking_wrapper = document.createElement('div');
			
			const p_booking_id = document.createElement('p');
			const p_booking_date = document.createElement('p');
			
			const span_booking_person = document.createElement('span');
			const span_booking_time = document.createElement('span');
			const span_review_count = document.createElement('span');
			
			const p_booking_phone = document.createElement('p');
			const p_member_id = document.createElement('p');
			
			p_booking_id.innerText = "예약번호 : " + data.booking_id;
			p_booking_date.innerText ="예약일 : " + data.booking_date_booking;
			
			span_booking_person.innerText ="👦 " + data.booking_person + "명";
			span_booking_time.innerText = "⏰ " + data.booking_time;
			
			if(data.review_count >= 3)
			{
				span_review_count.innerText = "★" + data.review_count + "번째 방문";
				span_review_count.classList.add('point_yellow');	
			}
			else 
			{
				span_review_count.innerText = "☆" + data.review_count + "번째 방문";	
			}
			
			//span 클래스 추가
			span_booking_person.classList.add('span_booking');
			span_booking_time.classList.add('span_booking');
			span_review_count.classList.add('span_booking');
			
			p_booking_phone.innerText = "전화번호 : " + data.booking_phone;
			p_member_id.innerText = "아이디 : " + data.member_id;
			
			const button_wrapper = document.createElement('div');
			const accept_button = document.createElement('button');
			const cancel_button = document.createElement('button');
			
			button_wrapper.classList.add("button_wrapper");
			
			if(num == 0 || num == 3)
			{
				accept_button.innerText = "저장하기";
				accept_button.classList.add("accept");
				// 빨간원 생성
				if(num == 3)
				{
					const img_circle = document.createElement('div');
					img_circle.classList.add('img_circle');	
					
					// 빨간원 추가
					div_booking_wrapper.appendChild(img_circle);
				}
			}
			else
			{
				accept_button.innerText = "예약관리";				
				accept_button.classList.add("management");
			}
			
			cancel_button.innerText = "취소하기";
			
			accept_button.setAttribute('data-value', data.booking_id);
			cancel_button.setAttribute('data-value', data.booking_id);
			// 클래스 추가
			accept_button.classList.add("booking_button");
			cancel_button.classList.add("booking_button");
			cancel_button.classList.add("cancel");
			
			accept_button.classList.add("border_radius");
			cancel_button.classList.add("border_radius");
			
			// 버튼 자식 추가
			button_wrapper.appendChild(accept_button);
			button_wrapper.appendChild(cancel_button);
				
			div_booking_wrapper.appendChild(p_booking_id);
			
			div_booking_wrapper.appendChild(span_booking_person);
			div_booking_wrapper.appendChild(span_booking_time);
			div_booking_wrapper.appendChild(span_review_count);
			
			div_booking_wrapper.appendChild(p_member_id);
			div_booking_wrapper.appendChild(p_booking_date);
			div_booking_wrapper.appendChild(p_booking_phone);
			
			div_booking_wrapper.appendChild(button_wrapper);
				
			div_booking_wrapper.classList.add('booking_wrapper');
			div_booking_wrapper.setAttribute("data-id", data.booking_id);
			
			const new_wrapper = document.querySelector(".new_wrapper");
			const save_wrapper = document.querySelector(".save_wrapper");
			
			if(num == 0 || num == 3)
			{
				if(num == 3)
				{
					div_booking_wrapper.classList.add("showIn");	
				}
				new_wrapper.prepend(div_booking_wrapper);
			}
			else 
				save_wrapper.appendChild(div_booking_wrapper);
		}
		
	</script>
</body>
</html>