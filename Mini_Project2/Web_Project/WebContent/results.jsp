<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="java.io.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*" %>
<%@page import="java.net.*" %>
<%@page import="java.util.Date" %>
	<%-- <%Class.forName("com.mysql.jdbc.Driver"); %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    String image_type = "", image_year = "", artist_name = "", image_location = "", artist_country = "",
	            artist_birth_year = "";
	%>
	<%
	    if (request.getParameter("image_type") != null)
	        image_type = request.getParameter("image_type");

	    if (request.getParameter("image_year") != null)
	        image_year = request.getParameter("image_year");

	    if (request.getParameter("artist_name") != null)
	        artist_name = request.getParameter("artist_name");

	    if (request.getParameter("image_location") != null)
	        image_location = request.getParameter("image_location");

	    if (request.getParameter("artist_country") != null)
	        artist_country = request.getParameter("artist_country");

	    if (request.getParameter("artist_birth_year") != null)
	        artist_birth_year = request.getParameter("artist_birth_year");

	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	         Connection test_connection =
	                DriverManager.getConnection("jdbc:mysql:///db_mini_project2?autoReconnect=true&useSSL=false", "root", "root");
	         
	         /* Connection test_connection=DriverManager
	                    .getConnection("jdbc:mysql://localhost/feedback?"
	                            + "user=root&password=root"); */
	         if (test_connection == null) {
	            System.out.println("Not successful");
	            out.println("Connection not successfull");
	        } else {
	            Statement select_artists = test_connection.createStatement();
	            String query_artists_count = "select * from artist where country='"+artist_country+"';";
	            System.out.println(query_artists_count);
	            String query_artists_year  = "select * from artist where year=" + artist_birth_year+";";
	            ResultSet result_artists = select_artists.executeQuery(query_artists_count);
	            while(result_artists.next()){
	                System.out.println("Went inside : " );
	                String tmp=result_artists.getString("name").toString();
	                System.out.println(tmp);
	                out.print(tmp);
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	    
	%>
</body>
</html>