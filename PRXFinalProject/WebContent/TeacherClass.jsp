<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="objects.Class"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="javax.servlet.http.*"%>
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
		//get user is signing in
			String email = (String) session.getAttribute("email");
		//check Signing in
			if(email == null || email.equals("")){
			response.sendRedirect("Logout.jsp");
			} else {
			FunctionJAXB functionJAXB = new FunctionJAXB();
			//Get teacher's information
			Teacher teacher = functionJAXB.getTeacherByEmail(email);
			String teacherID = teacher.getTeacherID();
			
			//Get all semester of teacher
			List<String> semesters = functionJAXB.getSemestersByTeacherId(teacherID);
			
			//get semester
			String currentSemester = semesters.get(0).toString();
			if(request.getParameter("semester") != null){
				currentSemester = request.getParameter("semester");
			}
			
			//Get all subject of teacher
			List<Subject> listSubject = functionJAXB.getSubjectsBySemesterAndTeacherId(currentSemester, teacherID);
			//get list short name
			List<String> listShortName = functionJAXB.getListShortName(listSubject);
			//get short name id
			String shortName = listShortName.get(0).toString();
			
			List<Class> groupClasses = null;
			List<Subject> listShortSubjects = null;
			if(request.getParameter("shortName") != null){
				shortName = request.getParameter("shortName");
			}
			//get group classes by short name
			groupClasses = functionJAXB.groupClassByShortName(shortName, teacherID);
			//get group subject by short name
			listShortSubjects = functionJAXB.groupSubjectByShortNameTeacherId(shortName, teacherID);
			
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
					<a href="Logout.jsp">Logout</a>
				</div>
			</div>
		</div>
		<div class="navbar">
			<a href="TeacherHome.jsp">Home</a> <a class="active" href="#">Class</a>
			<a href="TeacherProfile.jsp">Profile</a>
		</div>
		<div class="tab">
			<div id="subjectId" class="left">
				<div class="left width70 margin_left_5">
					<h3><%=shortName%></h3>
				</div>
				<div class="left">
					<div class="dropdown">
						<button onclick="myFunction()" class="dropbtn">Subject</button>
						<div id="myDropdown" class="dropdown-content">
							<%
								for(int i=0;i<listShortName.size();i++){
							%>
							<a href="TeacherClass.jsp?shortName=<%=listShortName.get(i).toString()%>"><%=listShortName.get(i).toString()%></a>
							<%
								}
							%>
						</div>
					</div>
				</div>
			</div>
			<div id="buttonClass" class="left">
				<%
					for(int i=0;i<listShortSubjects.size();i++){
																			Class clazz = functionJAXB.getClassById(listShortSubjects.get(i).getClassID());
				%>
				<button class="tablinks"
					onclick="openClass(event, '<%=clazz.getClassName()%>')"
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
					<thead>
						<tr>
							<th>Student ID</th>
							<th>Student Name</th>
						</tr>
					</thead>
					<tbody>
						<%
							List<Student> listStudent = functionJAXB.getStudentBySubjectId(listShortSubjects.get(i).getSubjectID());
																																																								for(int j=0; j<listStudent.size();j++){
						%>
						<tr>
							<td><a
								href="TeacherStudent.jsp?subjectId=<%=listShortSubjects.get(i).getSubjectID()%>&studentId=<%=listStudent.get(j).getStudentID()%>"><%=listStudent.get(j).getStudentID()%></a></td>
							<td><%=listStudent.get(j).getStudentName()%></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
			<%
				}
			%>
			<div class="center">
				<div class="pagination">
					<div class="dropup left">
						<button class="dropUpbtn"><%=currentSemester %></button>
						<div class="dropup-content">
							<%
								for(int i=0;i<semesters.size();i++){
							%>
							<a href="TeacherClass.jsp?semester=<%=semesters.get(i).toString()%>"><%=semesters.get(i).toString()%></a>
							<%
								}
							%>
						</div>
					</div>

				</div>
			</div>
			<script>
				/* When the user clicks on the button, 
				 toggle between hiding and showing the dropdown content */
				function myFunction() {
					document.getElementById("myDropdown").classList
							.toggle("show");
				}

				// Close the dropdown if the user clicks outside of it
				window.onclick = function(event) {
					if (!event.target.matches('.dropbtn')) {

						var dropdowns = document
								.getElementsByClassName("dropdown-content");
						var i;
						for (i = 0; i < dropdowns.length; i++) {
							var openDropdown = dropdowns[i];
							if (openDropdown.classList.contains('show')) {
								openDropdown.classList.remove('show');
							}
						}
					}
				}
			</script>

			<script>
				function openClass(evt, currentClass) {
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
					document.getElementById(currentClass).style.display = "block";
					evt.currentTarget.className += " active";
				}

				document.getElementById("defaultOpen").click();
			</script>
			<%
				}
			%>
		</div>
	</div>
</body>
</html>