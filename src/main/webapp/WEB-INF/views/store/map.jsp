<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <c:set var="path" value="<%= request.getContextPath() %>" />
    <c:set var="storeAdd" value="${storeAdd}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
let storeAdd = '${storeAdd}';
</script>
<link rel="stylesheet" type="text/css" href="${path}/resources/css/businessM/businessMstore.css?after">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f96a93ad7623e257e539c299c4c8fcb6&libraries=services"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f96a93ad7623e257e539c299c4c8fcb6"></script>
<script type="text/javascript" src="${path}/resources/js/store/storeMap.js"></script>

</head>
<body>

<h1>지도 페이지입니다</h1>
${stoerAdd}
<div id="map"></div>
</body>
</html>