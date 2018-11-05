<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="objects.*"%>
<%@ page import="objects.Class"%>
<%@ page import="java.util.List"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/TeacherStudent.css">
</head>
<body>
	<%
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String studentID = request.getParameter("studentId");
		int subjectID=1;
		if(request.getParameter("subjectId")!=null){
		subjectID = Integer.parseInt(request.getParameter("subjectId"));
		}
		
		String shortName = request.getParameter("subject");
		String semester = request.getParameter("semester");
		String point = request.getParameter("point");
		
		//Get Student Info
		
		List<StudentSubject> studentSubject = functionJAXB.getStudentSubjectsByStudentId(studentID);
		Student student = functionJAXB.getStudentByID(studentID);
		Subject subjects = functionJAXB.getSubjectById(subjectID);
		Class classes = functionJAXB.getClassById(subjects.getClassID());
		Subject subjects2 = functionJAXB.getSubjectByName(shortName, semester, classes.getClassID());
		List<StudentSubject> studentSubject2 = functionJAXB.getStudentSubjectsBySubjectId(subjects2.getSubjectID());
		Class classes2 = functionJAXB.getClassById(subjects2.getClassID());
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
			<a href="#home">Home</a>
			<a class="active" href="TeacherStudent.jsp">Class</a>
			<a href="TeacherProfile.jsp">Profile</a>
		</div>
		<div class="content">
			<div class="filterStudent">
				<div class="listFilterStudent">
					<form action="TeacherStudent.jsp" method="post">
						<div class="itemsFilter">
							<label>Subject</label>
							<select name="subject">
								<option value="PRX301">PRX</option>
								<option value="MLN101">MNL</option>
								<option value="MAS291">MAS</option>
							</select>
						</div>
						<div class="itemsFilter">
							<label>Semester</label>
							<select name="semester">
								<option value="Spring 2018">Spr2018</option>
								<option value="Fall 2018">Fall2018</option>
								<option value="Summer 2018">Sum2018</option>
							</select>
						</div>
						<div class="itemsFilter">
							<label>Point</label>
							<select name="point">
								<option value="1">Highest</option>
								<option value="2">Lowest</option>
							</select>
						</div>
						<button type="submit" class="btnFilter">
							Search
						</button>
					</form>
				</div>
			</div>
			<div class="leftStudent ava">
				<img id="img1" alt="headerIMG" src="img/user1.png" />
			</div>
			<div class="rightStudent">
			<%
			if(shortName == null){
				for(StudentSubject list : studentSubject){
					if (list.getStudentID().equals(studentID) && list.getSubjectID() == subjectID) {
			%>
				<div class="studentName"><%= student.getStudentName()%>
				</div>
				<div class="studentID">
					Student ID: <%=list.getStudentID()%>
				</div>
				<div>
					Subject:
					<p id="subject"><%=subjects.getSubjectName() %></p>
				</div>
				<div>
					Class:
					<p id="className"><%=classes.getClassName() %></p>
				</div>
				<table>
					<tr>
						<th>Subject</th>
						<th>Mark</th>
					</tr>
					<tr>
						<td>Progress Test 1</td>
						<td><%=list.getPT1()%></td>
					</tr>
					<tr>
						<td>Progress Test 2</td>
						<td><%=list.getPT2()%></td>
					</tr>
					<tr>
						<td>Assignment 1</td>
						<td><%=list.getASS1()%></td>
					</tr>
					<tr>
						<td>Assignment 2</td>
						<td><%=list.getAss2()%></td>
					</tr>
					<tr>
						<td>Final Exam</td>
						<td><%=list.getFinalExam()%></td>
					</tr>
					<tr>
						<td>Total Mark</td>
						<td><%=list.getTotalMark()%></td>
					</tr>
				</table>
				<%
						}
					}
				} else {
					StudentSubject StuSubMin = null;
					StudentSubject StuSubMax = null;
					double min =0;
					double max =0;
					int i = 0;
					for(StudentSubject list : studentSubject2){
						if(i == 0){
							max = list.getTotalMark();
							min = list.getTotalMark();
							StuSubMin = list;
							StuSubMax = list;
						} else {
							if(max < list.getTotalMark()){
								max = list.getTotalMark();
								StuSubMax = list;
							}
							
							if(min > list.getTotalMark()){
								min = list.getTotalMark();
								StuSubMin = list;
							}
						}
						i++;
					}
				%>
				<%
					if (StuSubMin != null && point.equals("2")){
						Student student2 = functionJAXB.getStudentByID(StuSubMin.getStudentID());
						%>
						<div class="studentName"><%= student2.getStudentName()%>
					</div>
					<div class="studentID">
						Student ID: <%=StuSubMin.getStudentID()%>
					</div>
					<div>
						Subject:
						<p id="subject"><%=subjects2.getSubjectName() %></p>
					</div>
					<div>
						Class:
						<p id="className"><%=classes2.getClassName() %></p>
					</div>
					<table>
						<tr>
							<th>Subject</th>
							<th>Mark</th>
						</tr>
						<tr>
							<td>Progress Test 1</td>
							<td><%=StuSubMin.getPT1()%></td>
						</tr>
						<tr>
							<td>Progress Test 2</td>
							<td><%=StuSubMin.getPT2()%></td>
						</tr>
						<tr>
							<td>Assignment 1</td>
							<td><%=StuSubMin.getASS1()%></td>
						</tr>
						<tr>
							<td>Assignment 2</td>
							<td><%=StuSubMin.getAss2()%></td>
						</tr>
						<tr>
							<td>Final Exam</td>
							<td><%=StuSubMin.getFinalExam()%></td>
						</tr>
						<tr>
							<td>Total Mark</td>
							<td><%=StuSubMin.getTotalMark()%></td>
						</tr>
						
					</table>
						<% 
					} else if (StuSubMax != null && point.equals("1")){
						Student student2 = functionJAXB.getStudentByID(StuSubMax.getStudentID());
						%>
						<div class="studentName"><%= student2.getStudentName()%>
					</div>
					<div class="studentID">
						Student ID: <%=StuSubMax.getStudentID()%>
					</div>
					<div>
						Subject:
						<p id="subject"><%=subjects2.getSubjectName()%></p>
					</div>
					<div>
						Class:
						<p id="className"><%=classes2.getClassName() %></p>
					</div>
					<table>
						<tr>
							<th>Subject</th>
							<th>Mark</th>
							<th>Edit</th>
						</tr>
						<tr>
							<td>Progress Test 1</td>
							<td><%=StuSubMax.getPT1()%></td>
							<td>
								<button onclick=functionJAXB.editMark()>Edit</button>
								<button onclick=functionJAXB.editMark()>Save</button>
							</td>
						</tr>
						<tr>
							<td>Progress Test 2</td>
							<td><%=StuSubMax.getPT2()%></td>
							<td><button onclick=functionJAXB.editMark()>Edit</button></td>
						</tr>
						<tr>
							<td>Assignment 1</td>
							<td><%=StuSubMax.getASS1()%></td>
							<td><button onclick=functionJAXB.editMark()>Edit</button></td>
						</tr>
						<tr>
							<td>Assignment 2</td>
							<td><%=StuSubMax.getAss2()%></td>
							<td><button onclick=functionJAXB.editMark()>Edit</button></td>
						</tr>
						<tr>
							<td>Final Exam</td>
							<td><%=StuSubMax.getFinalExam()%></td>
						</tr>
						<tr>
							<td>Total Mark</td>
							<td><%=StuSubMax.getTotalMark()%></td>
						</tr>
						
					</table>
						<%
					}
				}
				%>
			</div>
		</div>
	</div>
	<script>
		myFunction();
		function myFunction() {
		    var x = document.getElementById("subject").value;
		    document.getElementById("demo").innerHTML = x;
		}
</script>
</body>
</html>