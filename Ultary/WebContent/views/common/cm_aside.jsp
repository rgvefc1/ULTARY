<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="<%= request.getContextPath()%>/css/common/cm_aside.css">
</head>
<body>
	<aside>
		<ul>
			<li><a href='<%= request.getContextPath() %>/cmList.po?cnum=1'>공지사항</a></li>
            <li><a href='<%= request.getContextPath() %>/cmAllList.po'>모아보기</a></li>
            <li><a href='<%= request.getContextPath() %>/cmList.po?cnum=2'>펫일상</a></li>
            <li><a href='<%= request.getContextPath() %>/cmList.po?cnum=3'>펫지식</a></li>
            <li><a href='<%= request.getContextPath() %>/cmList.po?cnum=4'>펫리뷰</a></li>
            <li><a href='<%= request.getContextPath() %>/cmList.po?cnum=5'>펫분양</a></li>
		</ul>
	</aside>
</body>
</html>