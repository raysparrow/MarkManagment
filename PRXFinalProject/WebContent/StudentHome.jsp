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
<link rel="stylesheet" type="text/css" href="css/StudentHome.css">
</head>
<body>
	<%
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String studentID = "SE11111";

		//Get Student Info
		Student student = functionJAXB.getStudentByID(studentID);

		//Get Student mark info
		List<StudentSubject> studentSubjects = functionJAXB
				.getStudentSubjectsByStudentId(studentID);
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
			<a class="active" href="#home">Home</a> <a href="StudentSubject.jsp">Subjects</a>
			<a href="StudentProfile.jsp">Student Profile</a>
		</div>
		<div class="content">
			<table id="homeTBL">
				<tr>
					<th>Subject ID</th>
					<th>Subject Name</th>
					<th>Number of credits</th>
					<th>Average Mark</th>
				</tr>
				<%
					for (int i = 0; i < studentSubjects.size(); i++) {
						Subject subject = functionJAXB.getSubjectById(studentSubjects
								.get(i).getSubjectID());
				%>
				<tr>
					<td><%=subject.getShortName()%></td>
					<td><%=subject.getSubjectName()%></td>
					<td><%=subject.getNumberOfCredit()%></td>
					<td><%=studentSubjects.get(i).getTotalMark()%></td>
				</tr>
				<%
					}
				%>
			</table>
		</div>

	</div>
</body>
</html>