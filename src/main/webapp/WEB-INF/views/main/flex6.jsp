<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <c:set var="path" value="<%= request.getContextPath() %>" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.card-item{
		display: flex;
		flex-direction: column;
		margin-bottom: 2rem;
	}
	.card-image{
		height: 0px;
		padding-bottom: 60%;
		background-color: lightgray;
		background-repeat: no-repeat;
		background-position: center;
		background-size: cover;
	}
	.card-image img{
		display: none;
	}
	.card-desc{
		padding: 1em;
		background: yellow;
		flex: 1 1 auto;
	}
	
	@media (min-width:300px){
		.card-list-con{
			overflow-x : hidden;
		}
		.card-list{
			display: flex;
			flex-wrap: wrap;
			margin:0 -1rem;
		}
		.card-item{
			width:50%;
			padding: 0 1rem;
		}
	}
	
	@media (min-width:500px){
		.card-item{
			width:33.3333%;
		}
	}
</style>
</head>
<body>
	<div class="card-list-con">
	<ul class="card-list">
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfadkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
		<li class="card-item">
			<figure class="card-image" style="background-image: url(resources/img/main/맛집02.jpg)">
				<img src="${path}/resources/img/main/맛집02.jpg">
			</figure>
			<div class="card-desc">
				dkssusdkf lalkdj flkjsadfkla 
				falksdj awfj efpo;wa fj wfjadfa
			</div>
		</li>
	</ul>
	</div>
</body>
</html>