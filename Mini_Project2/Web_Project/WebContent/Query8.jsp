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
	<form method="post" action="Query8.jsp">
		<table>
			<tr>
				<td>Enter the Image IDe</td>
				<td><input type="text" name="input_image_id"></td>
			</tr>
			<tr>
				<td>Enter the Image Name</td>
				<td><input type="text" name="input_image_name"></td>
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
	            String image_id = "", title = "";
	            int tmp=0;
	            if (request.getParameter("input_image_id") != null){
	                image_id = request.getParameter("input_image_id");
	                tmp++;
	            }

	            if (request.getParameter("input_image_name") != null){
	                title = request.getParameter("input_image_name");
	                tmp++;
	            }

	            if (!image_id.equals("") || !title.equals("")) {
	                String query = "delete from image";
	                
	                /* if (!image_id.equals("")){
	                    tmp++;
	                    query += " image_id=? ";
	                }
	                if (!title.equals("")){
	                    if(tmp>=1) query += ",title=? ";
	                    else query += " title=?";
	                    tmp++;
	                } */
	                query+=" where ";
	                if(!image_id.equals("")) query+="image_id=?";
	                if(!title.equals("")) {
	                    if(tmp<1) query+="title=?;";
	                    else query+=" or title=?;";
	                }else query+=";";
	                System.out.println(query);
	                //String query = "delete from image where image_id = ? or title=?";
	                PreparedStatement preparedStmt = test_connection.prepareStatement(query);
	                
	                int count=1;
	               if(!image_id.equals("")) {
	                   preparedStmt.setInt(count, Integer.parseInt(image_id));
	                   count++;
	               }
	                if(!title.equals("")){
	                    preparedStmt.setString(count, title);
	                    count++;
	                }
					
	                // execute the preparedstatement
	                preparedStmt.execute();

	                test_connection.close();
	            }
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>

</body>
</html>