<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="objects.Class"%>
<%@ page import="function.FunctionJAXB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mark Management</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/Class.css">
</head>
<body>
	<%
		FunctionJAXB functionJAXB = new FunctionJAXB();
			String teacherID = "sonnt5";
			
			//Get Teacher Info
			Teacher teacher = functionJAXB.getTeacherById(teacherID) ;	
			//Get all subject of teacher
			List<Subject> listSubject = functionJAXB.getSubjectByTeacherId(teacherID);
			//get list short name
			List<String> listShortName = functionJAXB.getListShortName(listSubject);
			//get group classes by short name
			List<Class> groupClasses = functionJAXB.groupClassByShortName(listShortName.get(0).toString(), teacherID);
			//get group subject by short name
			List<Subject> listShortSubjects = functionJAXB.groupSubjectByShortNameTeacherId(listShortName.get(0).toString(), teacherID);
	%>
	<div class="wrap">
		<div id="header">
			<img id="img" alt="headerIMG" src="img/banner.jpg" />
			<div id="wel-log" class="left">
				<div id="wel" class="left margin_top_40px">
					Welcome,
					<%=teacher.getTeacherName()%></div>
				<div class="vl left margin_top_40px margin_left_5"></div>
				<div id="log" class="left margin_top_40px margin_left_5">
					<a href="#">Logout</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<a href="TeacherHome.jsp">Home</a> <a class="active" href="#">Class</a>
			<a href="TeacherProfile.jsp">Profile</a>
		</div>
		<div class="tab">
			<div id="subjectId" class="left">
				<center>
					<h3><%=listShortName.get(0).toString()%></h3>
				</center>
			</div>
			<div id="buttonClass" class="left">
				<%
					for(int i=0;i<listShortSubjects.size();i++){
									Class clazz = functionJAXB.getClassById(listShortSubjects.get(i).getClassID());
				%>
				<button class="tablinks"
					onclick="openCity(event, '<%=clazz.getClassName()%>')"
					id="defaultOpen"><%=clazz.getClassName()%></button>
				<%
					}
				%>
			</div>
			<%
				for(int i=0;i<listShortSubjects.size();i++){
						Class clazz = functionJAXB.getClassById(listShortSubjects.get(i).getClassID());
			%>
			<div id="<%=clazz.getClassName()%>" class="tabcontent">
				<table id="homeTBL" class="bang">
					<tr>
						<th>Student ID</th>
						<th>Student Name</th>
					</tr>
					<%
						List<Student> listStudent = functionJAXB.getStudentBySubjectId(listShortSubjects.get(i).getSubjectID());
														for(int j=0; j<listStudent.size();j++){
					%>
					<tr>
						<td><a href="#"><%=listStudent.get(j).getStudentID()%></a></td>
						<td><%=listStudent.get(j).getStudentName()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<%
				}
			%>


			<script>
				function openCity(evt, cityName) {
					var i, tabcontent, tablinks;
					tabcontent = document.getElementsByClassName("tabcontent");
					for (i = 0; i < tabcontent.length; i++) {
						tabcontent[i].style.display = "none";
					}
					tablinks = document.getElementsByClassName("tablinks");
					for (i = 0; i < tablinks.length; i++) {
						tablinks[i].className = tablinks[i].className.replace(
								" active", "");
					}
					document.getElementById(cityName).style.display = "block";
					evt.currentTarget.className += " active";
				}

				document.getElementById("defaultOpen").click();
			</script>
		</div>
	</div>
</body>
</html>