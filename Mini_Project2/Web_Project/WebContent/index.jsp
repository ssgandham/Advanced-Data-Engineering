<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
<%@page import="java.net.*"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style>
/*  https://www.w3schools.com/css/tryit.asp?filename=trycss_forms*/
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
    width: 20%;
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
<div>
	<form method="post" action="results.jsp">
		<table>
			<tr>
				<td>Images by Type</td>
				<td><input type="text" name="image_type"></td>
			</tr>
			<br>
			<tr>
				<td>Images by given range of image creation</td>
				<td>From <input type="text" name="image_year_from">
				</td>

				<td>To <input type="text" name="image_year_to">
				</td>
			</tr>
			<br>
			<tr>
				<td>Images by Artist name</td>
				<td><input type="text" name="artist_name">
			</tr>
			<br>
			<tr>
				<td>Images By Location</td>
				<td><input type="text" name="image_location">
			</tr>
			<br>
			<tr>
				<td>Artist by Country</td>
				<td><input type="text" name="artist_country">
			</tr>
			<br>
			<tr>
				<td>Artist by Birth Year</td>
				<td><input type="text" name="artist_birth_year"></td>

			</tr>

			<tr>
				<td>Gallery Name</td>
				<td><input type="text" name="gallery_name"></td>

			</tr>

			<tr>
				<input type="submit" value="Query 1" name="submit">
					<input type="submit" value="Query 2" name="submit"> <input
					type="submit" value="Query 3" name="submit"> <input
					type="submit" value="Query 5" name="submit"> <input
					type="submit" value="Query 6" name="submit"> <input
					type="submit" value="Query7" name="submit"> <input
					type="submit" value="Query8" name="submit"> <input
					type="submit" value="Query9" name="submit"> <input
					type="submit" value="Query10" name="submit"> <input
					type="submit" value="Query 11" name="submit"> <input
					type="submit" value="Query 12" name="submit"> <input
					type="submit" value="Query 13" name="submit"> <input
					type="submit" value="Query 14" name="submit"> <input
					type="submit" value="Query 15" name="submit"> <input
					type="submit" value="Query 16" name="submit"> <input
					type="submit" value="Query 17" name="submit"> <input
					type="submit" value="Extra Credit A" name="submit"> <input
					type="submit" value="Extra Credit B" name="submit">
			</tr>
			<br>
			<tr>
				<td><input type="submit" value="submit" name="submit"></td>
			</tr>
			<br>
		</table>
	</form>


</div>

</body>
</html>