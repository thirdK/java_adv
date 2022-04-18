<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f706e0719e45256070f1d933f2e70af4"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=APIKEY&libraries=services,clusterer,drawing"></script>
</head>
<body>

	<form action="mapShow.jsp">
		<input type="text" name="addr" id="ad">
		<input type="button" onclick="start();">
	</form>

</body>

<script>
	function start() {

		let ad = $('#ad').val();
		var geocoder = new kakao.maps.services.Geocoder();

		//주소로 좌표를 검색합니다
		geocoder.addressSearch(ad, function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === kakao.maps.services.Status.OK) {
				var xx = result[0].x;
				var yy = result[0].y;
				var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			}
		});
		
	}
</script>

</html>