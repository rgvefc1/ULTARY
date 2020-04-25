<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="trust.model.vo.*,java.util.ArrayList,member.model.vo.Pet"%>
<%
	Pet mypet = (Pet)request.getAttribute("mypet");
	/* ArrayList<Media> proImg = (ArrayList<Media>)request.getAttribute("proImg"); */
	ArrayList<TrustPost> balsin = (ArrayList<TrustPost>)request.getAttribute("balsin");
	ArrayList<TrustPost> susin = (ArrayList<TrustPost>)request.getAttribute("susin");
	
	ArrayList<TrustPost> balsin0 = new ArrayList<TrustPost>();
	ArrayList<TrustPost> balsin1 = new ArrayList<TrustPost>();
	ArrayList<TrustPost> balsin2 = new ArrayList<TrustPost>();
	
	ArrayList<TrustPost> susin0 = new ArrayList<TrustPost>(); 
	ArrayList<TrustPost> susin1 = new ArrayList<TrustPost>();
	ArrayList<TrustPost> susin2 = new ArrayList<TrustPost>();
	
	for(int i=0; i< balsin.size();i++){
		if(balsin.get(i).getPosition()==0){
			balsin0.add(balsin.get(i));
		}else if(balsin.get(i).getPosition()==1){
			balsin1.add(balsin.get(i));
		}else if(balsin.get(i).getPosition()==2){
			balsin2.add(balsin.get(i));
		}
	}
	for(int i=0; i< susin.size();i++){
		if(susin.get(i).getPosition()==0){
			susin0.add(susin.get(i));
		}else if(susin.get(i).getPosition()==1){
			susin1.add(susin.get(i));
		}else if(susin.get(i).getPosition()==2){
			susin2.add(susin.get(i));
		} 
	 } 
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
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/trust/matching05.css">
 <style>
 	#req4{width: 84px; height: 40px; float: right;
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
            <form>
            <div id="matching">
				<h1 id="title">의뢰관리</h1>
				<p id="title-1">위탁 내용 상세보기와 진행사항을 보여드립니다.</p>
					<hr style="margin-left:10px;">
				<br clear="all">
				</div>
			<div id="page">
				<div id="page1">
					
					<div id= "page3">
						<div id="page3-1">
							<h3>반려동물 정보</h3>
						</div>
						<div id="page3-2">
						<table id="page3_table">
							<%if(mypet == null) {%>
								<tr>
									<h3 style="text-align:center">등록된 애완동물 이없습니다.</h3>
									<img id="petaddbutton"src="<%= request.getContextPath() %>/image/뼈다귀.png" alt="" width="50">
								</tr>
								<script>
									$('#petaddbutton').mouseenter(function(){
										$('#petaddbutton').attr("src","<%= request.getContextPath() %>/image/뼈다귀after.png")
									});
									$('#petaddbutton').mouseout(function(){
										$('#petaddbutton').attr("src","<%= request.getContextPath() %>/image/뼈다귀.png")
									});

									
									
									$('#petaddbutton').click(function(){
										window.open('<%= request.getContextPath()%>/views/myPage/petList.jsp', 'pop', 'width=950, height=650');
									});
								</script>
							<%}else{ %>
							
								<tr>
									<td class="page3_td"><div class="petname">반려동물 이름</div></td>
									<td><label><%=mypet.getPetName() %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 종류</div></td>
									<td><label><%=mypet.getPetKind() %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">성별</div></td>
									<td><label><%=mypet.getPetGender() %></label></td>
								</tr>
								<tr>
									<td class="page3_td"><div class="petname">반려동물 나이</div></td>
									<td><label><%=mypet.getPetage() %></label></td>
								</tr>
							<%} %>
							</table>
							
						</div>
						<div id="page3-3">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="pet-photo">
						</div>
						
					</div>
				<div id="page4" >
					<div id="page4-1">의뢰관리</div>
					<div id="page4-1-1" class="subtitle" onclick="nosub();">미승인</div>
					<div id="page4-1-2" class="subtitle" onclick="sub();">수락</div>
					<div id="page4-1-3" class="subtitle" onclick="no();">거절	</div>
					
					<div class="subcircle" id="no"><%=balsin0.size()+susin0.size() %>건</div>
					<div class="subcircle" id="accept"><%=balsin1.size()+susin1.size() %>건</div>
					<div class="subcircle" id="nono"><%=balsin2.size()+susin2.size() %>건</div>
				</div>
				
				<div id="no-popup1" style="display:none">
					<div id="myreq">
						<div name ="req" id ="popup01" style="text-align:center; cursor:pointer;">내가보낸의뢰</div>
					</div>
					<div id="myresp">
						<div name ="req" id ="popup02" style="text-align:center; cursor:pointer;">내가받은의뢰</div>
					</div>
				</div>
				<div id="no-popup-1" >		
				<div id = "mybalsin0"  style="display:none;">	
				<% if( balsin0.size()==0){ %>
					<div id="reqcontent1" style="text-align:center;">
					<h3>내가 보낸의뢰가 없습니다.</h3>
					</div>
				<%} else{%>
					<%for( int i=0;i<balsin0.size();i++){ %>
						<div id="reqcontent1" onclick="detailview('<%=balsin0.get(i).getSushin()%>','<%=balsin0.get(i).getTpostNum()%>');">
						<div id ="req1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
							<h5 style="display:inline"><%= balsin0.get(i).getSushin() %></h5>
						</div>
						<div id ="req2">
							의뢰일 | <%=balsin0.get(i).getTrustsDue() %> ~ <%=balsin0.get(i).getTrusteDue()%>
						</div>
						<div id ="req3">
							<p style="display:inline;"><%=balsin0.get(i).getTrustPS() %></p>
						</div>
						<div id="req4">
						<%if(balsin0.get(i).getPosition()==0){ %>
							<h4 style="color:green">수락대기중</h4>
						<%}else if(balsin0.get(i).getPosition()==1){ %>
							<h4 style="color:blue">수락완료</h4>
						<%}else if(balsin0.get(i).getPosition()==2){ %>
							<h4 style="coloe:red">거절됨</h4>
						<%} %>
						</div>
					</div>
					<%} }%>
					</div>
					
				<div id = "mysusin0"  style="display:none;">
				<% if(susin0.size()==0) {%>
				<div id="reqcontent1" style="text-align:center;">
					<h3>내가 받은 의뢰가 없습니다.</h3>
				</div>
				<%} else{ %>
					<% for(int i=0;i<susin0.size();i++){ %>
					<div id="reqcontent1" onclick="detailview('<%=susin0.get(i).getBalshin()%>','<%=susin0.get(i).getTpostNum()%>');">
						<div id ="req1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
							<h5 style="display:inline"><%=susin0.get(i).getBalshin() %></h5>
						</div>
						<div id ="req2">
							의뢰기간 | <%=susin0.get(i).getTrustsDue() %> ~ <%=susin0.get(i).getTrusteDue() %>
						</div>
						<div id ="req3">
							<p style="display:inline;"><%=susin0.get(i).getTrustPS() %>	</p>
						</div>
						<button type="button" id="btn1" class="btn" onclick="location.href='<%=request.getContextPath()%>/trustposition.tu?position=1&tpostnum=<%=susin0.get(i).getTpostNum()%>'">수락</button>
					<button type="button" id="btn2" class="btn" onclick="location.href='<%=request.getContextPath()%>/trustposition.tu?position=2&tpostnum=<%=susin0.get(i).getTpostNum()%>'">거절</button>
					</div>
					<%} }%>
					</div>
					</div>

				<div id="no-popup2" style="display:none">
					<div id="myreq">
							<div name ="req" id ="popup03" style="text-align:center; cursor:pointer;">내가보낸의뢰</div>
					</div>
					<div id="myresp">
							<div name ="req" id ="popup04" style="text-align:center; cursor:pointer;">내가받은의뢰</div>
					</div>
				</div>
				<div id = "mybalsin1" style="display:none" >
				<%if(balsin1.size()==0){ %>
				<div id="reqcontent1" style="text-align:center;">
						<h4>수락받은 의뢰가 없습니다.</h4>
				</div>
				<%} else{ %>
					<%for( int i=0;i<balsin1.size();i++){ %>
					<div id="reqcontent1" onclick="detailview('<%=balsin1.get(i).getSushin()%>','<%=balsin1.get(i).getTpostNum()%>');">
						<div id ="req1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
							<h5 style="display:inline"><%= balsin1.get(i).getSushin() %></h5>
						</div>
						<div id ="req2">
							의뢰일 | <%=balsin1.get(i).getTrustsDue() %> ~ <%=balsin1.get(i).getTrusteDue()%>
						</div>
						<div id ="req3">
							<p style="display:inline;"><%=balsin1.get(i).getTrustPS() %>	</p>
						</div>
						<%if(balsin1.get(i).getTrnum()==0){ %>
						<button type="button" id="btn1" class="btn" onclick="location.href='<%=request.getContextPath()%>/insertReview.tu?user=<%= balsin1.get(i).getSushin() %>&tpostnum=<%=balsin1.get(i).getTpostNum()%>'">리뷰작성</button>
						<%} else{ %>
						<input type="button" class="btn" id="btn1" name="btn1" value="리뷰수정" onclick="location.href='<%=request.getContextPath()%>/trustcol.tu?trnum=<%=balsin1.get(i).getTrnum()%>'">
						<%} %>
					</div>
					<%} }%>
					</div>
					<div id = "mysusin1" style="display:none" >
				<%if(susin1.size()==0){ %>
				<div id="reqcontent1" style="text-align:center;">
						<h4>받은 의뢰가 없습니다.</h4>
				</div>
				<%} else{ %>
					<% for(int i=0;i<susin1.size();i++){ %>
					<div id="reqcontent1" onclick="detailview('<%=susin1.get(i).getBalshin()%>','<%=susin1.get(i).getTpostNum()%>');">
						<div id ="req1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
							<h5 style="display:inline"><%=susin1.get(i).getBalshin() %></h5>
						</div>
						<div id ="req2">
							의뢰기간 | <%=susin1.get(i).getTrustsDue() %> ~ <%=susin1.get(i).getTrusteDue() %>
						</div>
						<div id ="req3">
							<p style="display:inline;"><%=susin1.get(i).getTrustPS() %>	</p>
						</div>
						</div>
					<%} }%>
						</div>
						</div>
					
					
					
				<div id="no-popup3" style="display:none">
					<div id="myreq">
						<div name ="req" id ="popup05" style="text-align:center; cursor:pointer;">내가보낸의뢰</div>
					</div>
					<div id="myresp">
						<div name ="req" id ="popup06" style="text-align:center; cursor:pointer;">내가받은의뢰</div>
					</div>
				</div>
				<div id="no-popup-1">
				<div id = "mybalsin2"  style="display:none;">
					<%if(balsin2.size()==0){ %>
					<div id="reqcontent1" style="text-align:center;">
						<h4>거절당한 의뢰가 없습니다.</h4>
					</div>
					<%}else{ %>
					<%for( int i=0;i<balsin2.size();i++){ %>
						<div id="reqcontent1" onclick="detailview('<%=balsin2.get(i).getSushin()%>','<%=balsin2.get(i).getTpostNum()%>');">
							<div id ="req1">
								<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
								<h5 style="display:inline"><%= balsin2.get(i).getSushin() %></h5>
							</div>
							<div id ="req2">
								의뢰일 | <%=balsin2.get(i).getTrustsDue() %> ~ <%=balsin2.get(i).getTrusteDue()%>
							</div>
							<div id ="req3">
								<p style="display:inline;"><%=balsin2.get(i).getTrustPS() %>	</p>
							</div>
						</div>
					<%} }%>
					</div>
					
					<div id = "mysusin2"  style="display:none;">
					<%if(susin2.size()==0) {%>
					<div id="reqcontent1" style="text-align:center;">
						<h4>거절한 의뢰가 없습니다.</h4>
					</div>
					<%}else{ %>
						<% for(int i=0;i<susin2.size();i++){ %>
						<div id="reqcontent1" onclick="detailview('<%=susin2.get(i).getSushin()%>','<%=susin2.get(i).getTpostNum()%>');">
						<div id ="req1">
							<img src="/Ultary/views/trustMatch/photo.jpg" id="req-photo">
							<h5 style="display:inline"><%=susin2.get(i).getBalshin() %></h5>
						</div>
						<div id ="req2">
							의뢰기간 | <%=susin2.get(i).getTrustsDue() %> ~ <%=susin2.get(i).getTrusteDue() %>
						</div>
						<div id ="req3">
							<p style="display:inline;"><%=susin2.get(i).getTrustPS() %>	</p>
						</div>
						</div>
					<%} }%>
					</div>
					</div>
				</div>
				
					
			<script>
			
				function nosub(){
					$('#no-popup1').show();
					$('#no-popup2').hide();
					$('#no-popup3').hide();
					$('#mysusin0').hide();
					$('#mybalsin0').hide();
					$('#mybalsin1').hide();
					$('#mysusin1').hide();
					$('#mybalsin2').hide();
					$('#mysusin2').hide();
				}
				function sub(){
					$('#no-popup2').show();
					$('#no-popup1').hide();
					$('#no-popup3').hide();
					$('#mysusin0').hide();
					$('#mybalsin0').hide();
					$('#mybalsin1').hide();
					$('#mysusin1').hide();
					$('#mybalsin2').hide();
					$('#mysusin2').hide();
				}
				function no(){
					$('#no-popup3').show();
					$('#no-popup1').hide();
					$('#no-popup2').hide();
					$('#mysusin0').hide();
					$('#mybalsin0').hide();
					$('#mybalsin1').hide();
					$('#mysusin1').hide();
					$('#mybalsin2').hide();
					$('#mysusin2').hide();
				}
				$('#popup01').click(function(){
					$('#mybalsin0').show();
					$('#mysusin0').hide();
				});
				$('#popup02').click(function(){
					$('#mysusin0').show();
					$('#mybalsin0').hide();
			
				});
				$('#popup04').click(function(){
					$('#mysusin1').show();
					$('#mybalsin1').hide();
			
				});
				$('#popup03').click(function(){
					$('#mysusin1').hide();
					$('#mybalsin1').show();
				});
				$('#popup06').click(function(){
					$('#mysusin2').show();
					$('#mybalsin2').hide();
				});
				$('#popup05').click(function(){
					$('#mysusin2').hide();
					$('#mybalsin2').show();
				});
				
				function detailview(userid,tpnum){
					
					location.href="<%=request.getContextPath()%>/DetailTp.tu?memberid="+userid+"&tp="+tpnum;
					
				}
	
			</script>

			
            </form>
            </div>
			</section>
			</div>
			<footer style="height:100px;"></footer>
		</div>
	</div>
</body>
</html>