<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPage_css/memberDelete.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <script type="text/javascript">
//    function goPopup(){
	// var popup = window.open("", "_self"); // 같은 탭에서 열림
//	var win = window.open("/popup.html", "PopupWin", "width=500,height=600");

	//<a href="주소 입력" onClick="window.open(this.href, '', 'width=400, height=430'); return false;"></a>

	
	/* alert("정말 탈퇴하시겠습니까?"); */


</script>
<style>
#text{font-family: 'Nanum Gothic Coding', monospace;}
#myForm{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
	#mypage{
		width:900px;
		height:1500px;
	}
	
	#title{
    font-size: 25px;
}

		#wow{border: 1px solid hsla(197, 62%, 74%, 0.603); border-width: 20px; background: white; margin: 20px;}
		
		#memberD{
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
		#memberD:hover{
		background:linear-gradient(to bottom, #019ad2 5%, #33bdef 100%);
		background-color:#019ad2;
		}
		#memberD:active {
		position:relative;
		top:1px;
		}
		
		table { margin-left: auto; margin-right: auto;
 		    border-spacing: 20px;
 		    border-collapse: separate;}
		th{background: hsla(197, 62%, 74%, 0.603); width: 140px; text-align: center;}
		
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
			<div id="asidesection">
				<aside>
					<ul>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp">내 정보 관리</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp">비밀번호 변경</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp">회원 탈퇴</a></li>
					</ul>
				</aside>
				<section>
				<body>
	<div id="mypage">
	
		<div>
  		    <h2 align="center">현재 비밀번호를 입력해주세요</h2>
	<div id="wow">
    <table>
    	  <br>
		<tr>
			<th>현재 비밀번호</th>
			<td><input type="password" name="password" id="password"></td>
		</tr>	
	</table>
		<br>
        <center><button id="memberD" style='cursor:pointer;'>확인</button></center>
        <br>
        <br>
      
        </div>
  
		<script>
		$('#memberD').click(function(){
     		var password = $('#password').val();
     		
		$.ajax({  //현재 비밀번호를 보내서 비교해서 값을 받아오기
			url: '<%= request.getContextPath() %>/updatePwdChk.do',
			data: {password:password},
			success: function(data){
				console.log(data);
				if(data == 'success'){
					var result = window.confirm('정말 탈퇴하시겠습니까?');
					if(result){
						location.href="<%= request.getContextPath() %>/delete.mem";
					} else{
						alert("탈퇴 취소!");
					}
				} else{
					alert("비밀번호가 옳지 않음");
				}
			}
			});
		});
		
		</script>
		
        <br>
        <br>
	  </div>
</body>
				</section>
			</div>
			<footer>ULTARY</footer>
		</div>
	</div>
</body>
</html>