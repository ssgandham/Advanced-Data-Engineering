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
	<form method="post" action="Query9.jsp">
		<table>
			<tr>
				<td>Enter the title of the image</td>
				<td><input type="text" name="input_title"></td>
			</tr>
			<tr>
				<td>Enter the New title of the image</td>
				<td><input type="text" name="input_title_modified"></td>
			</tr>
			<tr>
				<td>Link</td>
				<td><input type="text" name="input_link"></td>
			</tr>
			<tr>
				<td>Gallery ID</td>
				<td><input type="text" name="input_gallery_id"></td>
			</tr>
			<tr>
				<td>Artist ID</td>
				<td><input type="text" name="input_artist_id"></td>
			</tr>
			<tr>
				<td>Detail ID</td>
				<td><input type="text" name="input_detail_id"></td>
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
	            String title = "", title_modified = "", link = "", gallery_id = "", artist_id = "", detail_id = "";
	            if (request.getParameter("input_title") != null)
	                title = request.getParameter("input_title");

	            if (request.getParameter("input_title") != null)
	                title_modified = request.getParameter("input_title_modified");

	            if (request.getParameter("input_link") != null)
	                link = request.getParameter("input_link");

	            if (request.getParameter("input_gallery_id") != null)
	                gallery_id = request.getParameter("input_gallery_id");

	            if (request.getParameter("input_artist_id") != null)
	                artist_id = request.getParameter("input_artist_id");

	            if (request.getParameter("input_detail_id") != null)
	                detail_id = request.getParameter("input_detail_id");

	            if (title_modified.length() != 0 || link.length() != 0 || gallery_id.length() != 0
	                    || artist_id.length() != 0 || detail_id.length() != 0) {
	                String query = "UPDATE image SET ";
	                int tmp=0;
	                if (!title_modified.equals("")){
	                    tmp++;
	                    query += "title=? ";
	                }
	                if (!link.equals("")){
	                    if(tmp>=1) query += ",link=? ";
	                    else query += "link=? ";
	                    tmp++;
	                }
	                if (!gallery_id.equals("")){
	                    if(tmp>=1) query += ",gallery_id=? ";
	                    else query += "gallery_id=? ";
	                    tmp++;
	                }
	                if (!artist_id.equals("")){
	                    if(tmp>=1) query += ",artist_id=? ";
	                    else query += "artist_id=? ";
	                    tmp++;
	                }
	                if (!detail_id.equals("")){
	                    if(tmp>=1) query += ",detail_id=? ";
	                    else query += "detail_id=? ";
	                    tmp++;
	                }

	                query += " where title like '%" + title + "%'";
	                System.out.println(query);
	                PreparedStatement ps = test_connection.prepareStatement(query);

	                // set the preparedstatement parameters
	                int count = 1;
	                if (!title_modified.equals("")) {
	                    ps.setString(count, title_modified);
	                    count++;
	                }
	                if (!link.equals("")) {
	                    ps.setString(count, link);
	                    count++;
	                }
	                if (!gallery_id.equals("")) {
	                    ps.setString(count, gallery_id);
	                    count++;
	                }
	                if (!artist_id.equals("")){
	                    ps.setString(count, artist_id);
	                    count++;
	                }
	                    

	                if (!detail_id.equals("")){
	                    ps.setString(count, detail_id);
	                    count++;
	                }

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