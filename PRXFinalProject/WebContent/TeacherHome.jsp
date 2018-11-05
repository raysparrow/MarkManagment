<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="objects.*"%>
<%@ page import="objects.Class"%>
<%@ page import="function.FunctionJAXB"%>
<%@ page import="javax.servlet.http.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>  
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://www.w3schools.com/lib/w3.js"></script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Mark Management</title>
<link rel="stylesheet" type="text/css" href="css/Header.css">
<link rel="stylesheet" type="text/css" href="css/TeacherHome.css">
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
			//Get teacher's subject
			List<Subject> listSubject = functionJAXB.getSubjectByTeacherId(teacher.getTeacherID());
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
			<a class="active" href="#">Home</a>
			<a href="TeacherClass.jsp">Class</a> 
			<a href="TeacherProfile.jsp">Profile</a>
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
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(3)')">Class Name<i class="fa fa-sort"></i></th>
					<th onclick="w3.sortHTML('#homeTBL', '.subject', 'td:nth-child(4)')">Semester<i class="fa fa-sort"></i></th>
				</tr>
				</thead>
				<tbody id="tbodyS">
				<%
				for (int i = 0; i < listSubject.size(); i++) {
					Subject subject = listSubject.get(i);
				%>
				<tr class="subject">
					<td><a href="TeacherClass.jsp?shortName=<%=subject.getShortName()%>"><%=subject.getShortName()%></a></td>
					<td><%=subject.getSubjectName()%></td>
					<%
						Class clazz = functionJAXB.getClassById(subject.getClassID());
					%>
					<td><%=clazz.getClassName()%></td>
					<td><%=subject.getSemester()%></td>
				</tr>
				<%
					}
				}
				%>
				</tbody>	
			</table>
			
			<script type="text/javascript">
			
/* 			function myFunction() {
			    var x = document.getElementById("search").value;
			    document.getElementById("demo").innerHTML = x;
 			    listSubject = functionJAXB.groupSubjectByShortNameTeacherId(sortName, teacherID);
			} */
			
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

	</div>
</body>
</html>