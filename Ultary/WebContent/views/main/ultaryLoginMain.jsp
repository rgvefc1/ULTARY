<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member"%>
 
<!--네이버 로그인 전용 임포트  -->    
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>    
    
<%
	Member loginMember = (Member)session.getAttribute("loginUser");
	System.out.println(loginMember); //null이면 로그인을 안한것 null이 아니면 로그인 한것
	String msg = (String)request.getAttribute("msg"); // 그리고 나서 서버에 나타나게 해줘야함
	
%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 로그인</title>

<script type="text/javascript" src= "<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<!-- user style -->
<link rel= "stylesheet" href="<%= request.getContextPath() %>/css/ultaryLogin.css" type="text/css">

</head>
<body>

<!----해더 시작--------------------------------------------------------------------->
<!-- 시멘틱 태그 최대한 활용하기 -->
	<header>
			<a href='<%= request.getContextPath() %>/views/main/main.jsp' target="_self">
			<img id="logo" src="<%= request.getContextPath() %>/image/logo.png" width="120px" height="90px" /></a>
	</header>
	
<!----해더 끝--------------------------------------------------------------------->
<!-- nav 생략 -->

<!----테이블 섹션  시작--------------------------------------------------------------------->			
	<section>
		<div class="tableArea">
			<form id="loginForm" action="<%= request.getContextPath() %>/login.mem" method="post" onsubmit="return validate();">
					<h1 align="center">로그인</h1>
						<hr width=50% color="white">
						<br>
							<table  style="line-height: 2; height: 130px; width: 220px;">
								<tr>
									<td><input type="text" id="memberid" name="memberid" class="input_login" placeholder="아이디" autofocus tabindex=1></td>
									<td rowspan="2"><input value="로그인" type="submit" id="loginBtn_normal" class="loginBtn_main" tabindex=3></td>
								</tr>
								<tr>
									<td><input type="password" id="password" name="password" class="input_login" placeholder="비밀번호" tabindex=2></td>
								</tr>
								
<!----네이버 로그인 연동 시작--------------------------------------------------------------------->
							 <%
							 	String clientId = "I5f2j4CStj0Q0BPbHYAM";//애플리케이션 클라이언트 아이디값";
							    String redirectURI = URLEncoder.encode("http://localhost:9022/Ultary/views/main/callback.jsp", "UTF-8");
							    SecureRandom random = new SecureRandom();
							    String state = new BigInteger(130, random).toString();
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							 %>
								<tr style="text-align:center;">
									<td colspan="2">
								<!-- 	<button type=button id="loginBtn_naver" class="loginBtn" onclick="location.href='/controller/naverlogin.do';" >네이버 계정으로 로그인</button> -->
				<!--네이버 계정으로 로그인 버튼  --><a href="<%=apiURL%>"><img class="naverloginBtn" src="<%= request.getContextPath() %>/image/네이버 아이디로 로그인_완성형_White.PNG" tabindex=4/></a>
									</td>
								</tr>
<!----네이버 로그인 연동 끝--------------------------------------------------------------------->								
							</table>
							</form>
							<hr width=10% color="white">
							<button type=button id="loginBtn_normal_insertmember" class="loginBtn" onclick="gomemberJointerm();" tabindex=5> 일반 회원 가입</button>
							<br>
							<br>
							<hr width=50% color="white">
						<br>
				</div>
			
	</section>
<!---- 풋터 시작 --------------------------------------------------------------------->											
	
	
	<footer>
		<table id="footer">
			<tbody>
				<tr>
					<td><div class="footer_link" onclick="gofindId();" tabindex=6>아이디 찾기</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gofindPwd();" tabindex=7>비밀번호 찾기</div></td>
				</tr>
			</tbody>
		</table>
	</footer>
	
<!---- 풋터 끝 --------------------------------------------------------------------->											
	<script>
	$(function(){
		check = false;
	});
	
	$('#loginBtn_normal').click(function(){
		
	});
	function validate(){
		if($('#memberid').val().trim().length==0){
			alert('아이디를 입력해주세요');
			$('#memberid').focus();
			return false;
		}
		if($('#password').val().trim().length==0){
			alert('비밀번호를 입력해주세요.');
			$('#password').focus();
			return false;
		}
		var memberid = $('#memberid');
		var password = $('#password');
		
		$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
			url: '<%=request.getContextPath() %>/loginValidate.do',
			type: 'post',
			data:{memberid: memberid.val(), password: password.val()},
			async : false,
			success: function(data){
				console.log(data);
				if(data.trim() == "fail"){
					check = false; 
				}else{
					check = true;
				}
			}
		});
		console.log(check);
		if(check){
			return true; //로그인서블릿으로
		}else{
			alert('입력하신 사항이 일치하지 않습니다. 다시 확인해주세요.');
			memberid.focus();
			return false;
		}
	};
	
	
	////////--------------------------------------------------------------------------------------------
	
		function gofindId(){ //아이디 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/main/findMember/findIdForm.jsp';
		}
		function gofindPwd(){ // 비밀번호 찾기로 이동
			location.href='<%= request.getContextPath() %>/views/main/findMember/findPwdForm.jsp';
		}
		function gomemberJointerm(){ //회원가입 약관동의로 이동
			location.href='<%= request.getContextPath() %>/views/main/memberJointermsForm.jsp';
		}
	</script>
</body>
</html>