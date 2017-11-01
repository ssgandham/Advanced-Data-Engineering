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

	            String image_id = "";
	            Statement select_artists = test_connection.createStatement();
	            if (request.getParameter("image_id") != null)
	                image_id = request.getParameter("image_id");

	            // if ("Query 1".equals(request.getParameter("submit"))) {
	            String query_gallery =
	                    "select a.image_id, a.title, b.name, a.link, c.type, c.width,c.height,c.location, c.description from image a inner join artist b on a.artist_id=b.artist_id inner join detail c on c.image_id = a.image_id where a.image_id = "
	                            + image_id + ";";
	            System.out.println(query_gallery);
	            //String query_count = "select count(*) from gallery;";
	            ResultSet result_artist_name = select_artists.executeQuery(query_gallery);
	            //ResultSet result_count = select_artists.executeQuery(query_gallery);
	            out.print(
	                    "<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");

	            out.print("<tr><th>ID</th><th>Title</th><th> Artist Name</th><th>Link</th><th>Type</th><th>Width</th><th>Height</th><th>Location</th><th>Description</th></tr>");
	            while (result_artist_name.next()) {
	                //System.out.println("Went inside : ");
	                //String tmp = result_artist_name.getString("gallery_id").toString();
	                System.out.println(query_gallery);

	                out.println("<tr><td>" + result_artist_name.getString("image_id") + 
	                        "</td><td>" + result_artist_name.getString("title") + "</td><td>" +result_artist_name.getString("name")+
	                		"<td><img src=\"" + result_artist_name.getString("link") +" \" height=\"100\" width=\"200\" ></td>" + 
	                		"<td>" + result_artist_name.getString("type") + "</td>" + 
	                		"<td>" + result_artist_name.getString("width") + "</td>" + 
	                		"<td>" + result_artist_name.getString("height") + "</td>" + 
	                		"<td>" + result_artist_name.getString("location") + "</td>" + 
	                		"<td>" + result_artist_name.getString("description") + "</td>"
	                		
	                        );
	                //out.print(result_artist_name.getString("name"));
	                //out.println("<td>" + result_artist_name.getString("description") + "</td></tr>");
	            }
	            out.println("</table></body></html>");
	            select_artists.close();
	            // }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>