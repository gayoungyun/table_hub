<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script  type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@3/dist/js/splide.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da3de66ef64ff42d5b0dc40d2235b72a"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=da3de66ef64ff42d5b0dc40d2235b72a&libraries=services"></script>
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
		justify-content: space-between;
		width: 100%;
		margin-top: 20px;
	}
	.location-condition span:last-child{
		margin-right: 80px;
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
		max-width: 100%;
		max-height: 100%;
		/* object-fit: contain; */
	}
	.menu-detail-imgSmall{
		display: flex;
		justify-content: space-between;
		width: 100%;
	}
	.imgSmall1, .imgSmall2, .imgSmall3{
		width: 32%;
		/* height: 100px; */
		height: auto;
		background-color: #f0f0f0;
		display: flex;
		align-items: center;
		justify-content:center;
	}
	.imgSmall{
		width: 100%;
		height: 100%;
		object-position: fill;
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
        /* text-decoration: none; */
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
					<span>상세조건</span>
				</div>
				
				<!-- ===== 메뉴 상세보기 부분 ===== -->
				
				 <c:forEach var="store" items="${storeList}">
				  
				  
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
					    <c:if test="${not empty store.store_name}">
					        <span>가게 이름: ${store.store_name}</span><br>
					    </c:if>
					    <c:if test="${not empty storeInfo.store_phone}">
					        <span>전화번호: ${storeInfo.store_phone}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_main_phone}">
					        <span>대표 전화번호: ${store.store_main_phone}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_add}">
					        <span>주소: ${store.store_add}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_add_info}">
					        <span>상세 주소: ${store.store_add_info}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_category}">
					        <span>카테고리: ${store.store_category}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_note}">
					        <span>메모: ${store.store_note}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_introduce}">
					        <span>소개: ${store.store_introduce}</span><br>
					    </c:if>
					    <c:if test="${not empty store.store_business_hours}">
					        <span>영업 시간: ${store.store_business_hours}</span><br>
					    </c:if>
					    <a href="${path}/main/mainPage2?store_id=${store.store_id}" class="detail-link">상세 페이지로 이동</a>
					</div>
				</div>
			
				
				</c:forEach>
				
			
			
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
						<span>음식이름aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaa</span>
					</div>
				</div>
			
				<div class="menu-detail">
					<div class="detail-container-left">
						<div class="menu-detail-imgBig">
							<img class="imgBig" src="${path }/resources/img/main/car01.png">
						</div>
						<div class="menu-detail-imgSmall">
							<div class="imgSmall1">
								<img class="imgSmall" src="${path }/resources/img/main/맛집01.jpg">
							</div>
							<div class="imgSmall2">
								<img class="imgSmall" src="${path }/resources/img/main/맛집02.jpg">
							</div>
							<div class="imgSmall3">
								<img class="imgSmall" src="${path }/resources/img/main/맛집03.jpg">
							</div>
						</div>
					</div>
					<div class="detail-container-right">
						<span>음식이름aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa
						aaaaaaaaaaaaaaaaaaaa</span>
					</div>
				</div>
			</div>
			
			<!-- ===== right side ===== -->
			<div class="main-items right-itme">
				<div class="map_wrap">
    <div id="map"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                    키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> 
                    <button type="submit">검색하기</button> 
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
</body>
 <%@ include file="./footer.jsp" %> 
</html>

<script type="text/javascript">
	
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}
	
</script>





