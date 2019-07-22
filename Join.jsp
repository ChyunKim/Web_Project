<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="User.UserConnection" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id = "user" class="User.User" scope="page" />
<jsp:setProperty name = "user" property ="userID"/>
<jsp:setProperty name = "user" property ="userPassword"/>
<jsp:setProperty name = "user" property ="userName"/>
<jsp:setProperty name = "user" property ="userGender"/>
<jsp:setProperty name = "user" property ="userEmail"/>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<body>
	<%
		/* 먼저 로그인이 된 user는 회원가입 창에 들어오지 못하도록 해야함 */
		String userID = null;
		if(session.getAttribute("userID") != null){							// 세션을 확인하여 userID라는 이름으로 세션이 존재한다면
			userID = (String) session.getAttribute("userID");				// userID에 세션을 할당된 값을 넣어준다.
		}
	
		if(userID != null){													// userID가 null이 아니라는 것은 세션이 할당되었다는 것이므로 회원가입이 되지 않도록 함							
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어있습니다. 로그아웃을 해주세요! ')");
			script.println("location.href = 'Main.jsp'");
			script.println("</script>");
		
		}
		
		if(user.getUserID() == null || user.getUserPassword() == null  || user.getUserName() == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다.')");
			script.println("history.back()");
			script.println("</script>");
		
		} else{
			UserConnection connect = new UserConnection();
			int result = connect.join(user); 
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				session.setAttribute("userID",user.getUserID());				// 회원가입에 성공하였다면 session 값에 userID를 넣어준다.
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='Main.jsp'");
				script.println("</script>");
			}
		}
		
			
		
	%>

</body>
</html>