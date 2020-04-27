<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myPage_css/pwdUpdate.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="script.js"></script>
    <style>
.text{font-family: 'Nanum Gothic Coding', monospace;}

	#mypage{
		width:900px;
		height:1500px;
		table-layout: fixed;
	}
	
	#title{
    font-size: 25px;
}

		#myForm{border: 1px solid hsla(197, 62%, 74%, 0.603);
   				border-width: 20px;
    			background: white;
    			margin: 20px
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
		
		table {margin-left: 160px; margin-right: auto;
 	 		   border-spacing: 35px;
 		   	   border-collapse: separate;
 		    
}
		th{background: hsla(197, 62%, 74%, 0.603); width: 140px; text-align: center;}
		td{text-align: center;}

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
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp">내 정보 관리</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp">비밀번호 변경</a></li>
						<li><a style ="text-decoration: none; color:black;" href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp">회원 탈퇴</a></li>
					</ul>
				</aside>
				<section>
				<body>
	<div id="mypage">
	    <div>
            <form id="myForm" action="<%= request.getContextPath() %>/pwdupdate.mem" method="post">
	<table>
		<tr>
			<th>현재 비밀번호</th>
			<td>
				<input type="password" name="password" id="password">
			</td>
			<td align="left" width ="200px"><label id="pwdcheck"></label></td>
		</tr>
		<tr>
			<th>새 비밀번호</th>
			<td>
				<input type="password" name="passwordN" id="passwordN" placeholder="최소 7자 이상">
			</td>
			<td align="left" width ="200px"><label id="pwdcheck1"></label></td>
		</tr>
		<tr>
			<th>새 비밀번호 확인</th>
			<td><input type="password" name="passwordNC" id="passwordNC"></td>
			<td align="left" width ="200px"><label id="pwdcheck2"></label></td>
		</tr>
	</table>
		<center><input type="submit" id="retoch" value="변경하기" onclick="return test()" style='cursor:pointer;'></center><br>
		
    </form>
   </div>
	</div>
</body>
				</section>
			</div>
			<footer>ULTARY</footer>
		</div>
		<script>
				 var pwdcheckUsable = false;    // 비번 중복 시false, 사용가능시 true
			     var pwdcheckChecked = false;   // 비번 중복확인을 했는지 안했는지 검사
			     var newpwdcheck = false; // 새 비밀번호와 새 비밀번호 확인이 일치 하는지 검사
			     var testnewpwd = false; // 새 비밀번호 정규식 검사 여부
			     var re =/^[a-zA-Z\d]{7,11}$/;  // 비번 정규식	
			    	 
			      	$('#password').val('');
			     	$('#password').focus();
					$('#password').on("propertychange change keyup paste input", function(){
						pwdcheck = false;
					});
			    
					//기존비번과 현재비번이 일치하는지 확인
			     	$('#password').change(function(){
			     		var password = $('#password').val();
			     		
					$.ajax({  //현재 비밀번호를 보내서 비교해서 값을 받아오기
						url: '<%= request.getContextPath() %>/updatePwdChk.do',
						data: {password:password},
						success: function(data){
							console.log(data);
						
						if(data == 'success'){
							 $('#pwdcheck').text('비밀번호가 일치합니다');
			            	 $('#pwdcheck').css({'color':'#00FF00', 'float':'right','display':'inline-block','padding-right':'12px', 'font-weight':'bold'});
			            	 pwdcheckUsable = true;
		                     pwdcheckChecked= true;
						}else{
							$('#pwdcheck').text('현재 비밀번호가 아닙니다');
			                 $('#pwdcheck').css({'color':'#FF0000', 'float':'right','display':'inline-block', 'padding-right':'12px', 'font-weight':'bold'});
			                 pwdcheckUsable = false;
			                 pwdcheckChecked= false;
						}

						}
			        });
			     });
			     	
					//새비번을 받아서 정규식확인, 정규식이 맞으면 디비에 보내서 저장
					//새로 새비번, 비번확인 맞는지 확인
					
					//패스워드 1과 패스워트 2 동일한지 검사.
				    $('#passwordNC').keyup(function(){
				    	var passwordN = $('#passwordN');
						var passwordNC = $('#passwordNC');
						
				       if(passwordN.val() == passwordNC.val()){
				          $('#pwdcheck2').text('비밀번호가 일치합니다');
				          $('#pwdcheck2').css({'color':'#00FF00', 'float':'right','display':'inline-block','padding-right':'12px', 'font-weight':'bold'});
				          newpwdcheck = true;
				       }else{
				          $('#pwdcheck2').text('일치하지 않습니다');
				          $('#pwdcheck2').css({'color':'#FF0000', 'float':'right','display':'inline-block', 'padding-right':'12px', 'font-weight':'bold'});
				          newpwdcheck = false;
				       }
				    });
					
					// 
					function test() {
						if(pwdcheckUsable && pwdcheckChecked && newpwdcheck) {
							return true;
						} else {
							alert('다시 입력해주세요.');
							return false;
						}
					}
					
			     	//정규식을 이용한 에이작스
// 			     		if(!re.test(password.val())){ 	
// 			     		password.focus();
// 			     			$.ajax({
<%-- 			                    url:'<%= request.getContextPath() %>/pwdupdate.mem', --%>
// 			                    data:{password: password.val()},
// 			                    success: function(data){ //data로 반환 받아옴      
// 			                    	console.log(data);
// 			              if(data == "success"){
// 			                 $('#pwdcheck').text('현재 비밀번호와 일치합니다');
// 			            	 $('#pwdcheck').css({'color':'green', 'float':'right','display':'inline-block','padding-right':'10px'});
// 			            	 pwdcheckUsable = true;
// 		                     pwdcheckChecked= true;
// 			              }	else {
// 			            	 $('#pwdcheck').text('현재 비밀번호가 아닙니다');
// 			                 $('#pwdcheck').css({'color':'red', 'float':'right','display':'inline-block', 'padding-right':'10px'});
// 			                 pwdcheckUsable = false;
// 			                 pwdcheckChecked= false;
// 			                 }
// 			              }
// 			           });
// 			        }
			     	
			     	

				</script>
								
	<%-- 			   <script>
		$(function(){
			$('#memberD').click(function(){
				
				var password = $('#password').val();
				var loginPwd = <%= loginUser.getPassword() %>;
				
				if(password == loginPwd){
					response.sendRedirect("views/myPage/pwdUpdate.jsp");
					if(result){
						location.href="<%= request.getContextPath() %>/views/main/main.jsp";
					} else {
						alert("비밀번호 변경 실패! 다시 시도해주시길 바랍니다.");
						location.href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp";
					}
				}
			});
		});
		</script> --%>
	</div>
</body>
</html>