<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html id="html">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
*{
	margin: 0;
	padding: 0;
}
.booking_button {
	width: 65px;
	height: 30px;
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
}
.side_bar {
	display: flex;
	justify-content: center;
	position: absolute;
	right: 0;
	top: 56px;
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
}

.display_booking {
	width: 80%;
}

.booking_wrapper {
	margin-top: 7px;
	border-radius: 8px;
	width: 80%;
	height: 70px;
	background-color: yellow;
	overflow: hidden;
	transition: 0.5s;
}
.booking_focus_in {
	height: 170px;
	background-color: red;
}

.tab_wrapper {
	text-align: center;
	background-color: red;
}

.table {
	width: 200px;
	height: 100px;
	position: absolute;
	background-color: white;
	border: 1px solid black;
	border-radius: 5px;
}

.public_booking_wrapper{
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}
</style>

</head>
<body id="body">
	<%@ include file="/WEB-INF/views/pos/common/pos_header.jsp"%>
	<div class="main_wrapper">
		<div class="main_layout">
			<div class="new" style="width: 100%">
				<p>신규 예약</p>
				<div class="public_booking_wrapper new_wrapper">
				
				</div>
			</div>
			<div class="save" style="width: 100%">
				<p>오늘 예약</p>
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
			<div id="wait" class="wait"></div>
		</div>
	</div>

	<script type="text/javascript">
		const body = document.getElementById("body");
		const main_layout = document.querySelector(".main_layout");
		let sse = new EventSource("http://localhost:8080/root/con/connect?articleId=${UserID}");
		
		$(document).ready(function() {
			var realSize = window.innerHeight - 60;
			$(".main_wrapper").css("height", realSize);
			$(".main_layout").css("height", realSize);
			$(".main_wrapper").css("display", "block");
			$(".side_bar").css("height", realSize);
			
			todayReservation();
		})
		$(window).resize(function() {
			var realSize = window.innerHeight - 60;
			if (realSize > 0) {
				$(".side_bar").css("height", realSize);
				$(".main_layout").css("height", realSize);
				$(".main_wrapper").css("height", realSize);
			}
		});
		
		sse.addEventListener('connect', (e) => {
			const {data : receivedConnectData } = e;
			console.log('connect data: ', receivedConnectData);			
		})
		
		sse.addEventListener('newBooking', (e) => {
			let data = JSON.parse(e.data);
			console.log(data);
			
			const div_booking_wrapper = document.createElement('div');
			
			const p_booking_id = document.createElement('p');
			const p_booking_date = document.createElement('p');
			const p_booking_person = document.createElement('p');
			const p_booking_phone = document.createElement('p');
			const p_member_id = document.createElement('p');
			
			p_booking_id.innerText = "예약번호 : " + data.booking_id;
			p_booking_date.innerText ="예약일 : " + data.booking_date_booking;
			p_booking_person.innerText ="인원 : " + data.booking_person;
			p_booking_phone.innerText = "전화번호 : " + data.phone;
			p_member_id.innerText = "아이디 : " + data.member_id;
			
			const button_wrapper = document.createElement('div');
			const accept_button = document.createElement('button');
			const cancel_button = document.createElement('button');
			
			button_wrapper.classList.add("button_wrapper");
			
			accept_button.innerText = "저장하기";
			cancel_button.innerText = "취소하기";
			
			
			// 클래스 추가
			accept_button.classList.add("booking_button");
			cancel_button.classList.add("booking_button");
			
			accept_button.classList.add("border_radius");
			cancel_button.classList.add("border_radius");
		
			button_wrapper.appendChild(accept_button);
			button_wrapper.appendChild(cancel_button);
			
			div_booking_wrapper.appendChild(p_booking_id);
			div_booking_wrapper.appendChild(p_booking_date);
			div_booking_wrapper.appendChild(p_booking_person);
			div_booking_wrapper.appendChild(p_booking_phone);
			div_booking_wrapper.appendChild(p_member_id);
			
			div_booking_wrapper.appendChild(button_wrapper);
				
			div_booking_wrapper.classList.add('booking_wrapper');
			div_booking_wrapper.setAttribute("data-id", data.booking_id);
			
			const new_wrapper = document.querySelector(".new_wrapper");
			
			new_wrapper.appendChild(div_booking_wrapper);
			
			
		})

		
		body.addEventListener(
						"click",
						function(event) {
							let parent = event.target;
							const wait = document.getElementById('wait');
							
							for (let i = 0; i < 6; i++) {
								if (parent.classList.contains("parent_wait")) {
									wait.style.width = "300px";
									break;
								} else {
									if (parent.getAttribute("id", "body") == "body") {
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
				else{
					parent = parent.parentElement;
				}
			}
			
			
		})
		
		// 오늘 예약 가져오기
		function todayReservation() {
			fetch("http://localhost:8080/root/api/todayReservation")
			.then((response) => response.json())
			.then((data) => {
				console.log(data);
			})
		}
		
	</script>
</body>
</html>