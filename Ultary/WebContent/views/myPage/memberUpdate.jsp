<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Pet> PetList = (ArrayList<Pet>)request.getAttribute("PetList");
	ArrayList<Media> MediaList = (ArrayList<Media>)request.getAttribute("MediaList");
	String add = ((Member)session.getAttribute("loginUser")).getAddress();
	String[] addArr = add.split("/");
	String petkind = "";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 관리</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPage_css/memberUpdate.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("views/main/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	           
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr, roadAddrPart1, addrDetail, roadAddrPart2, engAddr, jibunAddr, zipNo, 
        admCd, rnMgtSn, bdMgtSn , detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, 
        buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.	
		 document.myForm.zipNo.value = zipNo;                 //우편번호         
         document.myForm.roadAddrPart1.value = roadAddrPart1; //도로명주소(참고항목 제외)  
         document.myForm.roadAddrPart2.value = roadAddrPart2; //도로명주소 참고항목
         document.myForm.addrDetail.value = addrDetail;       //고객 입력 상세 주소
         document.joinForm.siNm.value = siNm;       	 //위탁검색용 시도명
		 document.joinForm.sggNm.value = sggNm;       //위탁검색용 시군구명
		 document.joinForm.emdNm.value = emdNm;       //위탁검색용 읍면동명
}


// <a href="주소 입력" onClick="window.open(this.href, '', 'width=400, height=430'); return false;">하고픈 말</a>

</script>
<style>
.text{font-family: 'Nanum Gothic Coding', monospace;}

	#mypage{
		width:900px;
		min-height:1500px;
		
	}
	
	#myForm{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	#myForm2{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	
	
	table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;
 		    
}
	#newMember_animal{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 5px; margin: 20px; margin-left: 150px; margin-right: 150px;
		
	}

	#petplus{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:14px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#petplus:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#petplus:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}
		
	#retoch{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:18px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#retoch:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#retoch:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}
		
		input:focus {
	    outline: none;
		}
		
		#retoch2{
		width: 140px;
		box-shadow: 0px 1px 0px 0px #f0f7fa;
		background:linear-gradient(to bottom, #33bdef 5%, #019ad2 100%);
		background-color:#33bdef;
		border-radius:6px;
		border:1px solid #057fd0;
		display:inline-block;
		cursor:pointer;
		color:#ffffff;
		font-family:Arial;
		font-size:18px;
		font-weight:bold;
		padding:6px 24px;
		text-decoration:none;
		text-shadow:0px -1px 0px #5b6178;
		}
		#retoch2:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#retoch2:active {
		position:relative;
		top:1px;
		}
		
		input:focus {
	    outline: none;
		}


	th{background: hsla(197, 62%, 74%, 0.603); width: 120px; text-align: center;}
	h2{background: gainsboro; width: 200px;}
	u{font_underlinecolor: gainsboro;}
	

</style>
</head>
<body>
	<div id="all">
		<div id="all-wrap">
			<header>
				<div id="alert-wrap">
					<div class="alert">
						<div id="alerttitle">전체알림</div>
						<div class="alertcontentdiv">
							<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
							<div class="alertclose">&nbsp;&nbsp;X</div>
						</div>
					</div>
				</div>
<script>
	$("body").click(function(e){
		if($('.alert').css('display') == 'block'){
			if(!$('.alert').has(e.target).length) {
				$('.alert').hide();
			}
		} else if($('.alert').css('display') == 'none'){
			if($('#alertbuttondiv').has(e.target).length) {
				$('.alert').show();
			}
		}
	});
	$(function(){
		updateDate();
	});
	function updateDate(){
		$.ajax({
			url: '<%= request.getContextPath() %>/AlertCount.al',
			success: function(data){
				if(data==0){
					$('.alertcount').hide();
				}
				$('.alertcount').text(data);
			},error: function(){
				
			}
		});
		$.ajax({
			url: '<%= request.getContextPath() %>/selectAlert.al',
			type: 'post',
			cache: false,
			success: function(data){
				$('.alert').html("");
				$('.alert').append('<div id="alerttitle">전체알림</div>');
				for(var key in data){
					var $div = $('<div>').attr('class','alertcontentdiv');
					var $div1 = $('<div>').attr('class','alertcontent').attr('onclick', "alDetail('"+data[key].allink+"','"+data[key].alsnum+"');");
					var $div2 = $('<div>').attr('class', 'alertclose').attr('onclick', "alDelete('"+data[key].alsnum+"');");
					if(data[key].alkind == 1){
						$div1.text(data[key].memberid+"님이 댓글을 달았습니다.");
						$div2.text("  X");
					} else{
						$div1.text(data[key].memberid+"님이 답글을 달았습니다.");
						$div2.text("  X");
					}
					if(data[key].alcheck == 'Y'){
						$div.css('background', '#8C8C8C');
					}
					$div.append($div1);
					$div.append($div2);
					$('.alert').append($div);
				}
			}, error: function(){
				
			}
		});
		setTimeout(updateDate, 5000);
	}
	function alDelete(anum){
		$.ajax({
			url: '<%= request.getContextPath() %>/deleteAlert.al',
			data: {alsnum:anum},
			success: function(d){
				updateDate();
				$('.alert').css('height', "-=50px");
			}
		});
	}
	function alDetail(allink, anum){
		$.ajax({
			url: '<%= request.getContextPath() %>/Updatecheck.al',
			data: {alsnum:anum},
			success: function(dat){
				location.href="<%=request.getContextPath() %>"+allink;
			}
		});
	}
</script>
				<div id="header-top">
					<div id="alertbuttondiv"><img class="headerimg" src="<%= request.getContextPath() %>/image/알림.png"></div>
					<div class="alertcount"></div>
					<div id="header-topR">
						<div id="nick"><%= loginUser.getNickname() %></div>
						<div id="nim">님</div>
						<button id="logout" class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
					</div>
				</div>
				<div id="header-bottom">
					<a href='<%= request.getContextPath() %>/main.login'><img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
				</div>
			</header>
<%@ include file ="mg_nav.jsp" %>


			</nav>
			<div id="asidesection">
				<aside>
					<ul>
						<li><a style ="text-decoration: none; color:black;"href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp">내 정보 관리</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp">비밀번호 변경</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp">회원 탈퇴</a></li>
					</ul>
				</aside>
				<section>

				<section>
	
	<center><h1>내 정보 관리</h1></center>
	<hr width=50% color="white">
	<div id="mypage">
	<form id="myForm" name = "myForm" action="<%= request.getContextPath() %>/update.mem" method="post">
	<center><h2>내 정보</h2></center>
	<table>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname" id="nickname" placeholder="닉네임을 입력하세요" value="<%= loginUser.getNickname() %>">
			<label id="nickResult"></label>
								<img id="nickname_check"  style="display:none;" src="<%= request.getContextPath() %>/image/check.png" width="15px" height="15px" /> 
								<img id="nickname_checked" style="display:none;" src="<%= request.getContextPath() %>/image/checked.png" width="15px" height="15px" />
								</td>
		
		</tr>
		<tr>
			<th>이름 </th>
			<td><%= loginUser.getMemberName() %></td>
		</tr>
		<tr>
			<th>아이디</th>
			<td><%= loginUser.getMemberId() %></td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><%= loginUser.getBirth() %></td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<%= loginUser.getGender() %>
			</td>
		</tr>
			<tr>
			<th>E-mail</th>
			<td><%= loginUser.getEmail() %></td>
		</tr>
		<tr>
			<th>Phone</th>
			<td><input name="phone" id="phone" value="<%= loginUser.getPhone() %>"></td>
		</tr>
		<tr>
                     <th>우편번호</th>
                     <td>
         <!-- 1우편번호-->    <input type="text" id="zipNo" name="zipNo" width="60px" value="<%= addArr[0] %>"/>
         <!-- 팝업버튼 -->      <input type="button" value="검색" onclick="goPopup();">
                     </td>
                  </tr>
                  <tr>
                     <th>도로명주소</th>
                     <td>
         <!--2도로명주소--> <input type="text" id="roadAddrPart1" name="roadAddrPart1" width="240px" value="<%= addArr[1] %>"/><br>
                     </td>
                  </tr>
                  <tr>
                     <th>상세주소</th>
                     <td>
         <!-- 3참고주소 -->       <input type="text" id="roadAddrPart2" name="roadAddrPart2" width="115px" value="<%= addArr[2] %>"/>
         <!-- 4고객입력 상세주소 --><input type="text" id="addrDetail" name="addrDetail" width="115px" value="<%= addArr[3] %>"/><br>
         	<!-- --------------------------------------------------------------------------------------- -->
         <!-- 위탁검색용 시도명 --><input type="hidden" id="siNm" name="siNm" width="115px" />
         <!-- 위탁검색용 시군구명 --><input type="hidden" id="sggNm" name="sggNm" width="115px" />
         <!-- 위탁검색용 읍면동명--><input type="hidden" id="emdNm" name="emdNm" width="115px"/>
         <!-- --------------------------------------------------------------------------------------- -->
                     </td>
                  </tr>
		<tr>
			<th>비밀번호 질문</th>
			<td>
				<select id="pwquery" name="pwquery" class="member">
					<option>비밀번호 질문</option>
					<option id="pw1" value="1">기억에 남는 추억의 장소는?</option>
					<option id="pw2" value="2">자신의 인생 좌우명은?</option>
					<option id="pw3" value="3">자신의 보물 제1호는?</option>
					<option id="pw4" value="4">유년시절 가장 생각나는 친구 이름은?</option>
					<option id="pw5" value="5">인상 깊게 읽은 책 이름은?</option>
					<option id="pw6" value="6">자신이 두번째로 존경하는 인물은?</option>
					<option id="pw7" value="7">어릴적 별명은?</option>
					<option id="pw8" value="8">다시 태어나면 되고 싶은 것은?</option>
					<option id="pw9" value="9">내가 좋아하는 캐릭터는?</option>
					<option id="pw10" value="10" selected="selected">내가 좋아하는 색깔은?</option>
				</select>
			</td>
			</tr>
<script>
	$(function(){
		<% switch(loginUser.getPwQuery()){ 
		case 1: %> $('#pw1').prop("selected",true); <% break;
		case 2: %> $('#pw2').prop("selected",true); <% break; 
		case 3: %> $('#pw3').prop("selected",true); <% break; 
		case 4: %> $('#pw4').prop("selected",true); <% break; 
		case 5: %> $('#pw5').prop("selected",true); <% break; 
		case 6: %> $('#pw6').prop("selected",true); <% break; 
		case 7: %> $('#pw7').prop("selected",true); <% break; 
		case 8: %> $('#pw8').prop("selected",true); <% break; 
		case 9: %> $('#pw9').prop("selected",true); <% break; 
		case 10: %> $('#pw10').prop("selected",true); <% break; 
		} %>
	});
</script>			

			<tr>
				<th>비밀번호 답</th>
				<td>
					<input type="text" id="pwqans" name="pwqans"class="member" value="<%= loginUser.getPwqAns() %>">
				</td>
			</tr>
		
		<tr>
			<th>위탁여부</th>
			<td>
				<input
					type="radio" onclick="setDisplay1();" id="trust_Y" name="trust"
					value="Y"><label>네</label> <input type="radio"
					onclick="setDisplay2();" id="trust_N" name="trust" value="N"
					checked><label>아니요</label>
			</td>
		</tr>
		<script>
	function setDisplay1(){
	    if($('input:radio[id=trust_Y]').is(':checked')){
	        $('#newMember_animal').show();
	    }else{
	        $('#newMember_animal').hide();
	    }
	}
	function setDisplay2(){
	    if($('input:radio[id=trust_N]').is(':checked')){
	        $('#newMember_animal').hide();
	    }else{
	        $('#newMember_animal').show();
	    }
	}
</script>
<script>
	$(function(){
		if(<%= loginUser.getTrust() %>== "Y"){
			$('#trust_Y').attr('checked','checked');
		} else if(<%= loginUser.getTrust() %>== ""){
			$('#trust_N').attr('checked','checked');
		}
	});
</script>
		</table>
		<div id=newMember_animal style="display: none;">	
		<table>
		<tr>
			<th> 
				<label class="trustway">돌봄방식</label>
			</th>
			<td>	
				<input type="radio" id="trustmeans1" name="trustmeans" value="1" ><label>위탁</label>
				<input type="radio" id="trustmeans2" name="trustmeans" value="2" ><label>방문</label>
				<input type="radio" id="trustmeans3" name="trustmeans" value="3" ><label>산책</label>
				<input type="radio" id="trustmeans4" name="trustmeans" value="4" ><label>전체가능</label>
			</td>
		</tr>
<script>
	$(function(){
		if(<%= loginUser.getTrustmeans() %>== "1"){
			$('#trustmeans1').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "2"){
			$('#trustmeans2').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "3") {
			$('#trustmeans3').attr('checked','checked');
		} else if(<%= loginUser.getTrustmeans() %>== "4") {
			$('#trustmeans4').attr('checked','checked');
		} 	
	});
</script>
		<tr>
			<th>돌봄조건</th>
			<td>
			<input type="checkbox" name="trustfield" value="픽업" id="dolbombom" <%= "trustfield[0]" %>> <label>픽업여부</label>
			<input type="checkbox" name="trustfield" value="미당여부" id="dolbombom" <%= "trustfield[1]" %>> <label>마당여부</label>
			<input type="checkbox" name="trustfield" value="산책" id="dolbombom" <%= "trustfield[2]" %>> <label>산책</label><br>
			<input type="checkbox" name="trustfield" value="목욕" id="dolbombom" <%= "trustfield[3]" %>> <label>목욕</label>
			<input type="checkbox" name="trustfield" value="온도" id="dolbombom" <%= "trustfield[4]" %>> <label>온도</label>
			<input type="checkbox" name="trustfield" value="대형동물" id="dolbombom" <%= "trustfield[5]" %>> <label>대형동물</label>	
			</td>
		</tr>
		<tr>
			<th style="padding-right: 20px;"><label class="">위탁 추가 사항</th>
			<td><textarea name="trustAdd" placeholder="추가사항을 입력해주세요"
									cols="36" rows="3" style="resize: none;" <%= loginUser.getTrustAdd() %>></textarea></td>
		</tr>
		</div>
	</table>
	</div>
		<center><input type="submit" id="retoch2" value="수정저장" style='cursor:pointer;'></center><br>
	</form>
	
		<center><h2>반려동물 정보</h2></center>
	<!-- 여기부터 반려동물 정보칸 -->
		<div id="petdiv">
	<% if(!PetList.isEmpty()){ %>
		<% for(int i=0;i<PetList.size();i++){ 
			Pet p = PetList.get(i);
			switch(p.getPetKind()){
			case '1': petkind="강아지"; break;
			case '2':	petkind="고양이"; break;
			case '3':	petkind="설치류"; break;
			case '4':	petkind="파충류"; break;
			case '5':	petkind="조류"; break;
			case '6':	petkind="어류"; break;
			case '7':	petkind="기타"; break;
			} %>
			<% if(!MediaList.isEmpty()){ %>
			<% for(int j=0;j<MediaList.size();j++){
				Media m = MediaList.get(j); %>
				<% if(p.getPetNum() == m.getPetNum()){ %> <!--펫정보랑 펫사진이랑 일치하는지 -->
			<table class="petone">
				<tr>
					<th>프로필  사진</th>
					<td>
						<img src='<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>' border='0' class="fileInput" id="basicImg" width="200px" height="126px" style='cursor:pointer;'>
					</td>
				</tr>
				<tr>
					<th>반려동물 이름</th>
					<td><%= p.getPetName() %></td>
				</tr>
				<tr>
					<th>반려동물 종류</th>
					<td>
						<%= petkind %>
					</td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<%= p.getPetGender() %>
					</td>
				</tr>
				<tr>
					<th>나이</th>
					<td>
						<%= p.getPetage() %>
					</td>
				</tr>
				<tr>
					<td>
						<input type="button" id="pd<%= j %>"  class="deleteBtn" style="cursor:pointer;" value="삭제">
					</td>
				</tr>
			</table>
		<script>
		/* 닉네임 유효성 검사 ajax 중복불가 */		
		var isnickUsable = false; 	// 닉네임 중복 시false, 사용가능시 true
		var isnickChecked = false;	// 닉네임 중복확인을 했는지 안했는지 검사
		var re3 = /^[가-힣a-zA-Z\d]{2,}$/; // 닉네임 정규식 한글 2자이상
		
		
		$("#nickname").on('change paste keyup', function(){
			isnickChecked = false;
		});
		
		$('#nickname').change(function(){
			var userNick = $('#nickname');
			
			if(!re3.test(userNick.val())){
				alert('닉네임은 영문 혹은 한글 2자리 이상이어야 합니다.');
//	 			$('#nickResult').text('사용 불가능 합니다.');
//	 			$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
				userNick.focus();
				
				if($('#nickname_checked').css("display")=="none"){ //반려
			 		$('#nickname_checked').show();
			 		$('#nickname_check').hide();
				}
				
			} else{
				$.ajax({
					url:'<%= request.getContextPath() %>/nickNameCheck.mem',
					data:{userNick: userNick.val()},
					success: function(data){ //data로 반환 받아옴
						
						if(data == "success"){
//	 						$('#nickResult').text('사용가능합니다.');
//	 						$('#nickResult').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'50px'});
							isnickUsable = true;
							isnickChecked= true;
							
							if($('#nickname_check').css("display")=="none"){
						 		$('#nickname_check').show();
						 		$('#nickname_checked').hide();
							}
							
						}else{
//	 						$('#nickResult').text('사용 불가능 합니다.');
//	 						$('#nickResult').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'50px'});
							userNick.focus();
							isnickUsable = false;
							isnickChecked= false;
							
							if($('#nickname_checked').css("display")=="none"){
						 		$('#nickname_checked').show();
						 		$('#nickname_check').hide();
							 	}
							
						}
					}
				});
			}
		});		
		</script>
<script>
	var deleteBtn = "#pd"+"<%= j %>";
	$(deleteBtn).click(function(){ // 삭제버튼
		var result = confirm("<%= p.getPetName() %>의 정보를 삭제하시곘습니까?");
		
		if(result){
			var petNum = <%= p.getPetNum() %>;
			var webname = "<%= m.getWebName() %>";
			$.ajax({
				url:'delete.pet',
				data: {petNum:petNum, webname:webname},
				success: function(data){
					location.reload();
				}
			});
		} else{
			alert("삭제 취소");
		}
		
	});
</script>
				<% } %>
			<% } %>
		<% } %>
		<% } %>
	<% } else { %>
	<h1>새로운 펫 정보를 입력해주세요.</h1>
	<% } %>
		</div>
		<center><input type="button" id="petplus" style="cursor:pointer;" value="반려동물 입력"></center><br>
<script>
	$(function(){
		$('#petplus').click(function(){
			window.open('<%= request.getContextPath()%>/views/myPage/petinsert_Popup.jsp', 'pop', 'width=950', 'height=650');
		});
	});	 
</script>
	</div>
				</section>
			</div>
			<footer></footer>
		</div>
	</div>
</body>
</html>