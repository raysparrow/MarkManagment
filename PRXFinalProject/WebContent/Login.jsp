<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Login.css">
</head>
<body>
	<div class="login-page">
		<div class="tit"><h1>MARK MANAGEMENT</h1></div>
		<div class="form">
			<%
				String error = request.getParameter("error");
				if (error != null) {
			%>
				<p id="error"><%=error %></p>
			<%
				}
			%>
			
			<form class="login-form" action="Waiting.jsp" method="POST">
				<input type="text" placeholder="Email" name="email" /> <input
					type="password" placeholder="Password" name="password" /> <input
					type="submit" value="Login" id="button">
			</form>
		</div>
	</div>
</body>
</html>