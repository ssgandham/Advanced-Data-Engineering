<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="java.io.*"%>

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
	
	<form method="post" action="results.jsp">
		<table>
			<tr>
				<td>Images by Type</td>
				<td><input type="text" name="image_type"></td>
			</tr>
			<br>
			<tr>
				<td>Images by given range of image creation</td>
				<td><input type="text" name="image_year">
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
				<td><input type="text" name="artist_birth_year">
			</tr>
			<br>
			<tr>
				<td><input type="submit" value="submit">
			</tr>
			<br>
		</table>
	</form>




</body>
</html>