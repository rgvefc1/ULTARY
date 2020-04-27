<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,post.model.vo.*, java.util.ArrayList"%>
<%
	Post post = (Post)request.getAttribute("post");

	ArrayList<Media> fileList = (ArrayList<Media>)request.getAttribute("fileList");
	ArrayList<Media> proList = (ArrayList<Media>)request.getAttribute("proList");
	ArrayList<PostComment> pclist = (ArrayList<PostComment>)request.getAttribute("pclist");	
	ArrayList<CAns> calist = (ArrayList<CAns>)request.getAttribute("calist");
	int checklike = (int)request.getAttribute("checklike");
	int checkmarkpost = (int)request.getAttribute("checkmarkpost");
	
	
	String categoryname = "";
	switch(post.getCategorynum()){
	case 1 : categoryname ="공지사항";break;
	case 2 : categoryname ="펫일상";break;
	case 3 : categoryname ="펫지식";break;
	case 4 : categoryname="펫리뷰";break;
	case 5 : categoryname ="펫분양";break;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/cm_details.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
<body>
<script>
	$(function(){
		ansbull = true;
		ansempty = true;
		cNumber = ""; // 댓글 번호
	});
</script>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
				  <div class="cmcontent">
				  	<div class="cm_wrap">
				  	<form action="<%= request.getContextPath() %>/update.po" method="post">
				  		<div id="cm_detail_all">
				  			<div id="cm_detail_title">
				  				<div id="cdt_title"><%= post.getPostTitle() %></div>
				  				<div id="cdt_cname"><%= categoryname %></div>
				  				<input type="hidden" name ="title" value="<%= post.getPostTitle() %>"> 
				  				<input type="hidden" name="pNum" value="<%= post.getPostNum() %>">
				  				
				  				<div id="cdt_wdate"><%= post.getPostDate()%>
				  				</div>
				  			</div>
				  			<br>
				  			<div id="cdt_border"></div>
				  			<div id="cdt_detail_writer">
					  			<!-- 프로필 -->
					  			<div id="cdt_profile">
								<% if(!proList.isEmpty()) { 
						  			for(int o=0;o<=proList.size();o++){
						  				if(o==proList.size()){	%>
							  			<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png">
							  			<% break; }
							  			Media cProimg  = proList.get(o);
							  			if(cProimg.getMemberId().equals(post.getMemberid())){ %>
							  			<img class="comment2-1img" src="<%= request.getContextPath() %>/uploadFiles/<%= cProimg.getWebName() %>">
							  			<% break; }
							  						}
							  			} else { %>
							  			<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png">
							  		 <% } %>
							  	</div>
				  			<label><%= post.getMemberid() %></label>
				  			</div>
				  			<div id="cdt_detail_content">
				  			<% ArrayList<Media> imgList = new ArrayList<Media>(); 
				  				for(int j= 0;j<fileList.size();j++){
				  					Media m = fileList.get(j);
				  					imgList.add(m);
				  				}
								if(!imgList.isEmpty()) { %>
				  				<div class="media">
									<div class="slide" id="slide">
									<div id="back" class="slideBtn"><img src="<%= request.getContextPath() %>/image/왼쪽 화살표.png" alt="" width="50"></div>
									<ul>
									<% for(int i =0; i<fileList.size();i++) { 
										Media real = imgList.get(i);
									%>
										<li><img id="detailImg" class="detailImg" width="550" height="350"
											src="<%= request.getContextPath() %>/uploadFiles/<%=real.getWebName()%>"></li>
											
									<% } %>
									</ul>
									<div id="next" class="slideBtn"><img src="<%= request.getContextPath() %>/image/오른쪽 화살표.png" alt="" width="50"></div>
									</div>  				
				  				</div>		
				  				<% } %>
				  				<div id=cdt_wrap>
				  				<% String contents = (post.getPostContent()).replace("\r\n", "<br>"); %>
								<%= contents %>
								<input type="hidden" name="content" value="<%= post.getPostContent() %>">
								<input type="hidden" name="range" value="<%= post.getPostRange() %>">
				  				</div>
				  				<div id="cdt_like_recom_report">
				  				<% if(checkmarkpost == 1) { %>
				  				<input type="button" class="cdt_like" value="관심글 취소">
				  				<% } else { %>
				  				<input type="button" class="cdt_like" value="관심글 등록 ">
				  				<% } %>
				  				<% if(checklike == 1) { %>
				  				<input type="button" class="cdt_recom" value="취소">
				  				<% } else { %>
				  				<input type="button" class="cdt_recom" value="추천">
				  				<% } %>
				  				<% if(loginUser != null && loginUser.getNickname().equals(post.getMemberid())){ %>
				  				<input type="submit" id="modify" value="수정">
				  				<% if(loginUser != null && (loginUser.getNickname().equals(post.getMemberid()) || loginUser.getNickname().equals("관리자"))){ %>
				  				<input type="button" id="deletebtn" value="삭제">
				  				<% } %>
				  				<% } %>
				  				<div id="menuBtn">목록으로</div>
				  				</div>
				  				</div>	
				  				</div>
				  </form>
				  			<hr>
				  				<!-- 댓글 부분 -->
				  			<div id="detail_comment">
				  					<% if(!pclist.isEmpty()) { %>
				  						<% for(int x=0;x<pclist.size();x++){ 
				  							PostComment pc = pclist.get(x);
				  							if(post.getPostNum() == pc.getPostNum()){ %>
					  						<div class="comment1">
					  							<div class="comment2-1">
					  								<% if(!proList.isEmpty()) { 
					  									for(int o=0;o<=proList.size();o++){
					  										if(o==proList.size()){	%>
						  						<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png">
						  							<% break; 
					  									}
						  								Media cProimg  = proList.get(o);
						  								if(cProimg.getMemberId().equals(pc.getMemberid())){ %>
						  						<img class="comment2-1img" src="<%= request.getContextPath() %>/uploadFiles/<%= cProimg.getWebName() %>">
						  						<% break;
						  							}
						  						}
						  					} else { %>
						  						<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png">
						  					<% } %>
				  							</div>
				  							<div class="comment2-3"><%= pc.getMemberid() %></div>
				  							<div class="comment2-2">
				  							<% if(pc.getcRange() == 2) {
				  								if(loginUser.getNickname().equals(post.getMemberid()) || loginUser.getNickname().equals(pc.getMemberid())){%>
				  								<%= pc.getcContent() %>
				  								<% } else { %>
				  								비밀 댓글입니다.
				  								<%= pc.getMemberid() %>
				  								<% } %>
				  							<% } else {%>
				  							<%= pc.getcContent() %>
				  							<% } %>
				  							</div>
				  							<div id="comment2-4<%= x %>" class="comment2-4"><%= pc.getcLike() %> like</div>
				  							<% if(pc.getcRange() == 2) { %>
				  							<% if(loginUser.getNickname().equals(pc.getMemberid()) || post.getMemberid().equals(pc.getMemberid())){ %>
				  							<div id="comment2-5<%= x %>" class="comment2-5">답글달기</div>
				  							<% } %>
				  							<% }else {%> 
				  							<div id="comment2-5<%= x %>" class="comment2-5">답글달기</div>
				  							<% } %>
				  							<% if(pc.getMemberid().equals(loginUser.getNickname())) {%>
				  								<div id="comment2-6<%= x %>" class="comment2-6">삭제</div>
				  							<% } %>	
<!--댓글 스크립트 -->
<script type="text/javascript">
   /*  댓글좋아요수! */
	$(function(){
		var cmlikeBtn = "#comment2-4"+<%= x %>;
		var cNum = <%= pc.getcNum() %>;
		
		$(cmlikeBtn).click(function(){
			$.ajax({
				url: 'commentlike.up',
				data: {cNum:cNum},
				success: function(data){
					$(cmlikeBtn).text(data+" like");
				}
			});
		});
		
		/* 댓글에 답글달기 버튼나오게하기 */
		var ansBtn = "#comment2-5"+<%= x %>;
		
		$(ansBtn).click(function(){
			var ansdiv = "#commentansdiv";
			var anstext = "#commentanstext";
			var ansget = "----- <%= pc.getMemberid() %> 님에게 답글달기 -----";
			
			ansbull = false;
			$(ansdiv).show();
			$(anstext).text(ansget);
			cNumber = "<%= pc.getcNum() %>";
		});
		
		/* --------답글버튼 없애기 ------------ */
		
		var ansdiv = "#commentansdiv";
		
		$('.commentansclose').click(function(){
			$(ansdiv).hide();
			ansbull = true;
			cNumber = "";
		});
		
		/* ---------댓글 삭제하기 -------------- */
		
		var cmDeleteBtn = "#comment2-6"+<%= x %>;
		
		$(cmDeleteBtn).click(function(){
			var result = confirm("댓글을 삭제하시겠습니까?");
			var cNum = <%= pc.getcNum() %>;
			
			if(result){
				alert("삭제하였습니다.");
				$.ajax({
					url: 'deleteComment.tl',
					data: {cNum:cNum},
					success: function(data){
						location.reload();
					}
				});
			} else{
				alert("삭제 취소");
			}
		});

	});
</script>			  						
								<% if(!calist.isEmpty()){ %>
								<% for(int y=0;y<calist.size();y++){
										CAns ca = calist.get(y); %>
									<% if(pc.getcNum() == ca.getcNum()){ %>
								<div class="commentans">
									<div class="commentans2-0">ㄴ</div>
									<div id="cdt_profile">
									<% if(!proList.isEmpty()){ %>
										<% for(int o=0;o<=proList.size();o++) {
											if(o==proList.size()){ %>
										<img class="commentans2-1img" src="<%= request.getContextPath() %>/image/프로필.png">			
											<% break;
											}
											Media cProimg = proList.get(o);
											if(cProimg.getMemberId().equals(ca.getMemberid())){ %>
										<img class="commentans2-1img" src="<%= request.getContextPath() %>/uploadFiles/<%= cProimg.getWebName() %>">
											<% break;
											} %>
										<% } %>
									<% } else{ %>
										<img class="commentans2-1img" src="<%= request.getContextPath() %>/image/프로필.png">
									<% } %>
									</div>
									<div class="commentans2-3"><%= ca.getMemberid() %></div>
									<div id="" class="commentans2-2">
									<% if(pc.getcRange() == 2){ %>
										<% if(loginUser.getNickname().equals(pc.getMemberid())){ %>
											<%= ca.getAnsContent() %>
										<% } else{ %>
											비밀 답글 입니다.
										<% } %>
									<% } else{ %>
										<%= ca.getAnsContent() %>
									<% } %>	
									</div>
									<% if(ca.getMemberid().equals(loginUser.getNickname())){ %>
									<div id="commentans2-4<%= y %>"class="commentans2-4">삭제</div>
									<% } %>
								</div>
<script>
	$(function(){
	/* ---------답글 삭제하기 -------------- */
		
		var cmDeleteBtn = "#commentans2-4"+<%= y %>;
		
		$(cmDeleteBtn).click(function(){
			var result = confirm("답글을 삭제하시겠습니까?");
			var ansNum = <%= ca.getAnsNum() %>;
			
			if(result){
				alert("삭제하였습니다.");
				$.ajax({
					url: 'deleteCAns.tl',
					data: {ansNum:ansNum},
					success: function(data){
						location.reload();
					}
				});
			} else{
				alert("삭제 취소");
			}
		});
		
	});
</script>
								
		
										<% } %>
				  					<% } %>
				  				<% } %>
				  				</div>
				  					<% } %>
				  				<% } %>
				  			<% } %>
				  			
				  		<div id="commentansdiv" class=commentansdiv>
							<span id="commentanstext"></span>
							<button class="commentansclose">x</button>
						</div>
						<div class="commenttextdiv">
								<div class="writercomment">
									<select id="commentrange" class="commentrange">
										<option value="1">전체공개</option>
										<option value="2">작성자만</option>
									</select>
								</div>
								<div id="ct_wrap">
								<input id="commenttext" class="commenttext" type="text" placeholder="내용을 입력해주세요">
								<button id="commentsubmit"class="commentsubmit">등록</button>
								</div>
								</div>
				  			</div>
<script type="text/javascript">
$(function(){
	/* ------------댓글 입력하기 ------------- */
	
	var commentsubmit = "#commentsubmit";
	var commenttextch = "#commenttext";
	
		$(commenttextch).keydown(function(key){
			var $commenttextcm = $(commenttextch).val();
			if($commenttextcm != ""){
				ansempty = true;
			} else{
				ansempty = false;
			}
			if(key.keyCode == 13){
				var commenttext = "#commenttext";
				var writer = '<%= loginUser.getMemberId() %>';
				var content = $(commenttext).val();
				var pNum = <%= post.getPostNum() %>;
				var $range = "#commentrange";
				var range = $($range).val();
				var pNic = '<%= post.getMemberid() %>';
				
				if(ansempty && ansbull){
					$.ajax({
						url: 'insertComment.tl',
						data: {writer:writer, pNum:pNum, content:content, range:range, pNic:pNic},
						success: function(data){
							location.reload();
						}
					});
				} else if(ansempty && !ansbull){
					$.ajax({
						url: 'insertCAns.tl',
						data: {pNum:pNum,cNumber:cNumber, writer:writer, content:content},
						success: function(data){
							location.reload();
						}
					});
				}
			}
		});
		$(commentsubmit).click(function(){
			var $commenttextcm = $(commenttextch).val();
			if($commenttextcm != ""){
				ansempty = true;
			} else{
				ansempty = false;
			}
			var commenttext = "#commenttext";
			var writer = '<%= loginUser.getMemberId() %>';
			var content = $(commenttext).val();
			var pNum = <%= post.getPostNum() %>;
			var $range = "#commentrange";
			var range = $($range).val();
			var pNic = '<%= post.getMemberid() %>';
			
			if(ansempty && ansbull){
				$.ajax({
					url: 'insertComment.tl',
					data: {writer:writer, pNum:pNum, content:content, range:range, pNic:pNic},
					success: function(data){
						location.reload();
					}
				});
			} else if(ansempty && !ansbull){
				$.ajax({
					url: 'insertCAns.tl',
					data: {pNum:pNum,cNumber:cNumber, writer:writer, content:content},
					success: function(data){
						location.reload();
					}
				});
			}
		});
});
</script>				  			
				  		<!-- 게시물 감싸는 부분 끝 cm_wrap -->
				  		</div>
				  	</div>
				</section>
			<script>
				$('#menuBtn').click(function(){
					switch(<%= post.getCategorynum() %>){
					case 1: location.href='<%= request.getContextPath() %>/cmList.po?cnum=1';break;
					case 2: location.href='<%= request.getContextPath() %>/cmList.po?cnum=2';break;
					case 3: location.href='<%= request.getContextPath() %>/cmList.po?cnum=3';break;
					case 4: location.href='<%= request.getContextPath() %>/cmList.po?cnum=4';break;
					case 5: location.href='<%= request.getContextPath() %>/cmList.po?cnum=5';break;
					}
				});
				
$(document).ready(function(){
			  var imgs;
		      var img_count;
		      var img_position = 1;
		      var slide = "#slide ul";
		      var backbtn = "#back";
		      var nextbtn = "#next";

		      imgs = $(slide);
		      $back = $(backbtn);
		      $next = $(nextbtn);
		      img_count = imgs.children().length;

		      //버튼을 클릭했을 때 함수 실행
		      $back.click(function () {
		        back();
		      });
		      $next.click(function () {
		        next();
		      });

		      function back() {
		        if(1<img_position){
		          imgs.animate({
		            left:'+=550px'
		          });
		          img_position--;
		        }
		      }
		      function next() {
		        if(img_count>img_position){
		          imgs.animate({
		            left:'-=550px'
		          });
		          img_position++;
		        }
		      }
		});
</script>
<script>
			$(function(){
				$('.slideBtn').hover(function(){
					$('.slideBtn').css("opacity", "1");
				}, function(){
					$('.slideBtn').css("opacity", "0");
				});
			});
			
			//게시글 삭제
			$(function(){
				var dbtn = "#deletebtn";
				$(dbtn).click(function(){
					var result = confirm("게시글을 삭제하시겠습니까?");
					var pNum = <%= post.getPostNum() %>;
					
					if(result){
						alert("삭제하였습니다.");
						$.ajax({
							url:'deletePost.tl',
							data : {pNum:pNum},
							success:function(data){
								location.href="<%= request.getContextPath() %>/cmList.po?cnum=<%= post.getCategorynum()%>"
							}
						});
					} else {
						alert('삭제취소');
					}
				});
			});
/* 게시글 추천, 좋아요 올리기*/
$(document).ready(function(){
	var likeBtn = ".cdt_recom";
	var postNum = <%= post.getPostNum() %>;
	$(likeBtn).click(function(){
		$.ajax({
			url:'postlike.up',
			data: {postNum:postNum},
			success: function(data){
				location.reload();
			}
		});
	});
	
	/* 관심글 등록 */
	var markPostBtn = ".cdt_like";
	$(markPostBtn).click(function(){
		var postNum = <%= post.getPostNum() %>;
		$.ajax({
			url:'insertMarkPost.tl',
			data:{postNum:postNum},
			success:function(data){
				location.reload();
			}
		});
	});
	
});

</script>
			</div>
			<footer>from.hoseong</footer>
			</div>
		</div>
</body>
</html>