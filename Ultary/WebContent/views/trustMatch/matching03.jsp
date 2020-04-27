<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.*"%>
<%
	String petNum = (String)request.getAttribute("petNum");
	Member m = (Member)request.getAttribute("m");
	Pet pet = (Pet)request.getAttribute("pet");
	Media proImg = (Media)request.getAttribute("proImg");
	
	ArrayList<Pet> PetList = (ArrayList<Pet>)request.getAttribute("PetList");
	ArrayList<Media> MediaList = (ArrayList<Media>)request.getAttribute("MediaList");


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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching03.css">
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/tr_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/tr_aside.jsp" %>
				<section>
				
				
					<div>
            <form action="<%=request.getContextPath()%>/Tpostsend.tu" onsubmit="return datacheck();">
            <div id="matching">
				<h1 id="title">의뢰관리</h1>
				<p id="title-1">위탁 내용 상세보기와 진행사항을 보여드립니다.</p>
					<hr style="margin-left:10px;">
				<br clear="all">
				</div>
			<div id="page">
				<div id="page1">
					<div id="page2">
						<div id="page2-1">
							<%if(proImg == null){ %>
							 	<img src="<%= request.getContextPath() %>/image/프로필.png" id="userphoto" class="profile-photo">
							 <%} else{ %>
							 	<img src="<%= request.getContextPath() %>/uploadFiles/<%=proImg.getWebName() %>" id="userphoto" class="profile-photo">
							 <%} %>
							<h3 id="nick1"><%=m.getNickname() %><input type="hidden" name = "memberid" value="<%=m.getMemberId()%>"></h3>
						</div>
						<div id="page2-2">
							<h3 id="pcoment">님 에게 위탁 요청</h3>
						</div>
					</div>
					<div id= "page3">
						<div id="page3-1">
							<h3 style="text-align: center;">반려동물 정보</h3>
						</div>
						<% if(petNum == null){ %>
						<div id="pagepage">
							<table style="margin-left: 251px;">
								<tr>							
									<td>
									<img id="petplus" src="<%=request.getContextPath() %>/image/고양이.png">
									</td>
								</tr>
								<tr>
								<td>
									펫 선택하기
								</td>
								</tr>
							</table>
							
						<% }else{ %>
							<% for(int i=0;i<PetList.size();i++){ 
								if(PetList.get(i).getPetNum()==Integer.parseInt(petNum)){ 
									Pet p = PetList.get(i); %>
						<div id="page3-2">
							<table id="page3_table">
								<tr>
									<td class="page3_td"><div class="petname">반려동물 이름</div></td>
									<td><label><%= p.getPetName() %></label><input type="hidden" name="petnum" value="<%= p.getPetNum() %>"></td>
									
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 종류</div></td>
										<%String petKind="";
											switch(p.getPetKind()){
											case '1' : petKind="강아지"; break;
											case '2' : petKind ="고양이"; break;
											case '3' : petKind ="설치류"; break;
											case '4' : petKind ="물고기"; break;
											case '5' : petKind ="파충류"; break;
											case '6' : petKind ="조류"; break;
											case '7' : petKind = "기타"; break;
											
											}%>
									
									<td><label><%=petKind %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">성별</div></td>
									<td><label><%= p.getPetGender() %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 나이</div></td>
									<td><label><%= p.getPetage() %>살</label></td>
								</tr>
							</table>
						</div>
						<div id="page3-3">
							<% for(int j=0;j<MediaList.size();j++){ 
								if(p.getPetNum()== MediaList.get(j).getPetNum()){ %>
							<img src="<%= request.getContextPath() %>/uploadFiles/<%= MediaList.get(j).getWebName() %>" id="pet-photo">
								<% } %>
							<% } %>
						</div>
								<% } %>
							<% } %>
						<% } %>
						
<script>
   $(function(){
      $('#petplus').click(function(){
         window.open('<%= request.getContextPath()%>/tr.pet?memberid=<%= m.getMemberId() %>', 'pop', 'width=950', 'height=650');
      });
   });
</script>
					</div>
					<div id="page4">
						<table id="page4-in">
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">거주지역</div>
								</td>
								<td colspan ="2">
									<%=m.getAddress() %>
									<input type="hidden" id="address" name="address" value="<%=m.getAddress()%>">
							</tr>
						
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">돌봄기간</div>
								</td>
								<td>
									<label>시작날자</label><input type="date" name="startDate" id="startDate">
								</td>
								<td>
									<label>끝나는 날자</label><input type="date" name="endDate" id="endDate">
								</td>
							</tr>
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">위탁방식</div>
								</td>
								<td>
									<select id="select3" name ="trustmeans">
										<option hidden="hidden" selected value="">선택</option>
										<option value="2">방문돌봄</option>
										<option value="1">위탁돌봄</option>
										<option value="3">산책돌봄</option>
									</select>
								</td>
								<td>
								</td>
							</tr>
							<tr>
								<td class="page4-1-1">
									<div class="page4-1">비상연락처</div>
								</td>
								<td>
									<input type="tel" name="tel" id="tel" value="">
								</td>
								<td>
								</td>
							</tr>
						</table>
					<div id="page5">
					<br><br>
						<div id="page5-title">
						<%=m.getNickname() %> 님에게 보내는 메세지
						</div>
							<textarea id="page5-textarea" cols="30" rows="30" name="trustAdd"></textarea>

					</div>
						<input type="submit" id="sub" value="요청하기">
					</div>
				</div>
			</div>
            </form>
         <script>
         function datacheck(){
        	 var startdate = $('#startDate').val();
	         var enddate = $('#endDate').val();
        	 
	         if($('#startDate').val()==""){
	        	 alert("시작날자를 입력해주세요");
	        	 return false;
	         }else if($('#endDate').val()==""){
	        	 alert("끝나는 날자를 입력해주세요");
	        	 return false;
	         }else if($('#select3').option()=="선택"){
	        	 alert("위탁 방식을 선택해주세요");
	        	 $('#select3').focus();
	        	 return false;
	         }else if($('#tel').val()==''){
					alert("비상연락처를 입력해주세요");
					$('#tel').focus();
					return false;
	         } else if($('#page5-textarea').val()==''){
					alert("메세지를 입력해주세요");
					$('#page5-textarea').focus();
					return false;
	         }else if(startdate > enddate){
	        	 alert("종료날자는 시작날자보다 빠를수 없습니다.")
	        	 return false;
	         }else{
	        	 return true;
	         }
	         
	         
	         
         }
         </script>
         </div>
				
				
				
				
				
				
				
				</section>
			</div>
			<footer></footer>
		</div>
	</div>
</body>
</html>