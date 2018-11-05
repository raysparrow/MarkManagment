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
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String teacherID = "sonnt5";

		//Get Teacher Info
		Teacher teacher = functionJAXB.getTeacherById(teacherID);
	%>
	<div class="wrap">
		<div id="header">
			<img id="img" alt="headerIMG" src="img/banner.jpg" />
			<div id="wel-log" class="left">
				<div id="wel" class="left margin_top_40px">Welcome, Son</div>
				<div class="vl left margin_top_40px margin_left_5"></div>
				<div id="log" class="left margin_top_40px margin_left_5">
					<a href="#">Logout</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<a href="TeacherHome.html">Home</a> 
			<a href="class.html">Class</a>
			<a class="active" href="TeacherProfile.jsp">Profile</a>
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
</body>
</html>