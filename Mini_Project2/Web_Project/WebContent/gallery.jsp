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

	        if (test_connection == null) {
	            System.out.println("Not successful");
	            out.println("Connection not successfull");
	        } else {
	            String query_gallery_all = "select distinct gallery_id, name, description from gallery;";

	            Statement select_gallery_all = test_connection.createStatement();
	            Statement select_gallery = test_connection.createStatement();

	            ResultSet result_gallery_all = select_gallery_all.executeQuery(query_gallery_all);

	            out.print(
	                    "<!DOCTYPE html><html><head><style>table, th, td {border: 1px solid black;border-collapse: collapse;}</style></head><body><table style=\"width:100%\">");

	            out.print("<tr><th>Name</th><th>Description</th><th>Image</th></tr>");
	            while (result_gallery_all.next()) {
	                String query_gallery =
	                        "select * from gallery a left outer join image b on a.gallery_id=b.gallery_id where a.gallery_id="
	                                + result_gallery_all.getString("gallery_id") + ";";
	                System.out.println(query_gallery);
	                ResultSet result_gallery = select_gallery.executeQuery(query_gallery);
	                System.out.println("Went inside : ");
	                String tmp = result_gallery_all.getString("name").toString();

	                //System.out.println(query_gallery);
	                //out.println(tmp);

	                out.println("<tr><td>" + tmp + "</td><td>" + result_gallery_all.getString("description")
	                        + "</td><td>");
	                System.out.println("Went inside till: ");
	                String image_url = "";
	                if (result_gallery.next())
	                    image_url = result_gallery.getString("link");
	                System.out.println("Went inside till: ");
	                System.out.println("<a href=gallery_images.jsp?gallery_id=" + result_gallery_all.getString("gallery_id") + "><img src=" + image_url
	                        + " height=\"300\" width=\"300\"" + "></a></td></tr>");
	                out.println("<a href=gallery_images.jsp?gallery_id=" + result_gallery_all.getString("gallery_id") + "><img src=" + image_url
	                        + " height=\"300\" width=\"300\"" + "></a></td></tr>");

	            }
	            out.println("</table></body></html>");
	            select_gallery.close();
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>