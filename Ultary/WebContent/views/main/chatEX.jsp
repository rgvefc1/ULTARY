<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link rel="stylesheet" href="<%= request.getContextPath() %>/css/chatPopup.css">
</head>
<body>
	<div id="div_chat">
	  <table border="1" id="table_chat">
	    <thead>
	      <tr>
	        <th>이름</th>
	        <th>메시지</th>
	      </tr>
	    </thead>
	    <tbody>
	      <tr>
	        <td>hong</td>
	        <td>안녕하세요</td>
	      </tr>
	    </tbody>
	  </table>
	  <div id="menu_scroll_down">
	    <button id="btn_scroll_down">↓</button>
	  </div>
	</div>
	
	<div id="input_area">
		<input type="text" id="add_msg">
		<button>제출</button>
	</div>
</body>
<script>
	$(function(){
	  var isScrollUp = false;
	  var lastScrollTop;
	  var unreadCnt = 0;

	  var divChat = document.getElementById('div_chat');

	  /* 추가 버튼 클릭 시 */
	  $('#btn_append_row').on("click", function() {
	    // 라인 추가
	    $('#table_chat').append(
	      $('<tr>').append(
	        $('<td>').append($('#add_name').val()),
	        $('<td>').append($('#add_msg').val())
	      )
	    );

	    if (isScrollUp) {
	    	// 메뉴가 보이는 상태에서 새로운 라인 추가 시 안 읽은 수 표시
	      unreadCnt++;
	      $('#btn_scroll_down').html('↓ ' + unreadCnt);
	    }

	    // 기본적으로 스크롤 최하단으로 이동 (애니메이션 적용)
	    if (!isScrollUp) {
	      $('#div_chat').animate({
	        scrollTop: divChat.scrollHeight - divChat.clientHeight
	      }, 100);
	    }
	  });

	  /* 메뉴 스크롤 ↓ 버튼 클릭 시 */
	  $('#btn_scroll_down').on('click', function() {
	    // 마지막으로 보고 있었던 (스크롤을 올리기 시작했던) 위치로 이동
	    $('#div_chat').animate({
	      scrollTop: lastScrollTop
	    }, 100);

	    if (lastScrollTop == divChat.scrollHeight - divChat.clientHeight) {
	      // 마지막 위치와 스크롤 최하단이 같다면 (새로 추가된 라인이 없다면) 메뉴 숨김
	      $("#menu_scroll_down").css("top", "200px");
	      isScrollUp = false;
	      unreadCnt = 0;
	      $('#btn_scroll_down').html('↓');
	    } else {
	      // 마지막 위치와 스크롤 최하단이 다르다면 (새로 추가된 라인이 있다면) 마지막 위치를 최하단으로 변경
	      lastScrollTop = divChat.scrollHeight - divChat.clientHeight;
	    }
	  })

	  /* 스크롤 이벤트 */
	  $("#div_chat").on('mousewheel DOMMouseScroll', function(e) {
	    var E = e.originalEvent,
	      delta = E.wheelDelta || -E.detail;

	    // 메뉴를 숨겼을 때만 마지막 위치 저장
	    if (!isScrollUp) {
	      lastScrollTop = $(this).scrollTop();
	    }

	    // 스크롤이 생겼을 때
	    if ($(this).scrollTop() > 0) {
	      if (delta < 0) {
	        // 스크롤 내리는 이벤트 중 최하단 도달 시 메뉴 숨김 (-1은 오차 제어)
	        if ($(this).scrollTop() > divChat.scrollHeight - divChat.clientHeight - 1) {
	          $("#menu_scroll_down").css("top", "200px");
	          isScrollUp = false;
	          unreadCnt = 0;
	          $('#btn_scroll_down').html('↓');
	        }
	      } else {
	        // 스크롤 올리는 이벤트 발생 시 메뉴 보임
	        $("#menu_scroll_down").css("top", "150px");
	        isScrollUp = true;
	      }
	    }
	  });
	  
	});
</script>
</html>