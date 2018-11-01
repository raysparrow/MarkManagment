<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="javax.servlet.http.HttpServletResponse"%>
<%@ page import="javax.servlet.http.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>waiting.......</h1>
	<%
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		FunctionJAXB functionJAXB = new FunctionJAXB();
		//Get Student mark info
		List<Student> students = functionJAXB.getAllStudents();
		List<Teacher> teachers = functionJAXB.getAllTeachers();

		boolean check = true;
		boolean check1 = true;

		for (Student listS : students) {
			if (listS.getStudentMail().equals(email)) {
				if (listS.getPassword().equals(password)) {
					session.setAttribute("email", email);
					//response.sendRedirect("StudentHome.jsp");
					response.sendRedirect("StudentSubject.jsp");
					break;
				} else {
					check = false;
				}
			} else {
				check = false;
			}
		}

		if (check == false) {
			for (Teacher listT : teachers) {
				if (listT.getMail().equals(email)) {
					if (listT.getPassword().equals(password)) {
						session.setAttribute("email", email);
						response.sendRedirect("TeacherHome.html");
						break;
					} else {
						check1 = false;
					}
				} else {
					check1 = false;
				}
			}

			if (check1 == false) {
				response.sendRedirect("Login.html");
			}
		}
	%>
	<ul>
		<li><p>
				<b>First Name:</b>
				<%=email%>
			</p></li>
		<li><p>
				<b>Last Name:</b>
				<%=password%>
			</p></li>
	</ul>
</body>
</html>