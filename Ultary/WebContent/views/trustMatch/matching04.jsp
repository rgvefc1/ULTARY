<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,java.util.ArrayList,trust.model.vo.*"%>
<%
	Member m = (Member)request.getAttribute("m");
	ArrayList<Member> mark = (ArrayList<Member>)request.getAttribute("mark");
	ArrayList<TrustReview> trList = (ArrayList<TrustReview>)request.getAttribute("trList");
	Media proImg = (Media)request.getAttribute("proImg");
	ArrayList<Media> allImg = (ArrayList<Media>)request.getAttribute("allImg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티용</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>

	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching04.css">
	<style>

#map_div{
	width: 803px;
	height : 167px;
	text-align: center;
	background: whitesmoke;
}
/* #map{
	width:600px;
	height:350px;
	border: 4px solid skyblue;
	border-radius: 20px;
	margin-top: 20px;
	margin-left: 30px;
} */

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
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
	<section>
		 <div>
            <form action="<%= request.getContextPath() %>/DetailMatch.tu">
            <div id="matching">
			<h1 id="title">의뢰관리</h1>
			<p id="title-1">위탁 내용 상세보기와 진행사항을 보여드립니다.</p>
				<hr style="margin-left:10px;">
			<br clear="all">
			</div>
		<div id="page">
		<div id="page1">
			 <%if(proImg == null){ %>
			 	<img src="<%= request.getContextPath() %>/image/프로필.png" id="profile" class="profile-photo">
			 <%} else{ %>
			 	<img src="<%= request.getContextPath() %>/uploadFiles/<%=proImg.getWebName() %>" id="profile" class="profile-photo">
			 <%} %>
			<div id="page2">
			<span id="name"><p><b><%=m.getNickname() %></b></p></span>
			<%boolean a = false; %>
			<%for(int i=0;i<mark.size();i++){ %>
				<%if(mark.get(i).getMemberId().equals(loginUser.getMemberId())) {
					a = true;
					break;
				} else{
					a=false;
				}%>
			<%} %>	
			<%if(a){ %>
				<div id="mark" class="infobutton1">관심회원</div>
			<%} else{ %>
				<div class="infobutton1" onclick="markmem('<%=m.getMemberId()%>','<%=loginUser.getMemberId()%>);">관심등록</div>
			<%} %>
			<span id="address"><p><b><%=m.getAddress() %></b><p></span>
			</div>
			<script>
			function markmem(nick,memid){
				
				console.log(nick);
				
				$.ajax({
					url: 'markmember.mark',
					data: {markmem:nick, memberid:memid},
					success: function(data){
						console.log(data);
						alert('관심등록이 완료되었습니다.');
						location.reload(); 
					}
				});
			}
		</script>
		<hr>
		<h5 style="text-align:center;">주의사항</h5>
		<div id="detail" class="detail">
		<p>
			1. 울타리에서의  위탁요청시 요청자의 금전요구는 신고해주세요.<br>
			2. 해당 멤버의 주소는 개인정보 보호를 위해 동/읍까지만 노출됩니다.<br>
			3. 위탁요청의 경우 받아주는 사람의 일방적인 취소가 가능합니다. 
		</p>
		
		</div>
		
		<h5 style="text-align:center;">돌봄환경</h5>
		<hr>
		<div class=detail>
			<p><%=m.getTrustfield() %></p>
		</div>
		<h5 style="text-align:center;">거주지역</h5>
		<hr>
		</form>
		<div id="area">
			<div id="map" style="width: 803px; height: 250px;"></div>
							
			<div id="map"></div>
			
			<div id ="map_div">
				<div id ="map_content">
					 <form onsubmit="searchPlaces(); return false;"> 
					   <input type="text" id="keyword" value="<%=m.getAddress()%>"> 
					   <button type="submit" id='subBTn'>검색하기</button> 
					 </form> 
				</div>

				
			
			</div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=4aaf89e85083d844d407d2aefdb3b6e2&libraries=services"></script>
			<script>
			
			
			// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
			var infowindow = new kakao.maps.InfoWindow({zIndex:1});
			
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = {
			        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
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

		</div>
		<br>
		<hr>
		<br>
		<h5 style="text-align:center;">유의사항</h5>
		<div id="area1">
		<% if(m.getTrustAdd() == null) {%>
			유의 사항이 없습니다.
		<% } else{ %>
			<br>
			<h5 style="text-align:center"><%=m.getTrustAdd() %></h5>
		<% } %>
		</div>
		<h5 style="text-align:center;">위탁후기</h5>
		<hr>
		<div id="area2">
			<%if(trList.isEmpty()) {%>
				<div class="review">
					<h4 style="text-align:center">아직 받은 리뷰가 없습니다.</h4>
				</div>
			<%} else{ %>
			<%for(int i=0;i<trList.size();i++){ %>
			<div class="review">
				<% if(!allImg.isEmpty()){ 
						for(int j=0;j<allImg.size();j++){
						 if(j==allImg.size()-1){%>
						 <img id="profile" class="review-photo" src="<%= request.getContextPath() %>/image/프로필.png">
						 <%break;
						   }
						 Media cProimg = allImg.get(j);
						 if(cProimg.getMemberId().equals(m.getMemberId())){%>
						  <img id="profile" class="review-photo" src="<%= request.getContextPath() %>/uploadFiles/<%= cProimg.getWebName() %>">
						 <%break; 
						 } %>
						<%} %>
					<%} else{ %>
						 <img id="profile" class="review-photo" src="<%= request.getContextPath() %>/image/프로필.png">
					<%} %>
				
				<span class="point">
				<%for(int j=0;j<trList.get(i).getTrScore();j++){ %>
				★
				<%} %>
				</span>
				<br>
				<p class="review1">
				<%=trList.get(i).getTrContent() %>
				</p>			
			</div>
			<%} %>
			<%} %>
			
			
			<input type="hidden" id="memberid" name="memberid" value=<%=m.getMemberId() %>>
		</div>
		<button id="submit">위탁요청하기</button>
		</div>
	</div>
         </div>
				</section>
			</div>
			<footer style="height:100px"></footer>
		</div>
	</div>
</body>
</html>