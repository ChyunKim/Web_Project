<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserConnection" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="User.User" scope="page" />
<jsp:setProperty name = "user" property ="userID"/>
<jsp:setProperty name = "user" property ="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
</head>
<body>
	<%
		/* 먼저 로그인이 된 user는 로그인 창에 들어오지 못하도록 해야함 */
		String userID = null;
		if(session.getAttribute("userID") != null){							// 세션을 확인하여 userID라는 이름으로 세션이 존재한다면
			userID = (String) session.getAttribute("userID");				// userID에 세션을 할당된 값을 넣어준다.
		}
		
		if(userID != null){													// userID가 null이 아니라는 것은 세션이 할당되었다는 것이므로 로그인이 다시 되지 않도록 함							
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다. 로그아웃을 해주세요! ')");
			script.println("location.href = 'Main.jsp'");
			script.println("</script>");
			
		}
	
		/* 로그인을 위해 */
		UserConnection connect = new UserConnection();
		int result = connect.login(user.getUserID(),user.getUserPassword()); 
		
		if(result == 1){
			session.setAttribute("userID",user.getUserID());				// 로그인에 성공하였다면 session 값에 userID를 넣어준다.
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'Main.jsp'");
			script.println("</script>");
		}
		else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 잘못되었습니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('없는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		
		else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류 발생!')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>

</body>
</html>