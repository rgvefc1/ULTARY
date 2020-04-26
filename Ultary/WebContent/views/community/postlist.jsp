<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*,post.model.vo.*, java.util.ArrayList"%>
    <% 
    ArrayList<Post> list = (ArrayList)request.getAttribute("list"); 
    
    int cnum = (int)request.getAttribute("cnum");
    
    ArrayList<Media> allMList = (ArrayList)request.getAttribute("AllMList");
    
	ArrayList<Media> ProList = (ArrayList)request.getAttribute("ProList");
	
	ArrayList<PostComment> pclist = (ArrayList)request.getAttribute("pclist");
	
	ArrayList<CAns> calist = (ArrayList)request.getAttribute("calist");
    
   	String ctitle ="";
   	String cexplain="";
   	
   	switch(cnum){
   	case 1:{
   		ctitle="공지사항";
   		cexplain="커뮤니티 내 공지사항을 모아서 보여드립니다.";
   	};break;
   	case 2:{
   		ctitle="펫일상";
   		cexplain="반려동물의 일상을 공유하는 게시판 입니다.";
   	};break;
   	case 3:{
   		ctitle="펫지식";
   		cexplain="반려동물에 관한 지식을  공유하는 게시판 입니다.";
   	};break;
   	case 4:{
   		ctitle="펫리뷰";
   		cexplain="반려동물 제품/병원/장소 등 후기를 공유할수있는 게시판입니다.";		
   	};break;
   	case 5:{
   		ctitle="펫분양";
   		cexplain="반려동물 분양 게시판 입니다";		
   	};break;
   	}
    
    PageInfo pi = (PageInfo)request.getAttribute("pi");
    
    int currentPage = pi.getCurrentPage();
    int maxPage = pi.getMaxPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= ctitle %></title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/board.css">
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/community/togglebtn.css">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="script.js"></script>
</head>
<body>
	<div id="all">
		<div id="all-wrap">
			<%@ include file ="/views/common/commonheader.jsp" %>
			<%@ include file ="/views/common/cm_nav.jsp" %>
			<div id="asidesection">
			<%@ include file ="/views/common/cm_aside.jsp" %>
				<section>
        		<div class="maincap">
        			<p class="cap_p_head"><%= ctitle %></p><br>
        			<p class="cap_p_tag"><%= cexplain %></p>
        		<hr id="mainhr">
        		</div>
        			<form action="<%= request.getContextPath() %>/cmSearch.po" method="post" onsubmit="return check();">
        			<div class="search_wrap">
        			<div class="searchselect">
        				<% 
        				int num = 0;
        				switch(cnum) {
        				case 2: num = 2; break;
        				case 3: num = 3; break;
        				case 4: num = 4;break;
        				case 5: num = 5;break;
        				}
        				%>
        				<input type="hidden" name="categorynum" value="<%= num %>">
		        		<select name="searchcon">
		        			<option value="ct" selected>제목+내용</option>
		        			<option value="title">제목만</option>
		        			<option value="writer">작성자</option>
		        		</select>
        				<input type="text" size=20 placeholder="검색할 내용을 입력하세요" class="textbox" name="searchtext">
        				<input type="submit" value="검색" class="find">
        			</div>
        			</div>
        			</form>
        			<div id="hr_wrap">
        			<hr id="hr2">
        			</div>
        		<div class="array_wrap">
        			<% if(loginUser != null && loginUser.getMemberId().equals("admin") && cnum == 1){ %>	
	     		<div id="adminwritebtn" onclick="location.href='views/community/cmnpostWrite.jsp'">
	     		<img src="<%= request.getContextPath() %>/image/연필.png">글쓰기
	     		</div>
	     		<% } else if(cnum != 1) {%>
	     			<div class="switch_wrap">
        			<label class="switch">
					  <input type="checkbox">
					  <span class="slider round"></span><br>
					  <br>
					</label>
					</div>
					<% } %>
        		</div>
     	<div class="cmcontent">
     		<div class="cm_wrap">
     			<div class="board_all">
     				<div class="boardhead">
     					<div class="num">No</div>
     					<div class="tit">제목</div>
     					<div class="writer">작성자</div>
     					<div class="wdate">작성일</div>
     					<div class="recommend">추천</div>
     					<div class="view">조회</div>
     				</div>
     				<div class="boardbody">
     				<% if(list.isEmpty()) { %>
     					<div>존재하는 글이 없습니다.</div>
     				<% } else {
     					for(int i=0;i<list.size();i++){
     						Post n = list.get(i);
     				%>	
     					<div class="boardcontent">
     					<div class="num"><%= n.getPostNum() %></div>
	     				<div class="tit"><a href="#"><%= n.getPostTitle() %></a></div>
	     				<div class="writer"><%= n.getMemberid() %></div>
	     				<div class="wdate"><%= n.getPostDate() %></div>
	     				<div class="recommend"><%= n.getPostLike() %></div>
	     				<div class="view"><%= n.getPostclick() %></div>
     					</div>	
     					<% if(cnum != 1) {  %>
     					<div class="boardopen">
	     				<div class="open_wrap">
	     				<div class="oprofile">
	     					<div id="cdt_profile">
								<% if(!ProList.isEmpty()) { 
						  				for(int o=0;o<=ProList.size();o++){
						  										if(o==ProList.size()){	%>
							  						<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png" width="45" height="45">
							  							<% break; 
						  									}
							  								Media cProimg  = ProList.get(o);
							  								if(cProimg.getMemberId().equals(n.getMemberid())){ %>
							  						<img class="comment2-1img" src="<%= request.getContextPath() %>/uploadFiles/<%= cProimg.getWebName() %>" width="45" height="45">
							  						<% break;
							  							}
							  						}
							  					} else { %>
							  						<img class="comment2-1img" src="<%= request.getContextPath() %>/image/프로필.png" width="45" height="45">
							  					<% } %>
						</div>
						<div><%= n.getMemberid() %></div>
	  					</div>
	  						<div class="opencontent">
	  						<div class="otitle"><a href="#"><%= n.getPostTitle() %></a></div>
	  			<% ArrayList<Media> imgList = new ArrayList<Media>();
                       	for(int j =0;j<allMList.size();j++){
                       		Media m = allMList.get(j);
                         if(n.getPostNum() == m.getPostNum()){
                       			imgList.add(m);
                       		}
                       	}  %>
                       <% if(!imgList.isEmpty()){%>
 					<div class="media">
						<div class="slide" id="slide<%= i %>">
					      <div id="back<%= i %>" class="slideBtn"><img src="<%= request.getContextPath() %>/image/왼쪽 화살표.png" alt="" width="50"></div>
					      <ul>
					      <% for(int z=0;z<imgList.size();z++){
					      	Media real = imgList.get(z); %>
					        <li><img src="<%= request.getContextPath() %>/uploadFiles/<%= real.getWebName() %>" alt="" width="550" height="350"></li>
					      <% } %>
					      </ul>
					      <div id="next<%= i %>" class="slideBtn"><img src="<%= request.getContextPath() %>/image/오른쪽 화살표.png" alt="" width="50"></div>
					    </div>
					</div>     
				<script>
                 // 이미지 슬라이드 
                 $(document).ready(function(){
                	 var imgs;
                     var img_count;
                     var img_position = 1;
                     var slide = "#slide"+<%= i %>+" ul";
                     var backbtn = "#back"+<%= i %>;
                     var nextbtn = "#next"+<%= i %>;

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
                       <% } %>
                       <% String contents = (n.getPostContent()).replace("\r\n", "<br>"); %>
                       <div class="odetail"><%= contents %></div>
                       <% 	int count = 0;
                       			if(!pclist.isEmpty())  {%>
                       			<% for(int a = 0;a<pclist.size();a++){
                       				PostComment pc = pclist.get(a); %>
                       			<% if(pc.getPostNum() == n.getPostNum()) { %>
                       			<div class="commen"> 
                       				<label><%= pc.getMemberid() %></label>
                       				<label><%= pc.getcContent() %></label>
                       			</div>
                       			<% count = 1; %>
                       			<% if(!calist.isEmpty()) { %>
                       			<% for(int b= 0;b<calist.size();b++) { 
                       				CAns ca = calist.get(b);%>
                       				<% if(pc.getcNum() == ca.getcNum()) { %>
                       				<div class="cans">
                       					ㄴ<label><%= ca.getMemberid() %></label>
                       					<label><%= ca.getAnsContent() %></label>
                       				</div>
                       				<% break;} %>
								<% } %>
							<% } %>
							<% if(count==1) break; %>
						  <% } %>
						<% } %>
					<% } %>  
	  						</div>
	  						<div class="likecount">
	  						</div>
	     			</div>
	     			</div>
     				<%
     						}
     					} 
     				}
     				%> 
     				</div>
     				<% if(cnum != 1) { %>
     				<div class="wbtn_wrap"><div class="wbtn"><img src="<%=request.getContextPath()%>/image/연필.png" id="pencil">글쓰기</div></div>
	     			<% } %>
	     			</div>
	     		
	     		<!-- 페이징 -->
	     		<div class="pagingArea" align="center"  style="padding-top:10px;">
	     		<% if(!list.isEmpty()) { %>
	     			<!-- 맨 처음으로 가는 버튼 -->
	     				<button onclick="location.href='<%=request.getContextPath()%>/cmList.po?cnum=<%=cnum%>&currentPage=1'">&lt;&lt;</button>
	     			<!-- 이전 페이지로  -->
				<button onclick="location.href='<%= request.getContextPath()%>/cmList.po?cnum=<%=cnum%>&currentPage=<%= currentPage -1 %>'" id="beforeBtn">&lt;</button>
				<script>
					if(<%= currentPage %> <= 1){
					$('#beforeBtn').attr('disabled','true');
					}
			</script>
			<!-- 10개 페이지 목록 -->
			<% for(int p = startPage; p<= endPage;p++){ %>
				<% if(p ==currentPage){ %>
			<button id="choosen" disabled><%= p %></button>
				<% } else {%>
					<button id="numBtn" onclick="location.href='<%=request.getContextPath() %>/cmList.po?cnum=<%=cnum%>&currentPage=<%= p %>'"><%= p %></button>
				<% } %>
			<% } %>
			<!-- 다음 페이지로 -->	
			<button id="afterBtn" onclick="location.href='<%= request.getContextPath()%>/cmList.po?cnum=<%=cnum%>&currentPage=<%= currentPage+1 %>'"	>&gt;</button>
			<script>
				if(<%= currentPage %> >= <%= maxPage %>){
					$('#afterBtn').attr('disabled','true');
				}
			</script>
			<!-- 맨 끝으로 -->
			<button onclick="location.href='<%= request.getContextPath() %>/cmList.po?cnum=<%=cnum%>&currentPage=<%=maxPage %>'">&gt;&gt;</button>
		<% } %>
	     		</div>
	     		</div>
	     	</div>
			</section>
		</div>
			<script>
			// 게시판 그림자?효과 / 상세보기로 이동하기
			$(function(){
				$('.boardcontent div').mouseenter(function(){
					$(this).parent().css({'background':'#EAEAEA','cursor':'pointer'});
				}).mouseout(function(){
					$(this).parent().css('background','none');
				}).click(function(){
					var num =$(this).parent().children().eq(0).text();
					location.href="<%= request.getContextPath() %>/cmdetail.po?pno=" + num;
				});
			});
			// 검색할때 비어있으면 안됨
			$(".find").click(function check() {
				if($('.textbox').val() == ""){
					alert('검색어를 입력해주세요');
					$('.textbox').focus();
					return false;
				}
				return true;
			});
			// 토글버튼 
			var check = $("input[type='checkbox']");
			check.click(function(){
				$('.boardopen').slideToggle();
			});
			// 글쓰기 버튼 각 카테고리 번호를 보내줌
			$('.wbtn').click(function(){
	        	location.href="<%= request.getContextPath() %>/views/community/cmpostWrite.jsp?cnum=<%= cnum %>";
	        });
			</script>
			</div>
			<footer>from.hoseong</footer>
	</div>
</body>
</html>