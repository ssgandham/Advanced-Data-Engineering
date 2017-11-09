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

/*The css has been taken from https://www.w3schools.com/css/tryit.asp?filename=trycss_table_fancy*/

table {
    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
    border-collapse: collapse;
    width: 100%;
}

table td, th {
    border: 1px solid #ddd;
    padding: 8px;
}

table tr:nth-child(even){background-color: #f2f2f2;}

table tr:hover {background-color: #ddd;}

table th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #4CAF50;
    color: white;
}
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
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

	            String artist_name = "";
	            Statement select_artists = test_connection.createStatement();
	            if (request.getParameter("artist_name") != null)
	                artist_name = request.getParameter("artist_name");

	            String query = "select * from artist where name ='" + artist_name + "';";
	            System.out.println(query);
	            ResultSet result_artist_name = select_artists.executeQuery(query);

	            out.print(
	                    "<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");

	            out.print("<tr><th>Name</th><th>Birth Year</th><th> Country</th><th>Description</th></tr>");
	            while (result_artist_name.next()) {
	                out.println("<tr><td>" + result_artist_name.getString("name") + "</td><td>"
	                        + result_artist_name.getString("birth_year") + "</td><td>"
	                        + result_artist_name.getString("country") + "</td><td>"
	                        + result_artist_name.getString("description") + "</td>");
	                out.println("</table></body></html>");

	            }
	            select_artists.close();
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>