<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowTime = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sf.format(nowTime);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ULTARY</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">

<style>
    #content {
        background: whitesmoke;
        margin-top : 30px;
    }
    #mainWrapper {
        line-height: 2em;
        font-family: "맑은 고딕";
        text-align: center;
        height: 600px;
    }
    .outer{
		width: 600px; height: 540px; background-color: rgba(255, 255, 255, 0.4); border: 15px solid skyblue;
		margin-left: auto; margin-right: auto; margin-top: 50px;
		border-radius: 15px;
	}
	.tableArea {width:450px; height:350px; margin-left:auto; margin-right:auto;}
	#insertNoBtn, #cancelBtn{background: skyblue; color: white; border-radius: 20px; width: 80px; heigth: 25px; text-align: center; display: inline-block;}
	#insertNoBtn:hover, #cancelBtn:hover{cursor: pointer;}
	#cancelBtn{background: #D1B2FF;}
	
</style>

</head>
<body>

	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/sp_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/sp_aside.jsp" %>
				
	<!-- 내용 들어갈 영역 -->
    <section id ="content">
     <div id ="mainWrapper">
       
       <div class="outer">
		<br>
		<h2 align="center">공지사항 작성(관리자용)</h2>
		<div class="tableArea">
			<form action="<%= request.getContextPath() %>/sinsert.no" method="post" onsubmit="return checkContent();">
				<table>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" size="50" name="title" id="titleC"></td>				
					</tr>
					<tr>
						<th>작성자</th>
						<td>
							<%= loginUser.getMemberId()%>
						</td>
						<th>작성일</th>
						<td>
							<%= today %>
						</td>
					</tr>
					<tr>
						<th>내용</th>
					</tr>
					<tr>
						<td colspan="4">
							<textarea name="content" cols="60" rows="15" style="resize:none;" id ="contentC"></textarea>
						</td>
					</tr>
				</table>
				
				<br>
				
				<div align="center">
					<button type="submit" id="insertNoBtn">등록</button>
					<button type="reset" onclick="location.href='javascript:history.go(-1);'" id="cancelBtn">취소</button>
				</div>
			</form>
			<br>
		</div>
	</div>
	
     </div>
     
    </section>
    </div>
   </div>
   </div> 

	<script>
		function checkContent(){
			var title = document.getElementById('titleC').value;
			var content = document.getElementById('contentC').value;
			
			if(title == ""){
				alert('제목을 입력하세요');
				return false;
			}else if( content== ""){
				alert('내용을 입력하세요');
				return false;
			}else{
				return true;
			}
		}
	</script>
</body>
</html>