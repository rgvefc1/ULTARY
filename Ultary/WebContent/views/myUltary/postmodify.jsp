<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, java.util.ArrayList, post.model.vo.*"%>
<%
   Member loginUser = (Member)session.getAttribute("loginUser");
   Media proImg = (Media)session.getAttribute("proImg");
   Post p = (Post)request.getAttribute("p");
   ArrayList<Media> mList = (ArrayList<Media>)request.getAttribute("mList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
   <link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/postWrite.css">
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>
#sSubmit input:hover{
   cursor:pointer;
}
#sMedia:hover{
   cursor:pointer;
}
#resetBtn{
   margin-right: 30px;
    float: right;
    width: 120px;
    height: 38.5px;
    font-size: 21.2px;
    border-radius: 10px;
    border-width: 0px;
    background: #363636;
    color: white;
    text-align: center;
    cursor: pointer;
    line-height: 35px;
}
</style>
</head>
<body>
   <%@ include file="chat.jsp" %>
   <div id="all">
      <div id="all-wrap">
   <%@ include file="myUltaryheader.jsp" %>
   <%@ include file="navaside.jsp" %>
         <section>
            <form action="<%= request.getContextPath() %>/update.tl" method="post" >
               <div id="sectiondiv1">
                  <div id="sTop">게시글 수정</div>
                  <hr>
                  <div id="sTitle">
                     <label>Title : </label>
                     <input type="hidden" value="<%= p.getPostNum() %>" name="pNum">
                     <input id="title" name="title" value="<%= p.getPostTitle() %>">
                     <select name="postRange">
                        <option id="range1" value="1" selected>전체공개</option>
                        <option id="range2" value="2">내관심회원만</option>
                        <option id="range3" value="3">나만보기</option>
                     </select>
                  </div>
                  <hr>
                  <div id="sContent">
                     <label>Content : </label><br>
                     <textarea id="content" name="postContent"><%= p.getPostContent() %></textarea>
                  </div>
                  <hr>
                  <div id="sAdd">
                     <label>카테고리 설정&nbsp;&nbsp;| </label>
                     <select name="categorynum">
                        <option id="catenum1" value="2">펫일상</option>
                        <option id="catenum2" value="3">펫지식</option>
                        <option id="catenum3" value="4">펫리뷰</option>
                        <option id="catenum4" value="5">펫분양</option>
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
                     <input type="button" value="ResetAll" id ="resetBtn2" onclick="resetall();">
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
</script>
            </form>
         </section>
      </div>
      <footer>제작사:hoseong</footer>
   </div>
</body>
</html>