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

<style>
input[type=text], select {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}
input[type=submit] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    
   
    border: none;
    border-radius: 4px;
    cursor: pointer;
}


input[type=submit]:hover {
    background-color: #45a049;
}
div {
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
}
</style>
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
				<td><input type="text" name="input_name" required></td>
			</tr>
			<tr>
				<td>Description</td>
				<td><input type="text" name="input_description" required></td>
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
	                "jdbc:mysql:///db_mini_project2?autoReconnect=true&useSSL=false", "gallery", "eecs118");

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