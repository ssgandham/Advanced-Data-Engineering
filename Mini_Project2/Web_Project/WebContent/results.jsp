<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.sql.*"%>
<%@page import="javax.servlet.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Date"%>
<%-- <%Class.forName("com.mysql.jdbc.Driver"); %> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    String image_type = "", image_year_from = "", image_year_to = "", artist_name = "", image_location = "",
	            artist_country = "", artist_birth_year = "";
	%>
	<%
	    if (request.getParameter("image_type") != null)
	        image_type = request.getParameter("image_type");

	    if (request.getParameter("image_year_from") != null)
	        image_year_from = request.getParameter("image_year_from");

	    if (request.getParameter("image_year_to") != null)
	        image_year_to = request.getParameter("image_year_to");

	    if (request.getParameter("artist_name") != null)
	        artist_name = request.getParameter("artist_name");

	    // System.out.println("artist name:"+artist_name);

	    if (request.getParameter("image_location") != null)
	        image_location = request.getParameter("image_location");

	    if (request.getParameter("artist_country") != null)
	        artist_country = request.getParameter("artist_country");

	    if (request.getParameter("artist_birth_year") != null)
	        artist_birth_year = request.getParameter("artist_birth_year");

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
	            Statement select_artists = test_connection.createStatement();

	            System.out.println(request.getParameter("submit"));

	            if ("Query 1".equals(request.getParameter("submit"))) {
	                String query_gallery = "select * from gallery;";
	                ResultSet result_artist_name = select_artists.executeQuery(query_gallery);
	                out.print("<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");
                    out.print("<tr><th>ID</th><th>Name</th><th>Description</th></tr>");
	                while (result_artist_name.next()) {
	                    //System.out.println("Went inside : ");
	                    //String tmp = result_artist_name.getString("gallery_id").toString();
	                    System.out.println(query_gallery);
	                    
	                    out.println("<tr><td>"+result_artist_name.getString("gallery_id")+"</td><td>"+result_artist_name.getString("name")+"</td>");
	                    //out.print(result_artist_name.getString("name"));
	                    out.println("<td>"+result_artist_name.getString("description")+"</td></tr>");
	                }
	                out.println("</table></body></html>");
	                select_artists.close();
	            }

	            if ("Query 2".equals(request.getParameter("submit"))) {
	                String query_gallery = "select * from image;";
	                ResultSet result_artist_name = select_artists.executeQuery(query_gallery);
	                out.print("<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");
                    out.print("<tr><th>Gallery ID</th><th>Title</th><th>Image</th></tr>");
	                while (result_artist_name.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_artist_name.getString("image_id").toString();
	                    System.out.println(query_gallery);
	                    //out.println(tmp);
	                    
	                    out.println("<tr><td>"+tmp+"</td><td>"+ result_artist_name.getString("title")+ "</td><td>");
	                    String image_url = result_artist_name.getString("link");
	                    out.println("<img src="+image_url+" height=\"100\" width=\"200\"" + "></td></tr>" );
	                    
	                }
	                out.println("</table></body></html>");
	                select_artists.close();
	            }

	            if ("Query 12".equals(request.getParameter("submit"))) {
	                String query_image_type =
	                        "select * from detail a inner join image b on a.image_id=b.image_id where a.type='"
	                                + image_type + "';";
	                ResultSet result_artist_name = select_artists.executeQuery(query_image_type);
	                out.print("<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");
                    out.print("<tr><th>Image ID</th><th>Title</th><th>Year</th><th>Type</th><th>Width</th><th>Height</th><th>Location</th><th> Link</th></tr>");
	                while (result_artist_name.next()) {
	                   /* System.out.println("Went inside : ");
	                    String tmp = result_artist_name.getString("title").toString();
	                    System.out.println(query_image_type);
	                    out.println(tmp);*/
	                    out.print("<tr><td>"+result_artist_name.getString("image_id")+"</td><td>"+result_artist_name.getString("title")+
	                            "</td><td>"+result_artist_name.getString("year") + "</td><td>"+result_artist_name.getString("type")+
	                            "</td><td>"+result_artist_name.getString("width") + "</td><td>" + result_artist_name.getString("height") + 
	                            "</td><td>" + result_artist_name.getString("location") + "</td><td><img src="+result_artist_name.getString("link")+" height=\"100\" width=\"200\"" + "></td></tr>");
	                    
	                }
	                out.println("</table></body></html>");
	                select_artists.close();
	            }

	            if ("Query 13".equals(request.getParameter("submit"))) {
	                String query_artist_name =
	                        "select * from detail a inner join image b on a.image_id=b.image_id where a.year>="
	                                + image_year_from + " and a.year<=" + image_year_to;
	                ResultSet result_artist_name = select_artists.executeQuery(query_artist_name);
	                while (result_artist_name.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_artist_name.getString("title").toString();
	                    System.out.println(query_artist_name);
	                    out.println(tmp);
	                }
	                select_artists.close();
	            }

	            if ("Query 14".equals(request.getParameter("submit"))) {
	                String query_artist_name = "select * from artist where name='" + artist_name + "'";
	                ResultSet result_artist_name = select_artists.executeQuery(query_artist_name);
	                while (result_artist_name.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_artist_name.getString("name").toString();
	                    System.out.println(query_artist_name);
	                    out.println(tmp);
	                }
	                select_artists.close();
	            }

	            if ("Query 15".equals(request.getParameter("submit"))) {
	                String query_images_location =
	                        "select distinct a.title, a.link, b.type, b.location, c.name as 'Artist Name' from image a inner join detail b on a.image_id=b.image_id inner join artist c on a.artist_id=c.artist_id where b.location='"
	                                + image_location + "' or c.name='" + artist_name + "';";
	                ResultSet result_image_location = select_artists.executeQuery(query_images_location);
	                while (result_image_location.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_image_location.getString("title").toString();
	                    System.out.println(query_images_location);
	                    out.println(tmp);
	                }
	                select_artists.close();
	            }

	            if ("Query 16".equals(request.getParameter("submit"))) {
	                String query_artists_country = "select * from artist where country='" + artist_country + "';";
	                ResultSet result_artists_country = select_artists.executeQuery(query_artists_country);
	                while (result_artists_country.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_artists_country.getString("name").toString();
	                    System.out.println(query_artists_country);
	                    out.println(tmp);
	                }
	                select_artists.close();
	            }

	            if ("Query 17".equals(request.getParameter("submit"))) {
	                String query_artists_year = "select * from artist where birth_year=" + artist_birth_year + ";";

	                ResultSet result_artists_year = select_artists.executeQuery(query_artists_year);
	                while (result_artists_year.next()) {
	                    System.out.println("Went inside : ");
	                    String tmp = result_artists_year.getString("name").toString();
	                    System.out.println(query_artists_year);
	                    out.println(tmp);
	                }
	                select_artists.close();
	            }
	            /* 	            ResultSet result_artists = select_artists.executeQuery(query_images_location);
	            	             while(result_artists.next()){
	            // System.out.println("Went inside : " ); 
	            String tmp=result_artists.getString("title").toString();
	            System.out.println(query_images_location);
	            out.println(tmp);
	            	            }  */
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>