<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList,post.model.vo.*"%>
<%
	Post p = (Post)request.getAttribute("p");
	ArrayList<Media> mList = (ArrayList<Media>)request.getAttribute("mList");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/cmpostWrite.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
					<form action="<%= request.getContextPath() %>/cmUpdate.po" method="post">
					<div id="sectiondiv1">
						<div id="sTop">게시글 수정</div>
						<hr>
						<div id="sTitle">
							<label>Title : </label>
							<input type="hidden" name="pNum" value="<%= p.getPostNum()%>">
							<input type="text" name="title"value="<%=p.getPostTitle()  %>">
							<select name="postRange">
								<option value="1" selected>전체공개</option>
								<option value="2">내관심회원만</option>
								<option value="3">나만보기</option>
							</select>
						</div>
						<hr>
						<div id="sContent">
							<label>Content : </label><br>
							<% String contents = (p.getPostContent()).replace("\r\n", "<br>"); %>
							<textarea name="postContent"><%= contents %></textarea>
						</div>
						<hr>
						<div id="sAdd">
							<label>카테고리 설정&nbsp;&nbsp;| </label>
							<select name="categorynum" id="categorynum">
								<option value="2" selected>펫일상</option>
								<option value="3">펫지식</option>
								<option value="4">펫리뷰</option>
								<option value="5">펫분양</option>
							</select>
						</div>
						<hr>
                  <div id="sMedia">
                     <div class="sMedia" id="media1">
                        <img id="mediaImg1" width="100%" height="100%" src="">
                     </div>
                     <div class="sMediaL"></div>
                     <div class="sMedia" id="media2">
                        <img id="mediaImg2" width="100%" height="100%" src="">
                     </div>
                     <div class="sMediaL"></div>
                     <div class="sMedia" id="media3">
                        <img id="mediaImg3" width="100%" height="100%" src="">
                     </div>
                     <div class="sMediaL"></div>
                     <div class="sMedia" id="media4">
                        <img id="mediaImg4" width="100%" height="100%" src="">
                     </div>
                  </div>
						<hr>
						<div id="sSubmit">
							<input type="submit" value="Complete">
						</div>
					</div>
<script>
function resetall(){
	$('#title').val("");
	$('#content').val("");
}
<% switch(p.getPostRange()){ 
	case 1:%>
		$('#range1').prop("selected", true);
		<% break; 
	case 2: %>
		$('#range2').prop("selected", true);
		<% break;
	case 3: %>
		$('#range3').prop("selected", true);
		<% break;
  } %>

<% switch(p.getCategorynum()){ 
	case 2:%>
		$('#catenum1').prop("selected", true);
		<% break; 
	case 3: %>
		$('#catenum2').prop("selected", true);
		<% break;
	case 4: %>
		$('#catenum3').prop("selected", true);
		<% break;
	case 5: %>
		$('#catenum4').prop("selected", true);
		<% break;
   } %>

<% if(!mList.isEmpty()){ 
	if(mList.size()== 1){ %>
	$("#mediaImg1").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(0).getWebName() %>");
	<% } else if(mList.size() == 2){ %>
	$("#mediaImg1").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(0).getWebName() %>");
	$("#mediaImg2").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(1).getWebName() %>");
	<% } else if(mList.size() == 3){ %>
	$("#mediaImg1").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(0).getWebName() %>");
	$("#mediaImg2").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(1).getWebName() %>");
	$("#mediaImg3").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(2).getWebName() %>");
	<% } else if(mList.size() == 4){ %>
	$("#mediaImg1").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(0).getWebName() %>");
	$("#mediaImg2").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(1).getWebName() %>");
	$("#mediaImg3").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(2).getWebName() %>");
	$("#mediaImg4").attr("src","<%= request.getContextPath() %>/uploadFiles/<%= mList.get(3).getWebName() %>");
	<% } %>
<% } %>
	$('#complete').click(function check(){
		if($('#title').val() == ""){
			alert('제목을 입력해주세요');
			$('#title').focus();
			return false;
		} else if($('#postContent').val() ==""){
			alert('내용을 입력해주세요');
			$('#postContent').focus();
			return false;
		}
		return true;
	});
</script>
				</form>
				
				</section>
			</div>
			<footer>from.hoseong</footer>
		</div>
	</div>
</body>
</html>