<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*, post.model.vo.*, java.util.ArrayList"%>
<%
	Member loginUser = (Member)session.getAttribute("loginUser");
	ArrayList<Post> allHpost = (ArrayList<Post>)request.getAttribute("allHPost"); // 모든 게시글 좋아요순
	ArrayList<PostComment> allpc = (ArrayList<PostComment>)request.getAttribute("allpc"); // 모든 댓글목록
	ArrayList<CAns> allca = (ArrayList<CAns>)request.getAttribute("allca"); // 모든 답글목록
	ArrayList<Media> postImg = (ArrayList<Media>)request.getAttribute("postImg"); // 모든 프사,게시글사진
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/main.css">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet"  href="https://han3283.cafe24.com/js/lightslider/css/lightslider.css"/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="https://han3283.cafe24.com/js/lightslider/js/lightslider.js"></script>
</head>
<body>
<script>
	$(function(){
		item = 0;
		ansempty = false;
		ansbull = true;
	});
</script>
	<%@ include file="alertchat.jsp" %>
	<div id="expansion">
		<div id="expansionIn">
			<div id="expansiontop">
				<div id="expansionL">
					<div id="imgslide" class="imgslide">
						<div id="back" class="slideBtn"><img src="<%= request.getContextPath() %>/image/왼쪽 화살표.png" alt="" width="50"></div>
						<ul>
						</ul>
						<div id="next" class="slideBtn"><img src="<%= request.getContextPath() %>/image/오른쪽 화살표.png" alt="" width="50"></div>
					</div>
				</div>
				<div id="expansionR">
					<div id="expansionexit">X</div>
					<div id="expansionRheader">
						<div id="expansionWriter">
							<img id="expansionimg" src="<%= request.getContextPath() %>/image/프로필.png">
							<span id="expansionWri">닉네임</span>
						</div>
						<div id="expansiondate">게시일 | 2020. 03. 29 (SUN) 17:55</div>
					</div>
					<div id="expansionRsection">
						<div id="expansionTitle">Title | 제목<hr></div>
						<div id="expansioncontent">
						</div>
						<div id="expansioncomment">
							<h2>로그인이 필요한 서비스입니다.</h2>
						</div>
					</div>
				</div>
			</div>
			<div id="expansionbottom">
				<div id="expansioncategory" class="expansionbox">카테고리</div>
				<div id="petlife"></div>
				<div id="like">♡</div>
				<div id="likescore" class="expansionbox"></div>
				<div id="commenttextdiv">
				</div>
			</div>
		</div>
	</div>
<script>
	$(function(){
		$('#expansionexit').click(function(){
			$('#expansion').hide();
		});
	});
</script>
	<header>
		<div id="top-header">
			<div id="top-left">
				<% if((loginUser) != null) { %>
				<div class="top-button" id="chatbtn">
					<img class="top-buttonimg" src="<%= request.getContextPath() %>/image/메신저.png">
				</div>
				<div class="top-button" id="alertbuttondiv">
					<img class="top-buttonimg" id="alertbutton" src="<%= request.getContextPath() %>/image/알림.png">
				</div>
				<% } %>
			</div>
			<div id="top-right">
				<% if((loginUser) == null){ %>
				<button class="top-right" onclick="location.href='<%= request.getContextPath() %>/views/main/ultaryLoginMain.jsp'">로그인</button>
				<% } else{ %>
				<div id="member"><%= loginUser.getNickname() %></div>
				<div id="nim">님</div>
				<button class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me?page=main'">로그아웃</button>
				<% } %>
			</div>
		</div>
		<div id="bottom-header">
			<div id="bottom-header-wrap">
				<div id="logeleft1"></div>
				<div id="logoleft2"></div>
				<div id="logo">
					<a href='<%= request.getContextPath() %>/main.ini'><img id="logoimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
				</div>
			</div>
		</div>
		<div id="category">
			<div id='cssmenu'>
					<ul>
						<li>
							<a>내울타리</a>
							<ul id="menu1">
								<li>
									<a>타임라인</a>
								</li>
								<li><a>게시글작성</a></li>
								<li><a>관심회원</a></li>
								<li><a>게시글 즐겨찾기</a></li>
								<li><a>내 위탁환경</a></li>
							</ul>
						</li>
						<li>
							<a>커뮤니티</a>
							<ul id="menu2">
								<li><a>공지사항</a></li>
								<li><a>모아보기</a></li>
								<li><a>펫일상</a></li>
								<li><a>펫지식</a></li>
								<li><a>펫리뷰</a></li>
								<li><a>펫분양</a></li>
							</ul>
						</li>
						<li><a href='#'>위탁매칭</a>
							<ul id="menu3">
								<li><a>위탁검색</a></li>
								<li><a>의뢰 관리</a></li>
								<li><a>내가 남긴 리뷰</a></li>
							</ul>
						</li>
						<li><a href='#'>마이페이지</a>
							<ul id="menu4">
								<li><a>내 정보 관리</a></li>
								<li><a>비밀번호변경</a></li>
								<li><a>회원 탈퇴</a></li>
							</ul>
						</li>
						<li><a href='#'>고객센터</a>
							<ul id="menu5">
								<li><a>공지 사항</a></li>
								<li><a>자주하는 질문</a></li>
								<li><a>1:1 문의</a></li>
							</ul>
						</li>
					</ul>
				</div>
		</div>
	</header>
<script>
   <% if((loginUser) == null){ %>
   $('#cssmenu>ul a').click(function(){
      window.alert('로그인을 해주세요.');
   });
   <% } else{ %>
   $('#cssmenu>ul>li:eq(0)>a').click(function(){
      location.href="<%= request.getContextPath() %>/post.tl";
   });
   $('#menu1>li:eq(0) a').click(function(){
      location.href="<%= request.getContextPath() %>/post.tl";
   });
   $('#menu1>li:eq(1) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myUltary/postWrite.jsp";
   });
   $('#menu1>li:eq(2) a').click(function(){
      location.href="<%= request.getContextPath() %>/markmember.mem";
   });
   $('#menu1>li:eq(3) a').click(function(){
      location.href="<%= request.getContextPath() %>/markpost.tl";
   });
   $('#menu1>li:eq(4) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myUltary/trustEvm.jsp";
   });
   $('#cssmenu>ul>li:eq(1)>a').click(function(){
      location.href="<%= request.getContextPath() %>/cmAllList.po";
   });
   $('#menu2>li:eq(0) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmList.po?cnum=1";
   });
   $('#menu2>li:eq(1) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmAllList.po";
   });
   $('#menu2>li:eq(2) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmList.po?cnum=2";
   });
   $('#menu2>li:eq(3) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmList.po?cnum=3";
   });
   $('#menu2>li:eq(4) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmList.po?cnum=4";
   });
   $('#menu2>li:eq(5) a').click(function(){
      location.href="<%= request.getContextPath() %>/cmList.po?cnum=5";
   });
   $('#cssmenu>ul>li:eq(2)>a').click(function(){
      location.href="<%= request.getContextPath() %>/views/trustMatch/matching01.jsp";
   });
   $('#menu3>li:eq(0) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/trustMatch/matching01.jsp";
   });
   $('#menu3>li:eq(1) a').click(function(){
      location.href="<%= request.getContextPath() %>/TpostView.tu";
   });
   $('#menu3>li:eq(2) a').click(function(){
      location.href="<%= request.getContextPath() %>/myreview.tu";
   });
   $('#cssmenu>ul>li:eq(3)>a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp";
   });
   $('#menu4>li:eq(0) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myPage/memberUpdate.jsp";
   });
   $('#menu4>li:eq(1) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myPage/pwdUpdate.jsp";
   });
   $('#menu4>li:eq(2) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/myPage/memberDelete.jsp";
   });
   $('#cssmenu>ul>li:eq(4)>a').click(function(){
      location.href="<%= request.getContextPath() %>/slist.no'";
   });
   $('#menu5>li:eq(0) a').click(function(){
      location.href="<%= request.getContextPath() %>/slist.no";
   });
   $('#menu5>li:eq(1) a').click(function(){
      location.href="<%= request.getContextPath() %>/faq.sv";
   });
   $('#menu5>li:eq(2) a').click(function(){
      location.href="<%= request.getContextPath() %>/views/support/InquirySend.jsp";
   });
   <% } %>
</script>
	
	<section>
		<div id="mainleft">
			<img class="arrow" src="<%= request.getContextPath() %>/image/왼쪽 화살표.png">
		</div>
		<div id="mainright">
			<img class="arrow" src="<%= request.getContextPath() %>/image/오른쪽 화살표.png">
		</div>
		<div id="main">
			<ul id="slider" class="slider">
			<% if(allHpost.isEmpty()){ %>
				<li><h1>실행할께 없어염!!!</h1></li>
			<% } else{ %>
				<% for(int a=0;a<allHpost.size();a++){ 
					Post p = allHpost.get(a); 
					 for(int b=0;b<postImg.size();b++){ 
						Media m = postImg.get(b); 
						if(p.getPostNum() == m.getPostNum()) {%>
                <li id="item<%= a %>" class="item1">
                	<img src="<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>">
                	<div class="slideLike"><%= p.getPostLike() %> like</div>
                </li>

                	<% break;
                		 } %>
                	<% } %>
<script>
	$(function(){
		var itemBtn = "#item"+<%= a %>;
		$(itemBtn).click(function(){
			item = <%= p.getPostNum() %>;
		});
		
	});
</script>
                <% } %>
            <% } %>
            </ul>
		</div>
	</section>
	
	<form onsubmit="return search();" action="<%= request.getContextPath() %>/search.mem">
		<div id="search">
			<div id="search-wrap">
				<div id="search-left"></div>
				<select id="searchselect" name="searchselect">
					<option value="1">회원</option>
					<option value="2">게시글</option>
				</select>
				<input id="searchtext" name="searchtext" type="search" placeholder="검색">
				<input id="searchbutton" type="submit" value="검색">
			</div>
		</div>
	</form>
<script>
	function search(){
		<% if((loginUser) == null){ %>
		alert('로그인을 해주세요.');
		return false;
		<% } else{ %>
			if($('#searchtext').val() == ""){
				alert('검색어를 입력해주세요');
				return false;
			} else{
				return true;
			}
		<% } %>
	}
	$(function(){
		/* -------------디테일이미지 슬라이드-------------------------- */
	
	      var imgs;
	      imgslide_count = 0;
	      img_position = 1;
	      var slide = "#imgslide ul";
	      
	      //버튼을 클릭했을 때 함수 실행
	      $('#back').click(function () {
	        back();
	      });
	      $('#next').click(function () {
	        next();
	      });
	
	      function back() {
	    	  if(img_position>1){
	          $('#imgslide ul').animate({
	            left:'+=492.09px'
	          });
	          img_position--;
	    	  }
	      }
	      function next() {
	    	  if(img_position<imgslide_count){
	        	$('#imgslide ul').animate({
	            left:'-=492.09px'
	          });
	          img_position++;
	    	  }
	      }
	});
	$(function(){
		/* ------------------이미지 슬라이드 디테일 -------------*/
		var $item = ".item1";
		$("body").click(function(e){
			if($('#expansion').css('display') == 'block'){
				if(!$('#expansion').has(e.target).length) {
					$('#expansion').hide();
				}
			} else if($('#expansion').css('display') == 'none'){
				if($($item).has(e.target).length) {
					$('#expansion').show();
					$('#imgslide ul').css('left', '0px');
					imgslide_count = 0;
					img_position = 1;
					<% if(!allHpost.isEmpty()){ %>
						<% for(int c=0;c<allHpost.size();c++) { 
							Post post = allHpost.get(c); 
							String category = "";
							switch(post.getCategorynum()){
							case 2: category = "펫일상"; break;
							case 3: category = "펫지식"; break;
							case 4: category = "펫리뷰"; break;
							case 5: category = "펫분양"; break;
							} %>
							var pNum = <%= post.getPostNum() %>;
							if(pNum == item){
								/* 프로필 이미지 생성 */
								<% for(int e=0;e<=postImg.size();e++){ %>
								<% if(e==postImg.size()){ %>
									$('#expansionimg').attr('src', '<%= request.getContextPath() %>/image/프로필.png');
								<% break;
								} %>
								<%	Media m = postImg.get(e); %>
								<%	if(m.getMemberId().equals(post.getMemberid()) && m.getMediaUse() == 1){ %>
									$('#expansionimg').attr('src', '<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>');
									<% break;
									} %>
								<% } %>
								/* 게시글 닉네임 */
								$('#expansionWri').text("<%= post.getMemberid() %>");
								/* 게시글 게시일 */
								$('#expansiondate').text("게시일 |   <%= post.getPostDate() %>");
								/* 게시글 제목 */
								$('#expansionTitle').text("Title | <%= post.getPostTitle() %>");
								$('#expansionTitle').append('<hr>');
								/* 게시글 내용 */
								$('#expansioncontent').text("<%= post.getPostContent() %>");
								/* 카테고리 */
								$('#petlife').text("<%= category %>");
								/* 좋아요 수 */
								$('#likescore').text("<%= post.getPostLike() %> like")
								/* 이미지 생성!!!!! */
								$('#imgslide>ul').html("");
								<% for(int d=0;d<postImg.size();d++){ 
									Media m = postImg.get(d); 
									if(post.getPostNum() == m.getPostNum()) {%>
								var $li = $('<li>');
								var $img = $('<img>');
								imgslide_count = imgslide_count + 1;
								$img.attr('src', '<%= request.getContextPath() %>/uploadFiles/<%= m.getWebName() %>');
								$li.append($img);
								$('#imgslide>ul').append($li);
									<% } %>
								<% } %>
							}
						<% } %>
					<% } %>
				}
			}
		});
	});
	$(document).ready(function(){
		
		/* -------------이미지 슬라이드-------------------------- */
	      var imgs;
	      var img_count;
	      var img_position = 1;
	      var slide = "#main ul";

	      imgs = $("#slider");
	      img_count = imgs.children().length;

	      //버튼을 클릭했을 때 함수 실행
	      $('#mainleft').click(function () {
	        back();
	      });
	      $('#mainright').click(function () {
	        next();
	      });

	      function back() {
	    	  if(imgs.offset().left<64.5999984741211){
	    		  imgs.animate({
	  	            left:'+=470px'
	  	          });
	    	  }
	      }
	      function next() {
	    	  if($("#slider>li:last").offset().left > 1100){
	    		  imgs.animate({
	  	            left:'-=470px'
	  	          });
	    	  }
	      }
	});
</script>
	
	<article>
		<div id="articlewrap">
			<div id="article1" class="article">
				<div class="articleTitle">공지사항</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="article2" class="article">
				<div class="articleTitle">최신글</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
			<div id="article3" class="article">
				<div class="articleTitle">인기글</div>
				<div class="articlecontent">
					<div class="articleinner">
						<ul>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
							<li>게시글 제목</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</article>
	<footer>제작 : 한호성</footer>	
</body>
</html>