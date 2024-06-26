<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%= request.getContextPath() %>/resources/css/member/info/common.css?after" rel="stylesheet"/>
<link href="<%= request.getContextPath() %>/resources/css/member/info/myBooking.css?after" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>
	$(document).ready( () => {
		console.log("userId : ", '${userId}')
		if ('${userId}' == "") {
			location.href = "/root";
		} else {
			$("#myBooking").css("font-weight", "bold");
			$("#myBooking").css("border-bottom", "2px solid #006ad5")
			$("#myBooking").css("margin-bottom", "6px")
	
			getBookingReady(1);
			getBookingAlready(1);			
		}
		
		$(".alreadyPageBtnA:disabled").css("color", "red");
	})
	var readyCurrentPage = 1;
	function getBookingReady(page) {
		readyCurrentPage = page;
	    $.ajax({
	        url: "bookingReady?page=" + page,
	        type: "get",
	        dataType: "json",
	        success: function(data) {
	            let content = ""; // content 변수를 초기화합니다.
	            let promises = []; // 모든 AJAX 요청을 관리하기 위한 배열을 선언합니다.
				
				if (data.count != 0) {
		            data.list.forEach(function(item, index) {
		                let date = new Date(item.date);
		                let bookingDate = (date.getFullYear() + '년 ') +
		                    ('0' + (date.getMonth() + 1)).slice(-2) + "월 " +
		                    ('0' + (date.getDate())).slice(-2) + "일 " +
		                    item.time;
	
		                // 각 예약 항목에 대한 HTML 생성을 비동기적으로 처리합니다.
		                let promise = $.ajax({
		                    url: "getStoreName?storeId=" + item.storeId,
		                    type: "get",
		        			async : false,
		                    dataType: "text"
		                }).then(function(result) {
		                    // AJAX 요청이 성공하면 content에 HTML을 추가합니다.
		                    content += `<div class="readyContentInfo">`;
		                    content += `<label class="bookingStoreName" title=`+result+`>`+result+`</label>`;
		                    content += `<label class="bookingStatusReady">방문 대기</label>`;
		                    content += `<a class="bookingDelete" onclick="readyBookingDelete(`+item.id+`)">X</a><br>`;
		                    content += `<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>`;
		                    content += `<label class="bookingDate">`+bookingDate+`</label><br>`;
		                    content += `<label class="bookingPerson">성인 `+item.person+`명</label>`;
		                    content += `<hr>`;
		                    content += `<label class="bookingStatusReviewReady">방문 후 리뷰 작성 가능</label>`;
		                    content += `</div>`;
		                }).catch(function(error) {
		                    console.log(error);
		                });
	
		                promises.push(promise); // promises 배열에 각 AJAX 요청을 추가합니다.
		            });
	
		            // 모든 AJAX 요청이 완료된 후에 UI를 업데이트합니다.
		            $.when.apply($, promises).then(function() {
		                $("#readyContent").html(content); // content를 readyContent에 추가합니다.
	
		                let readyWrapper = $("#bookContentReadyWrapper");
		                readyWrapper.find("#totalReadyPageMenu").remove();
	
		                if (data.totalPage != 1) {
							let pageNum = Math.floor((readyCurrentPage-1) / 10);
		                	
		                    let totalPage = `<div id="totalReadyPageMenu">`;
		                    totalPage += `<hr class="contentHr">`
		                    if ( pageNum != 0 && pageNum == (Math.floor((data.totalPage) / 10) )) {
		                    	console.log('asdf')
		                    	let i = (pageNum*10 + 1)
		                        totalPage += `<a class="readyPageBtnA" onclick="getBookingReady(`+(i-1)+`)">&lt;</a>`;
			                    for ( ; i <= data.totalPage; i++) {
			                        totalPage += `<a class="readyPageBtn" onclick="getBookingReady(`+i+`)">`+i+`</a>`;
			                    }
			                        totalPage += `<a class="readyPageBtnDisabled" disabled="true">></a>`;
		                    } 
		                    else if (pageNum != 0) {
		                    	console.log('testestsetsetse')
		                    	let i = (pageNum*10+1)
		                        totalPage += `<a class="readyPageBtnA" onclick="getBookingReady(`+(i-1)+`)"><</a>`;
			                    for ( ; i <= (pageNum * 10 + 10); i++) {
			                        totalPage += `<a class="readyPageBtn" onclick="getBookingReady(`+i+`)">`+i+`</a>`;
			                    }
			                    if (data.totalPage > ((pageNum+1)*10)) {
			                        totalPage += `<a class="readyPageBtnB" onclick="getBookingReady(`+(i)+`)">></a>`;
			                    } else {
			                        totalPage += `<a class="readyPageBtnDisabled" disabled="true">></a>`;
			                    }
		                    } 
		                    
		                    else {
		                    	console.log("asdfasdfasdfasdf")
		                    	let i = (pageNum + 1)
			                        totalPage += `<a class="readyPageBtnDisabled" disabled="true"><</a>`;
			                    for ( ; i <= data.totalPage; i++) {
			                        totalPage += `<a class="readyPageBtn" onclick="getBookingReady(`+i+`)">`+i+`</a>`;
			                        if (i == 10) break;
			                    }
		                    	if (data.totalPage > 10) {
			                        totalPage += `<a class="readyPageBtnB" onclick="getBookingReady(`+(i+1)+`)">></a>`;		                    		
		                    	} else {
		                    		totalPage += `<a class="readyPageBtnDisabled" disabled="true">></a>`;
		                    	}
		                    }
		                    
		                    
		                    totalPage += `</div>`;
		                    readyWrapper.append(totalPage);
		                } else {
		                	console.log("???")
							 let pageNum = Math.floor(readyCurrentPage / 10);
		                }
		                $(".readyPageBtn").eq(readyCurrentPage%10-1).css("color", "blue")
		                $(".readyPageBtn").eq(readyCurrentPage%10-1).css("border-bottom", "2px solid #7777ff")
		            });
				} else {
					$("#readyContent").html("예약내역이 없습니다.");
				}
	        },
	        error: function(error) {
	            console.log(error);
	        }
	    });
	}

	var alreadyCurrentPage = 1;
	function getBookingAlready(page) {
		alreadyCurrentPage = page;
		console.log("currentPage : ", alreadyCurrentPage)
		$.ajax({
			url : "bookingAlready?page="+page,
			type : "get",
			dataType : "json",
			success : function ( data ) {
				var content = "";
	            let promises = []; // 모든 AJAX 요청을 관리하기 위한 배열을 선언합니다.
	            if (data.count != 0) {
					data.list.forEach(function(item, index) {
						let date = new Date( item.date );
						let bookingDate = (date.getFullYear() + '년 ') + 
										('0' + (date.getMonth() + 1)).slice(-2) + "월 " +
										('0' + (date.getDate())).slice(-2) + "일 " +
										item.time;
						
						let promise = $.ajax({
							url : "getStoreName?storeId="+item.storeId,
							type : "get",
							async : false,
							dataType : "text"
						}).then(function (result) {
							console.log("result : ", result)
							content += `<div class="alreadyContentInfo">`
							content += `<label class="bookingStoreName" title=`+result+`>`+result+`</label>`
							content += `<label class="bookingStatusAlready">방문 완료</label>`
							content += `<a class="bookingDelete" onclick="alreadyBookingDelete(`+item.id+`)">X</a><br>`
							content += `<img class="bookingStoreImg" alt="" src="https://www.gyeongju.go.kr/upload/content/thumb/20200529/4368708A9CC649CDB1EC5DD0C389804C.jpg"><br>`
							content += `<label class="bookingDate">` + bookingDate + `</label><br>`
							content += `<label class="bookingPerson">성인 ` + item.person + `명</label>`
							content += `<hr>`
							if (item.status == 1) { // 리뷰 작성 가능 상태
								content += `<label class="bookingStatusReviewReady"><a href="review">후기 작성</a></label>`							
							} else if(item.status == 2) { // 후기 작성 완료된 상태
								content += `<label class="bookingStatusReviewComplete"><a href="review">후기 작성 완료</a></label>`
								content += `<label class="bookingStatusReviewScore">평점 : 3점</label>`
							} else { // 후기 작성 기간 만료된 상태
								content += `<label class="bookingStatusReviewTimeout">후기 작성 기간 만료</label>`
							}
							content += `</div>`					
						}).catch(function(error) {
		                    console.log(error);
		                });
						
						promises.push(promise)
					});
	
		            // 모든 AJAX 요청이 완료된 후에 UI를 업데이트합니다.
		            $.when.apply($, promises).then(function() {
		                $("#alreadyContent").html(content); // content를 readyContent에 추가합니다.
	
		                let alreadyWrapper = $("#bookContentAlreadyWrapper");
		                alreadyWrapper.find("#totalAlreadyPageMenu").remove();
		                if (data.totalPage != 1) {
							let pageNum = Math.floor((alreadyCurrentPage-1) / 10);
		                	
		                    let totalPage = `<div id="totalAlreadyPageMenu">`;
		                    totalPage += `<hr class="contentHr">`
		                    if ( pageNum != 0 && pageNum == (Math.floor((data.totalPage) / 10) )) {
		                    	let i = (pageNum*10 + 1)
		                        totalPage += `<a class="alreadyPageBtnA" onclick="getBookingAlready(`+(i-1)+`)">&lt;</a>`;
			                    for ( ; i <= data.totalPage; i++) {
			                        totalPage += `<a class="alreadyPageBtn" onclick="getBookingAlready(`+i+`)">`+i+`</a>`;
			                    }
			                        totalPage += `<a class="alreadyPageBtnDisabled" disabled="true">></a>`;
		                    } 
		                    else if (pageNum != 0) {
		                    	let i = (pageNum*10+1)
		                        totalPage += `<a class="alreadyPageBtnA" onclick="getBookingAlready(`+(i-1)+`)"><</a>`;
			                    for ( ; i <= (pageNum * 10 + 10); i++) {
			                        totalPage += `<a class="alreadyPageBtn" onclick="getBookingAlready(`+i+`)">`+i+`</a>`;
			                    }
			                    if (data.totalPage > ((pageNum+1)*10)) {
			                        totalPage += `<a class="alreadyPageBtnB" onclick="getBookingAlready(`+(i)+`)">></a>`;
			                    } else {
			                        totalPage += `<a class="alreadyPageBtnDisabled" disabled="true">></a>`;
			                    }
		                    } 
		                    
		                    else {
		                    	let i = (pageNum + 1)
			                        totalPage += `<a class="alreadyPageBtnDisabled" disabled="true"><</a>`;
			                    for ( ; i <= data.totalPage; i++) {
			                        totalPage += `<a class="alreadyPageBtn" onclick="getBookingAlready(`+i+`)">`+i+`</a>`;
			                        if (i == 10) break;
			                    }
		                    	if (data.totalPage > 10) {
			                        totalPage += `<a class="alreadyPageBtnB" onclick="getBookingAlready(`+(i+1)+`)">></a>`;		                    		
		                    	} else {
		                    		totalPage += `<a class="alreadyPageBtnDisabled" disabled="true">></a>`;
		                    	}
		                    }
		                    
		                    
		                    totalPage += `</div>`;
		                    alreadyWrapper.append(totalPage);
		                } else {
							 let pageNum = Math.floor(alreadyCurrentPage / 10);
		                }
		                $(".alreadyPageBtn").eq(alreadyCurrentPage%10-1).css("color", "blue")
		                $(".alreadyPageBtn").eq(alreadyCurrentPage%10-1).css("border-bottom", "2px solid #7777ff")
		            });
	            } else {
	            	$("#alreadyContent").html("예약 기록이 없습니다."); 
	            }
			},
			error : function (error) {
				console.log(error);
			}
		})
	}
	
	function readyBookingDelete(id) {
		let result = confirm("예약을 취소하시겠습니까?\n취소 후에는 재예약이 되지 않습니다.")
		if (result) {
			$.ajax({
				url : "readyBooking?bookId="+id,
				type : "delete",
				dataType : "text",
				success : function () {
					getBookingReady(readyCurrentPage);
				},
				error : function () {
					
				}
			}).then(function () {
				alert("삭제가 완료되었습니다.")
			})
		}
	}
	
	function alreadyBookingDelete(id) {
		let result = confirm("예약 기록을 삭제하시겠습니까?\n예약기록은 복구되지 않습니다.")
		if (result) {
			$.ajax({
				url : "alreadyBooking?bookId="+id,
				type : "delete",
				dataType : "text",
				success : function () {
					let alreadyContent = $(".alreadyContentInfo")
					console.log("alreadyContent : ", alreadyContent.length)
					if (alreadyContent.length == 1) {
						if (alreadyCurrentPage == 1) {
							getBookingAlready(1);							
						} else {
							getBookingAlready(alreadyCurrentPage-1);
						}
					} else {
						getBookingAlready(alreadyCurrentPage);						
					}
				},
				error : function () {
					
				}
			}).then(function () {
				alert("삭제가 완료되었습니다.")
			})
		}
	}

</script>

<%@ include file="../../mainPage.jsp" %>
</head>
<body>
	<div id="myPageWrapper">

		<%@ include file="./myPageMenu.jsp" %>
	
		<div id="myPageContentWrapper">
			<div id="bookContentReadyWrapper">
				<h3 class="contentTitle">방문 대기중인 예약</h3>
				<hr class="contentHr">
				<div id="readyContent">
				
				</div>
			</div>
			<div id="bookContentAlreadyWrapper">
				<h3 class="contentTitle">방문 완료된 예약</h3>
				<hr class="contentHr">
				<div id="alreadyContent">
					
				</div>
			</div>
		</div>
	</div>
</body>
</html>