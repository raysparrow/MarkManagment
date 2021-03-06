<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="objects.Student"%>
<%@ page import="objects.Subject"%>
<%@ page import="objects.Teacher"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mark Management</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/StudentSubject.css">
</head>
<body>
	<%
		//get user is signing in
			String email = (String) session.getAttribute("email");
			String semesterId = (String) request.getParameter("semesterId");
			//check Signing in
			if(email == null || email.equals("")){
				response.sendRedirect("Logout.jsp");
			}else {
			
		FunctionJAXB functionJAXB = new FunctionJAXB();
		
			//get Student Infomation
		Student student = functionJAXB.getStudentByEmail(email);
		List<StudentSubject> listStudentS = functionJAXB.getStudentSubjectsByStudentId(student.getStudentID());
		Subject subject;
		Teacher teacher;
		Map listSem = new HashMap();
		for(StudentSubject list : listStudentS){
			subject = functionJAXB.getSubjectById(list.getSubjectID());
			String seme = subject.getSemester();
			listSem.put(seme, seme);
			if(semesterId == null || semesterId.equals("")){
				semesterId = seme;
			}
		}
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
					<a href="Logout.jsp">Logout</a>
				</div>
			</div>
		</div>

		<div class="navbar">
			<a href="StudentHome.jsp">Home</a> <a class="active"
				href="#StudentSubject">Subject</a> <a href="StudentProfile.jsp">Student
				Profile</a>
		</div>
		
		<div class="semester">
			<div class="dSemester"><h1>Semester : <%=semesterId %></h1></div>
			<div class="dropdown">
				<button onclick="myFunction()" class="dropbtn">Semester</button>
				<div id="myDropdown" class="dropdown-content">
					<%
						Set set = listSem.keySet();
						for (Object key : set) {
					%>
						<a href="StudentSubject.jsp?semesterId=<%=key%>"><%=key%></a>
					<%
						}
					%>
				</div>
			</div>
		</div>
	
		<div class="Content">
			<div class="tab">
				<%
					for(StudentSubject list : listStudentS){
						subject = functionJAXB.getSubjectById(list.getSubjectID());
						
						if(semesterId.contains(subject.getSemester())){
						
						String subName = subject.getSubjectName();
				%>
				<button class="tablinks"
					onclick="selectSubject(event, '<%=subName%>')" id="defaultOpen"><%=subName%></button>

				<%
						}
					}
				%>

			</div>
			<%
				for(StudentSubject list : listStudentS){
						subject = functionJAXB.getSubjectById(list.getSubjectID());
						teacher = functionJAXB.getTeacherById(subject.getTeacherID());
						String subName = subject.getSubjectName();
			%>
			<div id="<%=subName%>" class="tabcontent">
				<div class="mark">
					<div class="marktop">
						<div class="subname">
							<h1><%=subject.getShortName()%></h1>
						</div>
						<div class="teacherInf">
							<p>
								Teacher Name :
								<%=teacher.getTeacherName()%></p>
							<p>
								Email :
								<%=teacher.getMail()%></p>
							<p>
								Phone :
								<%=teacher.getPhone()%></p>
						</div>
					</div>
					<div class="marktb">
						<table>
							<tr>
								<th>Grade ID</th>
								<th>Weight</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>PT1</td>
								<td>10%</td>
								<td><%=list.getPT1()%></td>
							</tr>
							<tr>
								<td>PT2</td>
								<td>10%</td>
								<td><%=list.getPT2()%></td>
							</tr>
							<tr>
								<td>ASS1</td>
								<td>10%</td>
								<td><%=list.getASS1()%></td>
							</tr>
							<tr>
								<td>ASS2</td>
								<td>10%</td>
								<td><%=list.getAss2()%></td>
							</tr>
							<tr>
								<td>FinalExam</td>
								<td>10%</td>
								<td><%=list.getFinalExam()%></td>
							</tr>
							<tr>
								<td>TotalMark</td>
								<td>100%</td>
								<td><%=list.getTotalMark()%></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<%
				}
						}
			%>

			<script type="text/javascript">
				function selectSubject(evt, subName) {
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
					document.getElementById(subName).style.display = "block";
					evt.currentTarget.className += " active";
				}

				// Get the element with id="defaultOpen" and click on it
				document.getElementById("defaultOpen").click();

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
		</div>
	</div>
</body>
</html>