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
	<p>Create a new Gallery</p>
	<form method="post" action="Query5.jsp">
		<table>
			<tr>
				<td>Name</td>
				<td><input type="text" name="input_name"></td>
			</tr>
			<tr>
				<td>Description</td>
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
	            String name = "", description = "";
	            if (request.getParameter("input_name") != null)
	                name = request.getParameter("input_name");
	            if (request.getParameter("input_description") != null)
	                description = request.getParameter("input_description");
	            if (name.length() != 0 && description.length() != 0) {
	                String query = "insert into gallery (name,description) values(?,?);";
	                PreparedStatement preparedStmt = test_connection.prepareStatement(query);
	                preparedStmt.setString(1, name);
	                preparedStmt.setString(2, description);
	                preparedStmt.execute();
	                test_connection.close();
	                /* Statement select_artists = test_connection.createStatement();
	                ResultSet result_artist_name = select_artists.executeQuery(query); */
	                System.out.println(query);
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>