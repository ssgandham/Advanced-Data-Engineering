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
Delete an image from Gallery
	<form method="post" action="Query8.jsp">
		<table>
			<tr>
				<td>Enter the Image ID</td>
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
	            int tmp = 0;
	            if (request.getParameter("input_image_id") != null) {
	                image_id = request.getParameter("input_image_id");
	                tmp++;
	            }

	            if (request.getParameter("input_image_name") != null) {
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
	                query += " where ";
	                if (!image_id.equals(""))
	                    query += "image_id=?";
	                if (!title.equals("")) {
	                    if (tmp < 1)
	                        query += "title=?;";
	                    else
	                        query += " or title=?;";
	                } else
	                    query += ";";
	                System.out.println(query);
	                //String query = "delete from image where image_id = ? or title=?";
	                PreparedStatement preparedStmt = test_connection.prepareStatement(query);

	                int count = 1;
	                if (!image_id.equals("")) {
	                    preparedStmt.setInt(count, Integer.parseInt(image_id));
	                    count++;
	                }
	                if (!title.equals("")) {
	                    preparedStmt.setString(count, title);
	                    count++;
	                }

	                // DELETING TEH DETAILS OF THE IMAGE
	                Statement select_detail_id = test_connection.createStatement();
	                String query_detail_id =
	                        "select * from image where image_id = " + Integer.parseInt(image_id) + "";
	                ResultSet result_detail_id = select_detail_id.executeQuery(query_detail_id);
	                while (result_detail_id.next()) {
	                    Integer detail_id = result_detail_id.getInt("detail_id");
	                    System.out.println("details id : " + detail_id);
	                    String delete_query = "delete from detail where detail_id = ?";
	                    PreparedStatement preparedStmt_detail_id = test_connection.prepareStatement(delete_query);
	                    preparedStmt_detail_id.setInt(1, detail_id);
	                    preparedStmt_detail_id.execute();

	                }
	                // execute the preparedstatement
		            preparedStmt.execute();
	            }
	           
	            test_connection.close();
	        }
	    } catch (Exception e) {
	        System.out.println("Went inside exception");
	        System.out.println(e.getMessage());
	    }
	%>

</body>
</html>