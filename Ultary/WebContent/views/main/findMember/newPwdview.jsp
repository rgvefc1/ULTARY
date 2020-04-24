<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 설정 완료</title>
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
			<form>
				<h1>새 비밀번호 설정 완료</h1>
				<hr width=40% color="white">
				<br>
				<table>
					<tr>
						<th style="padding-right:10px;">새 비밀번호 설정이 완료되었습니다.</th>
					</tr>
				</table>
				</form>
				<br>
				<hr width=40% color="white">
				<br>
					<button id="loginBtn_normal" class="loginBtn" onclick="goUltaryLoginMain();">로그인하러 가기</button>
				<br>
				<br>
				<br>
			</div>
		
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