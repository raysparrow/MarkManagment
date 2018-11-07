<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="function.FunctionJAXB"%>
<%@ page import="objects.*"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/TeacherProfile.css">
</head>
<body>
	<%
	String email = (String)session.getAttribute("email");
	//get user is signing in
			//check Signing in
			if(email == null || email.equals("")){
				response.sendRedirect("Logout.jsp");
			} else {
		FunctionJAXB functionJAXB = new FunctionJAXB();

		//Get Teacher Info
		Teacher teacher = functionJAXB.getTeacherByEmail(email);
	%>
	<div class="wrap">
		<div id="header">
			<img id="img" alt="headerIMG" src="img/banner.jpg" />
			<div id="wel-log" class="left">
				<div id="wel" class="left margin_top_40px">Welcome, <%= teacher.getTeacherName() %></div>
				<div class="vl left margin_top_40px margin_left_5"></div>
				<div id="log" class="left margin_top_40px margin_left_5">
					<a href="Logout.jsp">Logout</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<a href="TeacherHome.jsp">Home</a> 
			<a href="TeacherClass.jsp">Class</a>
			<a class="active" href="#">Profile</a>
		</div>
		<div class="content">
			<div class="imgTeacher ava">
				<img id="img1" alt="headerIMG" src="img/user1.png" />
			</div>
			<div class="profile">
				<div class="nameStyle">
					Name:
					<p id="inlineStyle"><%=teacher.getTeacherName() %></p>
				</div>
				<div class="nameStyle">
					DOB:
					<p id="inlineStyle"><%=teacher.getDOB()%></p>
				</div>
				<div class="phoneStyle">
					Phone:
					<p id="inlineStyle"><%=teacher.getPhone() %></p>
				</div>
				<div class="mailStyle">
					Email:
					<p id="inlineStyle"><%=teacher.getMail() %></p>
				</div>
			</div>
		</div>
	</div>
	<%} %>
</body>
</html>