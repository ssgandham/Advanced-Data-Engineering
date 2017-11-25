<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Date"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="CSV_Read.jsp" method="post">
		Fname:<input type="file" id="fname" placeholder="type first name" /><br>
		<input type="submit" value="submit" />
	</form>

	<%
	    String fname = request.getParameter("fname");
	    System.out.println("My name " + fname);
	%>
</body>
</html>