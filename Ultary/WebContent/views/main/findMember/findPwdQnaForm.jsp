<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>울타리 비밀번호 찾기</title>

<script type="text/javascript" src= "<%= request.getContextPath() %>/js/jquery-3.4.1.min.js"></script>

<!-- user style -->
<link rel= "stylesheet" href="<%= request.getContextPath() %>/css/ultaryLogin.css" type="text/css">

</head>
<body>
<!----해더 시작--------------------------------------------------------------------->
<!-- 시멘틱 태그 최대한 활용하기 -->
	<header>
			<a href='<%= request.getContextPath() %>/main.ini' target="_self">
			<img id="logo" src="<%= request.getContextPath() %>/image/logo.png" width="120px" height="90px" /></a>
	</header>
	
<!----해더 끝--------------------------------------------------------------------->
<!-- nav 생략 -->

<!----테이블 섹션  시작--------------------------------------------------------------------->	
	<section>
		<form id=find_Pwd action="<%= request.getContextPath() %>/views/main/findMember/newPwdForm2.jsp" method="post">
			<div class="tableArea">
				<h1>내 질문으로 비밀번호 찾기</h1>
				<hr width=30% color="white">
				<br>
				<table>
					<tr>
						<th>아이디</th>
						<td>
							<input type="text" id="fine_Pwd_Id2" name="fine_Pwd_Id2" class="input_find" placeholder="아이디" autofocus required> 
						</td>
					</tr>
					<tr>
						<th>비밀번호 질문</th>
						<td><select id="pwquery" name="pwquery" class="member" required>
								<option Selected disabled value="">비밀번호 질문</option>
								<option value="1">기억에 남는 추억의 장소는?</option>
								<option value="2">자신의 인생 좌우명은?</option>
								<option value="3">자신의 보물 제1호는?</option>
								<option value="4">유년시절 가장 생각나는 친구 이름은?</option>
								<option value="5">인상 깊게 읽은 책 이름은?</option>
								<option value="6">자신이 두번째로 존경하는 인물은?</option>
								<option value="7">어릴적 별명은?</option>
								<option value="8">다시 태어나면 되고 싶은 것은?</option>
								<option value="9">내가 좋아하는 캐릭터는?</option>
								<option value="10">내가 좋아하는 색깔은?</option>
						</select></td>
					</tr>
					<tr>
						<th>비밀번호 답</th>
						<td><input type="text" id="pwqans" name="pwqans" class="member" required></td>
					</tr>
				</table>
				<br>
					<button type=button id="loginBtn_normal" class="loginBtn">확인</button>
				<br>
				<br>
				<hr width=30% color="white">
				<br>
			</div>
		</form>
	</section>
<!----테이블 섹션  끝 --------------------------------------------------------------------->											

<!---- 풋터 시작 --------------------------------------------------------------------->											

	<footer>
		<table id="footer">
			<tbody>
				<tr>
					<td><div class="footer_link" onclick="goNotice();">&nbsp공 지 사 항 </div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="goUltaryLoginMain();">&nbsp로 &nbsp그 &nbsp인&nbsp</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gofindId();">아이디 찾기</div></td>
					<td>|</td>
					<td><div class="footer_link" onclick="gomemberJoin();"> 회 원 가 입 &nbsp</div></td>
				</tr>
			</tbody>
		</table>
	</footer>
<!---- 풋터 끝 --------------------------------------------------------------------->											
	<script>
	
	$('#loginBtn_normal').click(function(){
		var userId = $('#fine_Pwd_Id2');
		var pwquery = $('#pwquery');
		var pwqans = $('#pwqans');
		
		var validatechk = false;
		$.ajax({ // 아이디, 비번질문, 비번질문답으로 회원인지 조회
			url: '<%= request.getContextPath() %>/findPwdQna.mem',
			data: {userId:userId.val(), pwquery:pwquery.val(), pwqans:pwqans.val()},
			success: function(data){
				console.log(data);
				if(data.trim() == 'success'){
					$('#find_Pwd').submit();
		 			//새비번입력창으로
				}else{
					alert('입력하신 사항이 일치하지 않습니다. 다시 입력해주세요.');
					pwqans.focus();
				}
			}
		});
	});
	
	
	function goNotice(){ // 공지사항으로 이동
		location.href='<%= request.getContextPath() %>/#';
	}
	function goUltaryLoginMain(){ //로그인으로 이동
		location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp'
	}
	function gofindId(){ //아이디 찾기로 이동
		location.href='<%= request.getContextPath() %>/views/main/findMember/findIdForm.jsp';
	}
	function gomemberJoin(){ //회원가입으로 이동
		location.href='<%= request.getContextPath() %>/views/main/memberJoinForm.jsp';
	}
	
	</script>

</body>
</html>