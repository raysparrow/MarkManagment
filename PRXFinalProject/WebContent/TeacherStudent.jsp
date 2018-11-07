<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="objects.*"%>
<%@ page import="objects.Class"%>
<%@ page import="java.util.List"%>
<%@ page import="javax.servlet.http.*"%>
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
		String email = (String)session.getAttribute("email");
			//get user is signing in
			//check Signing in
			if(email == null || email.equals("")){
		response.sendRedirect("Logout.jsp");
			} else {
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String studentID = request.getParameter("studentId");
		int subjectID = Integer.parseInt(request.getParameter("subjectId"));
		String shortName = request.getParameter("shortName");
		String semester = request.getParameter("semester");
		String point = request.getParameter("point");
			List<StudentSubject> studentSubject = functionJAXB.getStudentSubjectsByStudentId(studentID);
			Student student = functionJAXB.getStudentByID(studentID);
			Subject subjects = functionJAXB.getSubjectById(subjectID);
			//Get teacher's information
			Teacher teacher = functionJAXB.getTeacherByEmail(email);
			//Get teacher's subject
			List<Subject> listSubject = functionJAXB.getSubjectByTeacherId(teacher.getTeacherID());
			Class classes = functionJAXB.getClassById(subjects.getClassID());
			Subject subjects2 = functionJAXB.getSubjectByName(shortName, semester, classes.getClassID());
			List<StudentSubject> studentSubject2 = functionJAXB.getStudentSubjectsBySubjectId(subjects2.getSubjectID());
			Class classes2 = functionJAXB.getClassById(subjects2.getClassID());
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
			<a href="TeacherHome.jsp">Home</a> <a class="active"
				href="TeacherClass.jsp">Class</a> <a href="TeacherProfile.jsp">Profile</a>
		</div>
		<div class="content">
			<div class="filterStudent">
				<div class="listFilterStudent">
					<form
						action="TeacherStudent.jsp?studentId=p&subjectId=<%=subjectID%>"
						method="post">
						<div class="itemsFilter">
							<label>Subject</label> <select name="shortName">
								<%
									for (Subject listSubjectTeacher : listSubject) {
								%>
								<option value="<%=listSubjectTeacher.getShortName()%>"><%=listSubjectTeacher.getShortName()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="itemsFilter">
							<label>Semester</label> <select name="semester">
								<option value="Spring 2018">Spr2018</option>
								<option value="Fall 2018">Fall2018</option>
								<option value="Summer 2018">Sum2018</option>
							</select>
						</div>
						<div class="itemsFilter">
							<label>Point</label> <select name="point">
								<option value="1">Highest</option>
								<option value="2">Lowest</option>
							</select>
						</div>
						<button type="submit" class="btnFilter">Search</button>
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
				<div class="studentName"><%=student.getStudentName()%>
				</div>
				<div class="studentID">
					Student ID:
					<%=list.getStudentID()%>
				</div>
				<div>
					Subject:
					<p id="subject"><%=subjects.getSubjectName()%></p>
				</div>
				<div>
					Class:
					<p id="className"><%=classes.getClassName()%></p>
				</div>
				<table>
					<tr>
						<th>Subject</th>
						<th>Mark</th>
						<th>Edit Mark</th>
					</tr>
					<tr>
						<td>Progress Test 1</td>
						<form
							action="edit.jsp?type=pt1&studentId=<%=list.getStudentID()%>&subjectId=<%=subjects.getSubjectID()%>"
							method="post">
							<td><input name="mark" onclick="myFunction(1)"
								value="<%=list.getPT1()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn1" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Progress Test 2</td>
						<form
							action="edit.jsp?type=pt2&studentId=<%=list.getStudentID()%>&subjectId=<%=subjects.getSubjectID()%>"
							method="post">
							<td><input name="mark" onclick="myFunction(2)"
								value="<%=list.getPT2()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn2" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 1</td>
						<form
							action="edit.jsp?type=ass1&studentId=<%=list.getStudentID()%>&subjectId=<%=subjects.getSubjectID()%>"
							method="post">
							<td><input name="mark" onclick="myFunction(3)"
								value="<%=list.getASS1()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn3" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 2</td>
						<form
							action="edit.jsp?type=ass2&studentId=<%=list.getStudentID()%>&subjectId=<%=subjects.getSubjectID()%>"
							method="post">
							<td><input name="mark" onclick="myFunction(4)"
								value="<%=list.getAss2()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn4" disabled>Save</button>
							</td>
						</form>
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
				<div class="studentName"><%=student2.getStudentName()%>
				</div>
				<div class="studentID">
					Student ID:
					<%=StuSubMin.getStudentID()%>
				</div>
				<div>
					Subject:
					<p id="subject"><%=subjects2.getSubjectName()%></p>
				</div>
				<div>
					Class:
					<p id="className"><%=classes2.getClassName()%></p>
				</div>
				<table>
					<tr>
						<th>Subject</th>
						<th>Mark</th>
						<th>Edit Mark</th>
					</tr>
					<tr>
						<td>Progress Test 1</td>
						<form
							action="edit.jsp?type=pt1&studentId=<%=StuSubMin.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(1)"
								value="<%=StuSubMin.getPT1()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn1" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Progress Test 2</td>
						<form
							action="edit.jsp?type=pt2&studentId=<%=StuSubMin.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(2)"
								value="<%=StuSubMin.getPT2()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn2" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 1</td>
						<form
							action="edit.jsp?type=ass1&studentId=<%=StuSubMin.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(3)"
								value="<%=StuSubMin.getASS1()%>"
								pattern="[0-9]+(\.[0-9][0-9]?)?" required /></td>
							<td>
								<button type="submit" id="saveBtn3" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 2</td>
						<form
							action="edit.jsp?type=ass2&studentId=<%=StuSubMin.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(4)"
								value="<%=StuSubMin.getAss2()%>"
								pattern="[0-9]+(\.[0-9][0-9]?)?" required /></td>
							<td>
								<button type="submit" id="saveBtn4" disabled>Save</button>
							</td>
						</form>
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
				<div class="studentName"><%=student2.getStudentName()%>
				</div>
				<div class="studentID">
					Student ID:
					<%=StuSubMax.getStudentID()%>
				</div>
				<div>
					Subject:
					<p id="subject"><%=subjects2.getSubjectName()%></p>
				</div>
				<div>
					Class:
					<p id="className"><%=classes2.getClassName()%></p>
				</div>
				<table>
					<tr>
						<th>Subject</th>
						<th>Mark</th>
						<th>Edit Mark</th>
					</tr>
					<tr>
						<td>Progress Test 1</td>
						<form
							action="edit.jsp?type=pt1&studentId=<%=StuSubMax.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(1)"
								value="<%=StuSubMax.getPT1()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn1" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Progress Test 2</td>
						<form
							action="edit.jsp?type=pt2&studentId=<%=StuSubMax.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(2)"
								value="<%=StuSubMax.getPT2()%>" pattern="[0-9]+(\.[0-9][0-9]?)?"
								required /></td>
							<td>
								<button type="submit" id="saveBtn2" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 1</td>
						<form
							action="edit.jsp?type=ass1&studentId=<%=StuSubMax.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(3)"
								value="<%=StuSubMax.getASS1()%>"
								pattern="[0-9]+(\.[0-9][0-9]?)?" required /></td>
							<td>
								<button type="submit" id="saveBtn3" disabled>Save</button>
							</td>
						</form>
					</tr>
					<tr>
						<td>Assignment 2</td>
						<form
							action="edit.jsp?type=ass2&studentId=<%=StuSubMax.getStudentID()%>&subjectId=<%=subjects2.getSubjectID()%>&shortName=<%=shortName%>&semester=<%=semester%>&point=<%=point%>"
							method="post">
							<td><input name="mark" onclick="myFunction(4)"
								value="<%=StuSubMax.getAss2()%>"
								pattern="[0-9]+(\.[0-9][0-9]?)?" required /></td>
							<td>
								<button type="submit" id="saveBtn4" disabled>Save</button>
							</td>
						</form>
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
					} else {
				%>
				<h3>can not found!</h3>
				<%
					}
												}
												}
				%>

			</div>
		</div>
	</div>
	<script>
		var i;
		function myFunction(i) {
			if (i == 1) {
				document.getElementById("saveBtn1").disabled = false;
			} else if (i == 2) {
				document.getElementById("saveBtn2").disabled = false;
			} else if (i == 3) {
				document.getElementById("saveBtn3").disabled = false;
			} else if (i == 4) {
				document.getElementById("saveBtn4").disabled = false;
			}
		}

		function myFunction2(i) {
			if (i == 1) {
				document.getElementById("saveBtn1").disabled = true;
			} else if (i == 2) {
				document.getElementById("saveBtn2").disabled = true;
			} else if (i == 3) {
				document.getElementById("saveBtn3").disabled = true;
			} else if (i == 4) {
				document.getElementById("saveBtn4").disabled = true;
			}
		}
	</script>
</body>
</html>