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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://www.w3schools.com/lib/w3.js"></script>
</head>
<body>
	<%
	//get user is signing in
			String email = (String) session.getAttribute("email");
			//check Signing in
			if(email == null || email.equals("")){
				response.sendRedirect("Logout.jsp");
			}else {
		FunctionJAXB functionJAXB = new FunctionJAXB();

		//Get Student Info
		Student student = functionJAXB.getStudentByEmail(email);

		//Get Student mark info
		List<StudentSubject> studentSubjects = functionJAXB
				.getStudentSubjectsByStudentId(student.getStudentID());
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
			<a class="active" href="#home">Home</a> <a href="StudentSubject.jsp">Subjects</a>
			<a href="StudentProfile.jsp">Student Profile</a>
		</div>
		<div class="content">
			<div class="example">
			  <input type="text" placeholder="Search by Short Name" id="search" name="search">
			  <button onclick="myFunction()"><i class="fa fa-search"></i></button>
			</div>
			<table id="homeTBL">
				<thead>
				<tr>
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(1)')">Subject ID<i class="fa fa-sort"></i></th>
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(2)')">Subject Name<i class="fa fa-sort"></i></th>
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(3)')">Number of credits<i class="fa fa-sort"></i></th>
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(4)')">Average Mark<i class="fa fa-sort"></i></th>					
				</tr>
				</thead>
				<tbody id="tbodyS">
				<%
					for (int i = 0; i < studentSubjects.size(); i++) {
						Subject subject = functionJAXB.getSubjectById(studentSubjects
								.get(i).getSubjectID());
				%>
				<tr class="subject">
					<td><%=subject.getShortName()%></td>
					<td><%=subject.getSubjectName()%></td>
					<td><%=subject.getNumberOfCredit()%></td>
					<td><%=studentSubjects.get(i).getTotalMark()%></td>
				</tr>
				<%
					}
			}
				%>
				</tbody>
			</table>
		</div>
		<script type="text/javascript">
			
			 $(document).ready(function(){  
		           $('#search').keyup(function(){  
		                search_table($(this).val());  
		           });  
		           function search_table(value){  
		                $('#tbodyS tr').each(function(){  
		                     var found = 'false';  
		                     $(this).find('td:nth-child(1)').each(function(){  
		                          if($(this).text().toLowerCase().indexOf(value.toLowerCase()) >= 0)  
		                          {  
		                               found = 'true';  
		                          }  
		                     });  
		                     if(found == 'true')  
		                     {  
		                          $(this).show();  
		                     }  
		                     else  
		                     {  
		                          $(this).hide();  
		                     }  
		                });  
		           }  
		      });  
			</script>
	</div>
</body>
</html>