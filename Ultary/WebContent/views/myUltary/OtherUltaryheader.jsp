<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.model.vo.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/myUltary/myUltaryheader.css">
</head>
<body>
	<header>
		<div id="alert-wrap">
			<div class="alert">
				<div id="alerttitle">전체알림</div>
				<div class="alertcontentdiv">
					<div class="alertcontent">한호성님의 위탁요청이 전송되었습니다.</div>
					<div class="alertclose">&nbsp;&nbsp;X</div>
				</div>
			</div>
		</div>
<script>
	$("body").click(function(e){
		if($('.alert').css('display') == 'block'){
			if(!$('.alert').has(e.target).length) {
				$('.alert').hide();
			}
		} else if($('.alert').css('display') == 'none'){
			if($('#alertbuttondiv').has(e.target).length) {
				$('.alert').show();
			}
		}
	});
	$(function(){
		updateDate();
	});
	function updateDate(){
		$.ajax({
			url: '<%= request.getContextPath() %>/AlertCount.al',
			success: function(data){
				if(data==0){
					$('.alertcount').hide();
				}
				$('.alertcount').text(data);
			},error: function(){
				
			}
		});
		$.ajax({
			url: '<%= request.getContextPath() %>/selectAlert.al',
			type: 'post',
			cache: false,
			success: function(data){
				$('.alert').html("");
				$('.alert').append('<div id="alerttitle">전체알림</div>');
				for(var key in data){
					var $div = $('<div>').attr('class','alertcontentdiv');
					var $div1 = $('<div>').attr('class','alertcontent').attr('onclick', "alDetail('"+data[key].allink+"','"+data[key].alsnum+"');");
					var $div2 = $('<div>').attr('class', 'alertclose').attr('onclick', "alDelete('"+data[key].alsnum+"');");
					if(data[key].alkind == 1){
						$div1.text(data[key].memberid+"님이 댓글을 달았습니다.");
						$div2.text("  X");
					} else{
						$div1.text(data[key].memberid+"님이 답글을 달았습니다.");
						$div2.text("  X");
					}
					if(data[key].alcheck == 'Y'){
						$div.css('background', '#8C8C8C');
					}
					$div.append($div1);
					$div.append($div2);
					$('.alert').append($div);
				}
			}, error: function(){
				
			}
		});
		setTimeout(updateDate, 5000);
	}
	function alDelete(anum){
		$.ajax({
			url: '<%= request.getContextPath() %>/deleteAlert.al',
			data: {alsnum:anum},
			success: function(d){
				updateDate();
				$('.alert').css('height', "-=50px");
			}
		});
	}
	function alDetail(allink, anum){
		$.ajax({
			url: '<%= request.getContextPath() %>/Updatecheck.al',
			data: {alsnum:anum},
			success: function(dat){
				location.href="<%=request.getContextPath() %>"+allink;
			}
		});
	}
	$(function(){
		$('.alertcontent').hover(function(){
			$('.alert').css('background', 'gray');
		});
	});
</script>
		<div id="header-top">
			<div id="alertbuttondiv"><img class="headerimg" src="<%= request.getContextPath() %>/image/알림.png"></div>
			<a href='<%= request.getContextPath() %>/main.login'><img id="logimg" src="<%= request.getContextPath() %>/image/logo.png"></a>
			<div id="header-topR">
				<div id="nick"><%= loginUser.getNickname() %></div>
				<div id="nim">님</div>
				<button id="logout" class="top-right" onclick="location.href='<%= request.getContextPath() %>/logout.me'">로그아웃</button>
			</div>
		</div>
		<div id="header-bottom">
			<img id="backimg" src="<%= request.getContextPath() %>/image/bg.png">
		</div>
		<div id="proimgdiv">
				<div id="promaindiv">
					<img style="width: 100%; height: 100%" src="<%= request.getContextPath() %>/image/사진변경.png">
				</div>
				<% if(proimgroute != ""){ %>
				<img id="proimg" src="<%= request.getContextPath() %>/uploadFiles/<%= proimgroute %>">
				<% } else{ %>
				<img id="proimg" src="<%= request.getContextPath() %>/image/프로필.png">
				<% } %>
			</div>
	</header>
	<div id="tlhostdiv">
		<div id="tlhost"><%= nickname %></div>
		<div id="tlmark"><div id="tlmark1"><%= markscore %> Follow!!</div></div>
	</div>
<script>
	$(function(){
		$('#tlmark').click(function(){
			var markmem = "<%= nickname %>";
			var memberid = "<%= loginUser.getMemberId() %>";
			$.ajax({
				url: 'markmember.mark',
				data: {markmem:markmem, memberid:memberid},
				success: function(data){
					location.reload();
				}
			});
		});
		<% if(markbl){ %>
		$('#tlmark1').css("background", "#5CD1E5");
		$('#tlmark1').mouseover(function(){
			$('#tlmark1').css("background", "#363636");
		}).mouseout(function(){
			$('#tlmark1').css("background", "#5CD1E5");
		});
		<% } else{ %>
		$('#tlmark1').css("background", "#363636");
		$('#tlmark1').mouseover(function(){
			$('#tlmark1').css("background", "#5CD1E5");
		}).mouseout(function(){
			$('#tlmark1').css("background", "#363636");
		});
		<% } %>
	});
</script>
</body>
</html>