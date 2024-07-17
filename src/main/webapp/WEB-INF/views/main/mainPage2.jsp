<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<c:set var="keyword" value="${param.keyword }" />
<c:set var="searchType" value="${param.searchType }" />
<c:set var="category" value="${param.category }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3/dist/js/splide.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da3de66ef64ff42d5b0dc40d2235b72a&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da3de66ef64ff42d5b0dc40d2235b72a"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/main/image_slide.js"></script>
<link href="https://fonts.googleapis.com/css?family=Black+Han+Sans:400" rel="stylesheet">
 
 <%@ include file="./header.jsp" %>
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:500px;}
#menu_wrap {position:absolute;top:0;left:0;bottom:0;width:250px;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
</style>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Black+Han+Sans:400');
@import url('https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap');


	.page{
		display:flex;
		flex-direction:column;
		min-height: 100vh;
	}
	.page{
		display:flex;
		flex-direction:column;
		min-height: 100vh;
	}
	.main-container{
		display: flex;
		flex:1;
		position: relative;
		height: 80vh;
		justify-content: center;
		padding:7rem;
		width: 100%;
	}
	
	/* left side store menu detail */
	
	/* left side ===== navbar */
	.main-items{
		display: flex;
		flex-grow: 1;
		height: 100%;
		flex-direction: column;
	}
	.left-item{
		flex-basis: 70%;
		max-width: 50%;
		height: 100%;
		display: flex;
	    flex-direction: column;
	}
	.nav-container{
		display: flex;
		flex-direction: row;
		width: 100%;
		margin-bottom: 20px;
	}
	.nav-main{
		display: flex;
		justify-content: center;
		align-items: center;
		margin-right: 70px;
		padding: 10px;
		width: calc(50% - 35px);
		height: 35px;
		border-radius: 10px;
		background: black;
		color: white;
	}
	.nav-item{
		margin: 0 20px;
		padding: 10px 20px;
		backgroud-color: black;
		font-size: 20px;
		font-family: 'Black Han Sans', sans-serif;
	}
	/* left side ===== navbar end */
	
	/* left side ===== db span */
	.location-condition{
		display: flex;
		/* justify-content: space-between; */
		width: 100%;
		margin-top: 20px;
	}
	.location-condition span:last-child{
		margin-right: 80px;
	}
	.loc_btn {
        padding: 10px 20px;
        background-color: #497671;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        z-index: 1000;
        margin-left: 300px;
     }
     .loc_btn1 {
        padding: 10px 20px;
        background-color: #497671;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        z-index: 1000;
        margin-left: 150px;
     }
     .loc_btn:hover, .loc_btn1:hover {
        background-color: black;
     }
	
	/* left side ===== db span end */
	
	/* left side ===== detail view */
	.menu-detail{
		/* max-width: 70%; */
		display: flex;
		flex-grow: 1;
		/* height: 500px; */
		flex-direction: row;
		position: relative;
		width: 100%;
		padding-top: 10%;
	}
	.detail-container-left{
		display: flex;
		flex-direction: column;
		/* width: 1200px; */
	}
	.menu-detail-imgBig{
		display: flex;
		flex: 1;
		width: 100%;
		height: 300px;
		position: relative;
		margin-bottom: 10px;
	}
	.imgBig{
		width: 450px;
		height: 300px;
		object-fit: fill;
	}
	.menu-detail-imgSmall{
		display: flex;
		justify-content: space-between;
		width: 450px;
		height: 140px;
	}
	.imgSmall1, .imgSmall2, .imgSmall3{
		width: 32%;
		height: auto;
		background-color: #f0f0f0;
		display: flex;
		align-items: center;
		justify-content:center;
	}
	.imgSmall{
		width: 150px;
		height: 100%;
		object-position: fill;
		margin-bottom: 10px;
	}
	.detail-container-right{
		display: flex;
		width: 80%;
		/* margin-right: 90px; */
		flex-direction: column;
		word-wrap: break-word;
		margin-left: 20px;
		font-family: 'Gamja Flower', cursive;
		font-size: 18px;
		flex-grow: 1;
		 justify-content: space-between;
	}
	.detail-link{
		font-family: 'Gamja Flower', cursive;
        font-size: 16px;
        color: cornflowerblue;
        text-decoration: none;
        padding: 10px 20px;
        /* border: 1px solid blue; */
        border-radius: 5px;
        display: inline-block;
        transition: background-color 0.3s;
        /* width: 120px; */
        align-self: flex-end;
        margin-top: auto; /* 위쪽 여백 자동으로 설정 */
        margin-right: 20px;
	}
	.detail-link:hover {
        background-color: cornflowerblue;
        color: white;
    }
	
	
	/* left side ===== detail view end */
	
	/* left side store menu detail end */
	
	/* right side store menu map */
	
	.right-itme{
		flex-basis: 30%;
		max-width: 50%;
		position: -webkit-sticky;
		position: sticky; 
		top: 0;
		height: calc(100vh - 100px); /* view height에서 footer 높이 제외 */
	}
	#map{
		top: 0;
		left: 0;
		bottom: 0;
		width: 750px;
		height: 950px;
		overflow: hidden;
	}
	
	/* right side store menu map end */
	
</style>
</head>
<body>
	<div class="page">
		<div class="main-container">
			<!-- ===== left side ===== -->
			<div class="main-items left-item">
				
				<!-- ===== navbar ===== -->
				<div class="nav-container">
					<nav class="nav-main">
						<div class="nav-item">인기순(평점)</div>
					</nav>
					<nav class="nav-main">
						<div class="nav-item">리뷰많은순</div>
					</nav>
				</div>
				
				<!-- ===== 위치가져오기, 상세보기 부분 ===== -->
				<div class="location-condition">
					<span>서울 종로구 계동 #한식</span>
					<button class="loc_btn" onclick="getLocation()">현 위치로 설정</button>
					<button class="loc_btn1" onclick="getOtherLocation()">다른 지역 선택</button>
				</div>
				
				<!-- ===== 메뉴 상세보기 부분 ===== -->
				<c:choose>
			    <c:when test="${not empty storeList}">
			        <c:forEach var="store" items="${storeList}" varStatus="status">
			            <div class="menu-detail">
			                <div class="detail-container-left">
			                
			                    <div class="menu-detail-imgBig">
								    <c:if test="${not empty storeImgList[status.index]}">
								        <img class="imgBig" src="${path}/main/download?fileName=${storeImgList[status.index].store_img_root}" alt="Store Image">
								    
								    </c:if>
								</div>
								<div class="menu-detail-imgSmall">
									<c:forEach var="smallImg" items="${storeSmallImgList}" begin="1" end="3">
								        <c:if test="${not empty smallImg}">
								            <div class="imgSmall1${status.index }">
								                <img class="imgSmall" src="${path}/main/download?fileName=${smallImg.store_img_root}" alt="Store Menu Image">
								            </div>
								        </c:if>
								  	</c:forEach>
								</div>

			                </div>
                                <div class="detail-container-right">
                                    <c:if test="${not empty store.store_name}">
                                        <span>가게 이름 : ${store.store_name}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_phone}">
                                        <span>전화번호 : ${store.store_phone}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_main_phone}">
                                        <span>대표 전화번호 : ${store.store_main_phone}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_add}">
                                        <span>주소 : ${store.store_add}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_add_info}">
                                        <span>상세 주소 : ${store.store_add_info}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_category}">
			                        <span>카테고리 : 
			                        <c:set var="seenCategories" value="" />
			                        
			                        <!-- 특정 카테고리로 검색 시 -->
			                        <c:forEach var="category" items="${fn:split(store.store_category, '/')}">
			                            <c:if test="${fn:contains(category, param.keyword)}">
			                                <c:if test="${not fn:contains(seenCategories, category)}">
			                                    <c:if test="${!empty seenCategories}">
			                                        /
			                                    </c:if>
			                                    ${category}
			                                    <c:set var="seenCategories" value="${seenCategories}${category}/" />
			                                </c:if>
			                            </c:if>
			                        </c:forEach>
			                        
			                        <!-- "ALL" 또는  메뉴 이름으로 검색 시 모든 카테고리 출력 -->
			                        <c:if test="${param.searchType == 'menu_name' || param.searchType == 'all' || param.searchType == null}">
			                            <c:forEach var="category" items="${fn:split(store.store_category, '/')}">
			                                <c:if test="${not fn:contains(seenCategories, category)}">
			                                    <c:if test="${!empty seenCategories}">
			                                        /
			                                    </c:if>
			                                    ${category}
			                                    <c:set var="seenCategories" value="${seenCategories}${category}/" />
			                                </c:if>
			                            </c:forEach>
			                        </c:if>
			                        </span><br>
			                 	    </c:if>
                                    <c:if test="${not empty store.store_note}">
                                        <span>메모 : ${store.store_note}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_introduce}">
                                        <span>소개 : ${store.store_introduce}</span><br>
                                    </c:if>
                                    <c:if test="${not empty store.store_business_hours}">
                                        <span>영업 시간 : ${store.store_business_hours}</span><br>
                                    </c:if>
                                    <a href="${path}/store" class="detail-link">상세 페이지로 이동</a>
                                </div>
                            </div>
                        </c:forEach>
                    </c:when>
                    <c:otherwise>
                        <br><br><p>검색 결과가 없습니다.</p>
                    </c:otherwise>
                </c:choose>
            </div>
			
			<!-- ===== right side ===== -->
	        <div class="main-items right-itme">
	            <div class="map_wrap">
	                <div id="map"></div>
	                
	                <div id="menuDiv">
	                
	                <div id="menu_wrap" class="bg_white">
	                    <div class="option">
	                        
	                        <div id="map_title">
	                        	<div>맛집</div>
	                        </div>
	                        
	                            <form id="searchForm" onsubmit="searchPlaces(); return false;">
	                                키워드 : 
	                                <input type="text" id="keyword" size="15" onChange="onchangeSearch(event)"> 
	                                <!-- <datalist id="addressList"></datalist> -->
	                                <button id="submit_btn" type="submit">검색하기</button> 
	                            </form>
	                        </div>
	                    </div>
	                    <hr>
	                    <ul id="placesList"></ul>
	                    <div id="pagination"></div>
	                </div>
	            </div>
	            
	            </div>
	            
	        </div>
	    </div>
	</div>
<%@ include file="./footer.jsp" %> 
</body>
</html>
 
<script type="text/javascript">

let markers = [];
let ps;
let map;
let infowindow = new kakao.maps.InfoWindow({zIndex:1});

let search = "";
let isOpen = true;

function onchangeSearch(event) {
	search = event.target.value;
};

function onClickSearchBarOpen() {
	isOpen = !isOpen;
};



document.addEventListener("DOMContentLoaded", function(){
	markerFunction();
	
	document.getElementById("searchForm").addEventListener("submit", function(e){
		e.preventDefault();
		searchPlaces();
	});
});




// document.addEventListener("DOMContentLoaded", function() {
//     // 초기 지도 설정
//     const mapContainer = document.getElementById('map'),
//         mapOption = {
//             center: new kakao.maps.LatLng(37.5665, 126.9780), // 초기 중심좌표 (서울 중심으로 설정)
//             level: 3 // 지도의 확대 레벨
//         };

//     map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
//     ps = new kakao.maps.services.Places(); // Places 서비스 초기화

//     // 초기 검색
//     searchPlaces();

//     // 검색 폼 서브밋 이벤트 추가
//     document.getElementById("searchForm").addEventListener("submit", function(e) {
//         e.preventDefault();
//         searchPlaces();
//     });
// });


function markerFunction() {
	const key = '<c:out value="${keyword}"/>'; 
	const ser = '<c:out value="${searchType}"/>';
	const cat = '<c:out value="${category}"/>';
	
	fetch("http://localhost:8080/root/mainAPI/storeList?keyword="+ key + "&searchType=" + ser + "&category=" + cat, {
		headers : {"Content-Type": "application/json"},
	})
    .then((response) => {
    	if(!response.ok){
    		throw new Error('Network response was not ok' + response.statusText);
    	}
    	return response.json();
    })
    .then((res) => {
    	console.log("Store List : ",res);
    	
//     	const addressList = document.getElementById('addressList');
//     	if(addressList){
//     	addressList.innerHTML = ''; //기존 리스트 초기화
//     	}
    	
    	const placesList = document.getElementById('placesList');
    	if(placesList){
        placesList.innerHTML = ''; // 기존 리스트 초기화
    	}
    	
        const mapContainer = document.getElementById('map'), // 지도를 표시할 div
            mapOption = { 
                center: new kakao.maps.LatLng(37.5665, 126.9780), // 초기 중심좌표 (서울 중심으로 설정)
                level: 3 // 지도의 확대 레벨
            };

        map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        ps = new kakao.maps.services.Places(); // Places 서비스 초기화
	
        const bounds = new kakao.maps.LatLngBounds(); // 지도 경계 객체 생성

        const promises = res.map((store, index) => {
            return fetch("https://dapi.kakao.com/v2/local/search/address.json?query=" + store.store_add, {
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": "KakaoAK a3c83c3855b79edaedc0687b23adb436"
                }
            })
            .then((response) => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then((data) => {
                console.log("Address Data for store: ", store.store_name, data);
                if (data.documents.length > 0) {
                    const roadAddress = data.documents[0].road_address || data.documents[0].address;
                    const x = roadAddress.x;
                    const y = roadAddress.y;

                    //주소 목록에 추가
//                     if(addressList){
//                     const option = document.createElement('option');
//                     option.value = store.store_add;
//                     addressList.appendChild(option);
//                     }

                    // 검색 결과 목록에 추가
                    if(placesList){
                    const listItem = getListItem(index, {
                        place_name: store.store_name,
                        road_address_name: store.store_add,
                        address_name: store.store_add_info,
                        phone: store.store_phone
                      });
//                    const listItem = document.createElement('li');
//                     listItem.innerHTML = `
//                         <div class="item">
//                             <span class="markerbg marker_${index + 1}"></span>
//                             <div class="info">
//                                 <h5>${store.store_name}</h5>
//                                 <span>${store.store_add}</span>
//                                 <span class="tel">${store.store_phone}</span>
//                             </div>
//                         </div>`;
                    placesList.appendChild(listItem);
                    }

                    return {
                        position: new kakao.maps.LatLng(y, x),
                        name: store.store_name,
                        address: store.store_add // 주소 추가
                    };
                }
            })
            .catch((error) => {
                console.error("Error fetching address data for store: ", store.store_name, error);
            });
        });

        Promise.all(promises).then(locations => {
            locations.forEach(loc => {
                if (loc) {
                    console.log("Adding marker: ", loc);
                    const marker = new kakao.maps.Marker({
                        map: map,
                        position: loc.position
                    });

                    const infowindow = new kakao.maps.InfoWindow({
                        content: '<div>' + loc.name + '<br>' + loc.address + '</div>' // 주소 추가
                    });

                    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
                    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));

                    // 지도 경계에 마커의 위치를 포함시킴
                    bounds.extend(loc.position);

                    // 모든 마커를 포함하는 경계로 지도 범위 설정
                    map.setBounds(bounds);
                }
            });
        }).catch((error) => {
            console.error("Error in Promise.all: ", error);
        });
    })
    .catch((error) => {
        console.error("Error fetching store list: ", error);
    });
}

function makeOverListener(map, marker, infowindow) {
    return function() {
        infowindow.open(map, marker);
    };
}

function makeOutListener(infowindow) {
    return function() {
        infowindow.close();
    };
}




 markers = [];

// const container = document.getElementById("map");
// const options = {
// 		center : new window.kakao.maps.LatLng(37.5665, 126.9780),
// 		level: 3,
// };

//  map = new window.kakao.maps.Map(container, options);
//  ps = new window.kakao.maps.services.Places();
//  infowindow = new kakao.maps.InfoWindow({zIndex:1});


const markerPosition = new window.kakao.maps.LatLng(
		37.5665, 
		126.9780
);
const marker = new window.kakao.maps.Marker({
		position: markerPosition,
});
marker.setMap(map);


// ?
const searchForm = document.getElementById("submit_btn");
searchForm?.addEventListener("click", function(e){
	e.preventDefault();
	searchPlaces();
});


function searchPlaces(){
	const keyword= document.getElementById("keyword").value;
	
	if (!keyword.replace(/^\s+|\s+$/g, "")) {
		alert("키워드를 입력해주세요!");
		  
			return false;
		}
		console.log("searchPlaces 호출됨");
		ps.keywordSearch(keyword, placesSearchCB);
}


function placesSearchCB(data, status, pagination) {
	console.log("placesSearchCB호출");
    if (status === window.kakao.maps.services.Status.OK) {
    	console.log("검색 결과 : ", data);
      displayPlaces(data);

      displayPagination(pagination);

      const bounds = new window.kakao.maps.LatLngBounds();
      for (let i = 0; i < data.length; i++) {
        displayMarker(data[i]);
        bounds.extend(new window.kakao.maps.LatLng(data[i].y, data[i].x));
      }

      map.setBounds(bounds);
    } else if (status === window.kakao.maps.services.Status.ZERO_RESULT) {
      alert("검색 결과가 존재하지 않습니다.");
    } else if (status === window.kakao.maps.services.Status.ERROR) {
      alert("검색 결과 중 오류가 발생했습니다.");
    }
  }


// ?
function displayMarker(place) {
    const marker = new window.kakao.maps.Marker({
      map,
      position: new window.kakao.maps.LatLng(place.y, place.x),
    });
    window.kakao.maps.event.addListener(
      marker,
      "click",
      function (mouseEvent) {
        infowindow.setContent(`
        <span>
        ${place.store_name}
        </span>
        `);
        infowindow.open(map, marker);
        const moveLatLon = new window.kakao.maps.LatLng(place.y, place.x);
        map.panTo(moveLatLon);
      }
    );
  }


function displayPlaces(places) {
    const listEl = document.getElementById("placesList");
    const menuEl = document.getElementById("menu_wrap");
    const fragment = document.createDocumentFragment();
    const bounds = new window.kakao.maps.LatLngBounds();
    listStr='';
    
    removeAllChildNods(listEl);
    removeMarker();
    
    console.log("displayPlace 호출");
    for (let i = 0; i < places.length; i++) {
      const placePosition = new window.kakao.maps.LatLng(places[i].y, places[i].x);
      const marker = addMarker(placePosition, i);
      const itemEl = getListItem(i, places[i]);
      bounds.extend(placePosition);
      
      (function (marker, title) {
        window.kakao.maps.event.addListener(marker, "mouseover", function () {
            displayInfowindow(marker, title);
          });

        window.kakao.maps.event.addListener(marker, "mouseout", function () {
            infowindow.close();
          });

        itemEl.onmouseover = function () {
        	displayInfowindow(marker, title);
        };
        itemEl.onmouseout =  function () {
            infowindow.close();
        };
      })(marker, places[i].place_name);

      fragment.appendChild(itemEl);
    }

    listEl?.appendChild(fragment);
    menuEl.scrollTop = 0;

    map.setBounds(bounds);
  }


// ?
// window.kakao.maps.event.addListener(
//         marker,
//         "mouseover",
//         function () {
//           displayInfowindow(marker, title);
//         }
//       );
// window.kakao.maps.event.addListener(
//         marker,
//         "mouseout",
//         function () {
//           infowindow.close();
//         }
//       );



function getListItem(index, places) {
	console.log("getlistitem 호출");
	const el = document.createElement("li");
	let itemStr = '<span class="markerbg marker_' + (index + 1) +'"></span>' + 
					'<div class="info">' + 
					"<h5>" + places.place_name + "</h5>";
		if (places.road_address_name) {
            itemStr += "    <span>" + places.road_address_name + "</span>" +
             			 '   <span class="jibun gray">' +
           			   `<img src="https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png"></img>`
              			+ places.address_name + "</span>";
          } else {
            itemStr += "<span>" + places.address_name + "</span>";
          }

          itemStr +=
            '  <span class="tel">' + places.phone + "</span>" + "</div>";

          el.innerHTML = itemStr;
          el.className = "item";

          return el;
        }



function addMarker(position, idx) {
    const imageSrc =
      "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png";
    const imageSize = new window.kakao.maps.Size(36, 37);
    const imgOptions = {
      spriteSize: new window.kakao.maps.Size(36, 691),
      spriteOrigin: new window.kakao.maps.Point(0, idx * 46 + 10),
      offset: new window.kakao.maps.Point(13, 37),
    };

    const markerImage = new window.kakao.maps.MarkerImage(
      imageSrc,
      imageSize,
      imgOptions
    );

    const marker = new window.kakao.maps.Marker({
      position,
      image: markerImage,
    });

    marker.setMap(map);
    markers.push(marker);

    return marker;
  }



function removeMarker() {
    for (let i = 0; i < markers.length; i++) {
      markers[i].setMap(null);
    }
    markers = [];
  }

function displayPagination(pagination) {
    const paginationEl = document.getElementById("pagination");
    const fragment = document.createDocumentFragment();
    while (paginationEl?.hasChildNodes()) {
      paginationEl.removeChild(paginationEl.lastChild);
    }

    for (let i = 1; i <= pagination.last; i++) {
      const el = document.createElement("a");
      el.href = "#";
      el.innerHTML = String(i);

      if (i === pagination.current) {
        el.className = "on";
      } else {
        el.onclick = (function (i) {
          return function () {
            pagination.gotoPage(i);
          };
        })(i);
      }

      fragment.appendChild(el);
    }
    paginationEl?.appendChild(fragment);
  }
  
  
  
function displayInfowindow(marker, title) {
    const content =
      '<div style="padding:5px;z-index:1;">' + title + "</div>";

    infowindow.setContent(content);
    infowindow.open(map, marker);
  }


function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
      el.removeChild(el.lastChild);
    }
  }
  
  



</script>








