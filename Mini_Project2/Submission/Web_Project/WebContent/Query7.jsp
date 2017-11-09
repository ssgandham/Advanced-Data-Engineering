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
Add an Image to the Gallery
	<form method="post" action="Query7.jsp">
		<table>
			<tr>
				<td>Enter the Title</td>
				<td><input type="text" name="input_title"></td>
			</tr>
			<tr>
				<td>Enter the Link</td>
				<td><input type="text" name="input_link"></td>
			</tr>
			<tr>
				<td>Enter the Gallery Id</td>
				<td><input type="text" name="input_gallery_id"></td>
			</tr>
			<tr>
				<td>Enter the Artist ID</td>
				<td><input type="text" name="input_artist_id"></td>
			</tr>
			<tr>
				<td>Enter the Detail ID</td>
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
	                "jdbc:mysql:///db_mini_project2?autoReconnect=true&useSSL=false", "gallery", "eecs118");

	        /* Connection test_connection=DriverManager
	        .getConnection("jdbc:mysql://localhost/feedback?"
	        + "user=root&password=root"); */
	        if (test_connection == null) {
	            System.out.println("Not successful");
	            out.println("Connection not successfull");
	        } else {
	            String title = "", link = "", gallery_id = "", artist_id = "", detail_id = "";
	            if (request.getParameter("input_title") != null)
	                title = request.getParameter("input_title");
	            if (request.getParameter("input_link") != null)
	                link = request.getParameter("input_link");
	            if (request.getParameter("input_gallery_id") != null)
	                gallery_id = request.getParameter("input_gallery_id");
	            if (request.getParameter("input_artist_id") != null)
	                artist_id = request.getParameter("input_artist_id");
	            if (request.getParameter("input_detail_id") != null)
	                detail_id = request.getParameter("input_detail_id");
	            if (title.length() != 0 || link.length() != 0 || gallery_id.length() != 0 || artist_id.length() != 0
	                    || detail_id.length() != 0) {
	                StringBuilder sb = new StringBuilder();
	                sb.append("insert into image (");
	                int tmp = 0;

	                if (!title.equals("")) {
	                    tmp++;
	                    sb.append("title");
	                }

	                if (!link.equals("")) {
	                    if (tmp >= 1) {
	                        sb.append("," + "link");
	                    } else
	                        sb.append("link");
	                    tmp++;
	                }


	                if (!gallery_id.equals("")) {
	                    if (tmp >= 1) {
	                        sb.append("," + "gallery_id");
	                    } else
	                        sb.append("gallery_id");
	                    tmp++;
	                }

	                if (!artist_id.equals("")) {
	                    if (tmp >= 1) {
	                        sb.append("," + "artist_id");
	                    } else
	                        sb.append("artist_id");
	                    tmp++;
	                }

	                if (!detail_id.equals("")) {
	                    if (tmp >= 1) {
	                        sb.append("," + "detail_id");
	                    } else
	                        sb.append("detail_id");
	                    tmp++;
	                }
	                sb.append(") values(");

	                for (int i = 0; i < tmp; i++) {
	                    if (i == tmp - 1)
	                        sb.append("?");
	                    else
	                        sb.append("?,");
	                }

	                sb.append(");");
	                System.out.println(sb.toString());

	                //String query = "insert into image (title,link,gallery_id,artist_id,detail_id) values(?,?,?,?,?);";
	                int count=1;
	                PreparedStatement preparedStmt = test_connection.prepareStatement(sb.toString());
	                if (request.getParameter("input_title") != null) {
	                    preparedStmt.setString(count, title);
	                    System.out.println("Title count:"+count);
	                    count++;
	                }
	                if (request.getParameter("input_link") != null) {
	                    preparedStmt.setString(count, link);
	                    System.out.println("Link count:"+count);
	                    count++;
	                }
	                if (request.getParameter("input_gallery_id") != null) {
	                    preparedStmt.setString(count, gallery_id);
	                    System.out.println("gallery count:"+count);
	                    count++;
	                }
	                
	                if (request.getParameter("input_artist_id") != null) {
	                    preparedStmt.setString(count, artist_id);
	                    System.out.println("Artist count:"+count);
	                    count++;
	                }
	                if (request.getParameter("input_detail_id") != null) {
	                    System.out.println("Detail count:"+count);
	                    preparedStmt.setString(count, detail_id);
	                    count++;
	                }
	                
	                preparedStmt.execute();
	                test_connection.close();
	                /* Statement select_artists = test_connection.createStatement();
	                ResultSet result_artist_name = select_artists.executeQuery(query); */
	                System.out.println(sb.toString());
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>
</body>
</html>