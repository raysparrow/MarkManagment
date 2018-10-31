<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="function.FunctionJAXB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mark Management</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/StudentProfile.css">
</head>
<body>
	<%
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String studentID = "SE11111";

		//Get Student Info
		Student student = functionJAXB.getStudentByID(studentID);
	%>
	<div class="wrap">
		<div id="header">
			<img id="img" alt="headerIMG" src="img/banner.jpg" />
			<div id="wel-log" class="left">
				<div id="wel" class="left margin_top_40px">
					Welcome,
					<%=student.getStudentName()%></div>
				<div class="vl left margin_top_40px margin_left_5"></div>
				<div id="log" class="left margin_top_40px margin_left_5">
					<a href="#">Logout</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<a href="StudentHome.jsp">Home</a> <a href="StudentSubject.jsp">Subjects</a>
			<a class="active" href="#student_profile">Student Profile</a>
		</div>
		<div class="content">
			<div class="profile">
				<div id="profile_student_name"><%=student.getStudentName()%></div>
				<div id="profile_student_id"><%=student.getStudentID()%></div>
				<table id="profile_student_detail">
					<tr>
						<td>Email:</td>
						<td><%=student.getStudentMail()%></td>
					</tr>
					<tr>
						<td>Phone:</td>
						<td><%=student.getStudentPhone()%></td>
					</tr>
					<tr>
						<td>Date of birth:</td>
						<td><%=student.getStudentDOB()%></td>
					</tr>
					<tr>
						<td>Sex:</td>
						<td><%=student.getStudentSex()%></td>
					</tr>
					<tr>
						<td>Course:</td>
						<td><%=student.getStudentCourse()%></td>
					</tr>
					<tr>
						<td>Current GPA:</td>
						<td><%=student.getStudentGPA()%></td>
					</tr>
				</table>
			</div>
			<div class="vl_student_profile left"></div>
			<img class="img_profile ava" src="img/ava1.jpg"
				alt="Avatar of Student" />
		</div>
	</div>
</body>
</html>