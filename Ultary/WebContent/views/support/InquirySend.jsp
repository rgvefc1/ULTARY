<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ULTARY</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/common/완성본틀.css">

<style>

    #mainWrapper {
        line-height: 2em;
        font-family: "맑은 고딕";
        text-align: center;
    }
    #inputText{
       width: 650px;
       height: 300px;
       text-align: left;
       border-radius: 15px;
       font-size: 20px;
    }
    #submit{
       background-color: rgba(0, 0, 0, 0.658);
       color: white;
       font-size: 20px;
       border-radius: 15px;
       float: right;
       transform: translateX(-320px);
       width: 150px;
    }
    #content-box{
       background-color: rgb(214, 241, 252);
       width: 800px;
       height: 450px;
       border-radius: 20px;
       margin-left: 50px;
       margin-bottom: 50px;
 
    }
    
    #sucess{
       background-color: white;
       width: 600px;
       height: 300px;
       border-radius: 20px;
       margin-left: 150px;
       margin-bottom: 50px;
       text-align:center;    
       display:none; 
    }
 	#su-msg{
   		margin-top: 50px;
    }
    
   #su-title{
    	font-size:30px;
    	border-style: bold;
    	font-family: "굴림";
    	color:skyblue;
    }
    button{
       background-color: rgba(0, 0, 0, 0.658);
       color: white;
       font-size: 20px;
       border-radius: 15px;
       cursor: pointer;
    }
   
    #title{
    	width: 450px;
    	height: 20px;
    	border-radius: 15px;
    	 font-size: 18px;
    }

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
        <br>
     	 <h2 align="center">
			<img src ="<%= request.getContextPath() %>/image/support/dog11.png">
        </h2>
       
    <!-- Ajax 방식으로 변경 --> 
    <!--  <form action ="<%= request.getContextPath() %>/insert.inq" method ="post" onsubmit="return submitcheck();"> -->
        <p style="color: gray;">궁금하신 사항을 입력해 주세요</p>
        <p style="color: gray;">고객님의 소중한 문의사항을 관리자가 확인 후 답변해 드립니다.</p>
        <p style="color: gray;">답변은 마이페이지에서 확인하실 수 있습니다.</p>
    	 <hr>
        <div id = "content-box">
       
       	   <br>
           <label>제목 : </label><input type ="text" name ="title" id ="title">
           <br>
           <textarea id ="inputText" name="content"></textarea><br>
           
           <button type="submit" id ="submit">문의하기</button>
           
           <br><br><br><br>
        </div>
        
        <div id ="sucess">
        	<div id ="su-msg">
        	<br>
	        	<p id ="su-title">성공적으로 전송했습니다.</p>
	        	<p>고객님의 소중한 문의사항을 남겨주셔서 감사합니다.</p>
	        	<p>관리자가 빠른시간내에 답변해드리겠습니다</p>
	        	<button id="retry">재문의</button>
  			</div>
        </div>
        
    <!--   </form> -->
        
       
       <!-- 관리자로 로그인시 -->
        <form action ="<%= request.getContextPath() %>/list.inq">
         <% if (loginUser != null && loginUser.getMemberId().equals("admin")) { %>
			<button id="reply">문의글 답변하기(관리자용)</button>
				<% } %>
		 </form>
		<br>
		
        
     </div>
    </section>
    </div>
   </div>
   </div> 
</body>
	<script>
	
	// 페이지 리로드 : 재문의
	$('#retry').click(function(){
		history.go(0);
	});
	
	
	$('#submit').click(function(){
		var title = $('#title').val();
		var content = $('#inputText').val();
		
		console.log(title);
		console.log(content);
		if(title ==""){
			alert('제목을 입력하세요');
		}else if(content == ""){
			alert('내용을 입력하세요');
		}else{
			$.ajax({
				url: "<%= request.getContextPath() %>/insert.inq",
			
				data : 
				{
					title: title,
					content:content
				},
				
				success: function(data){
					console.log(data);
					
					if(data > 0){
						$('#content-box').fadeOut(1200);
							setTimeout(function() {
							$('#sucess').fadeIn(1200);
							}, 1200);
					}else{
						alert('전송에 실패하였습니다.')
					}
				}
			});
		
		}
	});
	
	/*
	function submitcheck() {
		
		var title = document.getElementById('title').value;
		var content = document.getElementById('content').value;
		
		if(title == ""){
			alert('제목을 입력하세요');
			return false;
		}
		else if(content == ""){
			alert('내용을 입력하세요');
			return false;
		}
		else{
			alert('성공적으로 전송되었습니다.');
			return true;	
		}
		
	}*/
	
	</script>
</html>


