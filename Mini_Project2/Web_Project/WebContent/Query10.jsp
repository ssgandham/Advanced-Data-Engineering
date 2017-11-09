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
Modify the details of an artist
	<form method="post" action="Query10.jsp">
		<table>
			<tr>
				<td>Enter the Name to be modified</td>
				<td><input type="text" name="input_name"></td>
			</tr>
			<tr>
				<td>New Name</td>
				<td><input type="text" name="input_name_modified"></td>
			</tr>
			<tr>
				<td>Year of Birth</td>
				<td><input type="text" name="input_year_of_birth"></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" name="input_country"></td>
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

	        if (test_connection == null) {
	            System.out.println("Not successful");
	            out.println("Connection not successfull");
	        } else {
	            String name = "", name_modified = "", year_of_birth = "", country = "", description = "";
	            if (request.getParameter("input_name") != null)
	                name = request.getParameter("input_name");

	            if (request.getParameter("input_name_modified") != null)
	                name_modified = request.getParameter("input_name_modified");

	            if (request.getParameter("input_year_of_birth") != null)
	                year_of_birth = request.getParameter("input_year_of_birth");

	            if (request.getParameter("input_country") != null)
	                country = request.getParameter("input_country");

	            if (request.getParameter("input_description") != null)
	                description = request.getParameter("input_description");

	            if (name_modified.length() != 0 || year_of_birth.length() != 0 || country.length() != 0
	                    || description.length() != 0) {
	                String query = "UPDATE artist SET ";
	                if (!name_modified.equals(""))
	                    query += "name=? ";
	                if (!year_of_birth.equals(""))
	                    query += ",birth_year=? ";
	                if (!country.equals(""))
	                    query += ",country=? ";
	                if (!description.equals(""))
	                    query += ",description=? ";

	                query += " where name='" + name + "'";
	                System.out.println(query);
	                PreparedStatement ps = test_connection.prepareStatement(query);

	                // set the preparedstatement parameters
	                int count = 1;
	                if (name_modified.length() != 0) {
	                    ps.setString(count, name_modified);
	                    count++;
	                }
	                if (year_of_birth.length() != 0) {
	                    ps.setString(count, year_of_birth);
	                    count++;
	                }
	                if (country.length() != 0) {
	                    ps.setString(count, country);
	                    count++;
	                }
	                if (description.length() != 0)
	                    ps.setString(count, description);

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