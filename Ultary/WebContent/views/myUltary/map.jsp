<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>키워드로 장소검색하기</title>
<style>

#map_div{
   width: 670px;
   height : 450px;
   text-align: center;
   background: whitesmoke;
}
#map{
   width:600px;
   height:350px;
   border: 4px solid skyblue;
   border-radius: 20px;
   margin-top: 20px;
   margin-left: 30px;
}

#map_content{
    
}
#keyword{
   margin-top: 20px;
   width: 350px;
   border-radius: 20px;
}
#subBTn{
   background: skyblue;
   color : white;
   border-radius: 20px;
}

</style>    
</head>
<body>
<div id ="map_div">   
   <div id ="map_content">
      <form onsubmit="searchPlaces(); return false;">
         <input type="text" placeholder="키워드 or 주소를 입력하세요..." id="keyword" value="<%= addArr[1] %>" disabled="disabled"> 
         <button id='subBTn'>검색하기</button> 
      </form>
   </div>
   
   <div id="map"></div>
   

</div>
<script>
   $(function(){
      $('#subBTn').hide();
   });
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaf89e85083d844d407d2aefdb3b6e2&libraries=services"></script>
<script>


// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 


searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

 var keyword = document.getElementById('keyword').value;

 if (!keyword.replace(/^\s+|\s+$/g, '')) {
     alert('키워드를 입력해주세요!');
     return false;
 }

 // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
 ps.keywordSearch( keyword, placesSearchCB); 
}

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        var bounds = new kakao.maps.LatLngBounds();

        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);    
            bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
        }       

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
        map.setBounds(bounds);
    } 
}


// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
    
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
        infowindow.open(map, marker);
    });
}

/* 
우측 상단에 컨트롤러 추가
*/

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

//지도에 컨트롤을 추가해야 지도위에 표시됩니다
//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

</script>
</body>