<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.Member, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	Media proImg = (Media)session.getAttribute("proImg");
	ArrayList<Member> markList = (ArrayList<Member>)request.getAttribute("markList");
	ArrayList<Media> proList = (ArrayList<Media>)request.getAttribute("proList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심회원</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/markMember.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
	<%@ include file="chat.jsp" %>
	<div id="all">
		<div id="all-wrap">
	<%@ include file="myUltaryheader.jsp" %>
	<%@ include file="navaside.jsp" %>
			<section>
				<% for(int i=0;i<markList.size();i++){ %>
				<div class="markmember">
					<% if(!proList.isEmpty()){
						for(int j=0;j<=proList.size();j++) {
							if(j==proList.size()){ %>
					<div class=markimg><a href="<%= request.getContextPath() %>/otherpost.tl?nickname=<%= markList.get(i).getNickname() %>"><img src="<%= request.getContextPath() %>/image/프로필.png"></a></div>
							<% break;
							} 
							Media m = proList.get(j); 
							if(markList.get(i).getNickname().equals(m.getMemberId())){%>
					<div class=markimg><a href="<%= request.getContextPath() %>/otherpost.tl?nickname=<%= markList.get(i).getNickname() %>"><img src="<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>"></a></div>
							<% break;
							} %>
						<% } %>		
					<% } else{ %>
					<div class=markimg><a href="<%= request.getContextPath() %>/otherpost.tl?nickname=<%= markList.get(i).getNickname() %>"><img src="<%= request.getContextPath() %>/image/프로필.png"></a></div>
					<% } %>
					<div class="marknick"><a href="<%= request.getContextPath() %>/otherpost.tl?nickname=<%= markList.get(i).getNickname() %>"><%= markList.get(i).getNickname() %></a></div>
					<div class="marklike">
						<div><%= markList.get(i).getMarkscore() %> MARK</div>
						<button id="markcancel<%= i %>">관심취소</button>
					</div>
				</div>
<script>
	$(function(){
		var markBtn = "#markcancel"+<%= i %>;
		$(markBtn).click(function(){
			var result = confirm('해당 관심회원을 삭제하시겠습니까?');
			
			if(result){
				var markmem = "<%= markList.get(i).getNickname() %>";
				var memberid = "<%= loginUser.getMemberId() %>";
				$.ajax({
					url: 'markmember.mark',
					data: {markmem:markmem, memberid:memberid},
					success: function(data){
						location.reload();
					}
				});
			} else{
				alert("취소!");
			}
		});
	});
</script>
				<% } %>
			</section>

		</div>
		<footer>제작사:hoseong</footer>
	</div>
</body>
</html>