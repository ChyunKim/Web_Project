<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title> 한림대학교 수업정보</title>
<link rel="stylesheet" href="MainStyle.css"></link>
</head>
<body>
	<%
		/* 로그인이 된 user에 대한 메인화면 구성 다르게 하기위해서 */
		String userID = null;
		if(session.getAttribute("userID")!= null){				// 세션의 할당값이 null이 아니라면 할당된 아이디 값을 받아 관리할 수 있도록 함
			 userID = (String) session.getAttribute("userID");
		}
	%>
	<div class="header">
		<div class="container">
			<img src ="image/hallymlogo.png">
			<div class="menu">
				<ul>
					<a href="Main.jsp"><li>홈</li></a>
					<a href="BBS.html"><li>게시판</li></a>
				</ul>
			</div>
					<%
						if(userID == null){
					%>
					<div class = "menu-li">
						<ul>
						<a href="Login.html"><li>로그인</li></a>
						</ul>
					</div>
					<% 
						} else{
					%>
					<div class = "menu-li">
						<ul>
						<a href="Logout.jsp"><li>로그아웃</li></a>
						</ul>
					</div>
					<%
						}
					%>
				
		</div>
	</div>
	<div class="content">
		
	</div>
</body>
</html>