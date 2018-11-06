<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
<%@ page import="function.FunctionJAXB"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<% 
		FunctionJAXB functionJAXB = new FunctionJAXB();
		String shortName = request.getParameter("shortName");
		String semester = request.getParameter("semester");
		String point = request.getParameter("point");
		String type = request.getParameter("type");
		String studentId = request.getParameter("studentId");
		int subjectId = Integer.parseInt(request.getParameter("subjectId"));
		double mark = Double.parseDouble(request.getParameter("mark"));
		functionJAXB.editMark(type, studentId, subjectId, mark);
		response.sendRedirect("TeacherStudent.jsp?shortName="+shortName+"&semester="+semester+"&point="+point);
	%>
	<%=type %>
	<%=studentId %>
	<%=subjectId %>
	<%=mark %>
	
</body>
</html>