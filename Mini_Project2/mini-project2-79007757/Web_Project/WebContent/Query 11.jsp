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
<p>Modify the details of the Gallery</p>
	<form method="post" action="Query 11.jsp">
		<table>
			<tr>
				<td>Title</td>
				<td><input type="text" name="input_title" required></td>
			</tr>
			<tr>
				<td>Modified title</td>
				<td><input type="text" name="input_title_modify" required></td>
			</tr>
			<tr>
				<td>Modified Description</td>
				<td><input type="text" name="input_description" requried></td>
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