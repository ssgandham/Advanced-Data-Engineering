<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
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
<p>Modify the details of the Gallery</p>
	<form method="post" action="Query 11.jsp">
		<table>
			<tr>
				<td>Title</td>
				<td><input type="text" name="input_title"></td>
			</tr>
			<tr>
				<td>Modified title</td>
				<td><input type="text" name="input_title_modify"></td>
			</tr>
			<tr>
				<td>Modified Description</td>
				<td><input type="text" name="input_description"></td>
			</tr>
			<tr>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
	
	<%
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection test_connection = DriverManager.getConnection(
	                "jdbc:mysql:///db_mini_project2?autoReconnect=true&useSSL=false", "root", "root");

	        /* Connection test_connection=DriverManager
	        .getConnection("jdbc:mysql://localhost/feedback?"
	        + "user=root&password=root"); */
	        if (test_connection == null) {
	            System.out.println("Not successful");
	            out.println("Connection not successfull");
	        } else {
	            String title = "", title_modified = "", description = "";
	            if (request.getParameter("input_title") != null)
	                title = request.getParameter("input_title");
	            
	            if (request.getParameter("input_title_modify") != null)
	                title_modified = request.getParameter("input_title_modify");
	            
	            if (request.getParameter("input_description") != null)
	                description = request.getParameter("input_description");
	            
	            if (title.length() != 0 || title_modified.length()!=0 || description.length() != 0) {
	                PreparedStatement ps = test_connection.prepareStatement(
	                        "UPDATE gallery SET name = ?, description = ? WHERE name = ?");

	                      // set the preparedstatement parameters
	                      ps.setString(1,title_modified);
	                      ps.setString(2,description);
	                      ps.setString(3,title);

	                      // call executeUpdate to execute our sql update statement
	                      ps.executeUpdate();
	                      ps.close();
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>