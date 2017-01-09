<%@ page contentType="text/html; charset=UTF-8"%>
<div class="page-head content-top-margin">
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-sm-7">
				<ol class="breadcrumb">
					<li><a href="main.do">Home</a></li>
					<li class="active">오시는 길</li>
				</ol>
			</div>
		</div>
		<!-- /.row -->
	</div> 
	<!-- /.container -->
</div>

<div class="container" style="margin-top: 50px;">
	<div class="row">
		<div class="col-sm-8" style="margin-bottom: 200px;">
			<div id="map" style="width: 750px; height: 400px;"></div>
		</div>
		<div class="col-sm-4">
			<img src="build/img/logo.svg" alt="Sham Theme"><br>
			<h6>주 소 - 서울 강남구 역삼동 823-24 남도빌딩 3층</h6>
			<h6>전화번호 - 02-000-0000</h6>
			<h6>영업시간 - 평일/주말 : 오전 9시 ~ 오후 8시</h6>
			<br>
			<h5>주변버스</h5>
			<h6>역삼역(23-811~2) - 공항6000, 6020</h6>
			<h6>역삼역(23-283) - 간선146, 341, 360</h6>
			<h6>영동중앙교회(23-289) - 간선147, 242</h6>
		</div>
	</div>
</div>



<script
	src="//apis.daum.net/maps/maps3.js?apikey=bf9f0e0ff558efa5674adf1d88de87f5"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new daum.maps.LatLng(37.49904, 127.03293), // 지도의 중심좌표
		level : 2, // 지도의 확대 레벨
		mapTypeId : daum.maps.MapTypeId.ROADMAP
	// 지도종류
	};

	// 지도를 생성한다 
	var map = new daum.maps.Map(mapContainer, mapOption);

	// 지도 타입 변경 컨트롤을 생성한다
	var mapTypeControl = new daum.maps.MapTypeControl();

	// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
	map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

	// 지도에 확대 축소 컨트롤을 생성한다
	var zoomControl = new daum.maps.ZoomControl();

	// 지도의 우측에 확대 축소 컨트롤을 추가한다
	map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

	// 지도에 마커를 생성하고 표시한다
	var marker = new daum.maps.Marker({
		position : new daum.maps.LatLng(37.49903, 127.03290), // 마커의 좌표
		map : map
	// 마커를 표시할 지도 객체
	});

	// 마커 위에 표시할 인포윈도우를 생성한다
	var infowindow = new daum.maps.InfoWindow({
		content : '<div style="padding:5px;" align="center">남도빌딩 3층 Sham</div>' // 인포윈도우에 표시할 내용
	});

	// 인포윈도우를 지도에 표시한다
	infowindow.open(map, marker);
</script>
