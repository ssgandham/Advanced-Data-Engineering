<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<form method="post">
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
	<%
	    if (request.getParameter("image_type") != null)
	        image_type = request.getParameter("image_type");

	    if (request.getParameter("image_year") != null)
	        image_year = request.getParameter("iamge_year");

	    if (request.getParameter("artist_name") != null)
	        artist_name = request.getParameter("artist_name");

	    if (request.getParameter("image_location") != null)
	        image_location = request.getParameter("image_location");

	    if (request.getParameter("artist_country") != null)
	        artist_country = request.getParameter("artist_country");

	    if (request.getParameter("artist_birth_year") != null)
	        artist_birth_year = request.getParameter("artist_birth_year");
	%>
</body>
</html>