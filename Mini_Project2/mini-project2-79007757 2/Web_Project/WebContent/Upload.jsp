<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
    <%@ page import="javax.servlet.http.*" %>
    <%@ page import="org.apache.commons.fileupload.*" %>
    <%@ page import="org.apache.commons.fileupload.disk.*" %>
    <%@ page import="org.apache.commons.fileupload.servlet.*" %>
    <%@ page import="org.apache.commons.io.output.*" %>
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

<% //Refereces
// https://stackoverflow.com/questions/13411827/how-to-upload-file-to-folder-on-server-in-jsp
%>

  <form role="form" action="upload3.jsp" method="post"enctype="multipart/form-data">
    <div class="btn btn-success btn-file">
    <i class="fa fa-cloud-upload"></i>
             Upload the file<br><br>
    <input type="file" name="file" /><br><br>
    </div>
    <button type="submit" value="submit" name='submit'>submit</button>
    </form>
    
    
</body>
</html>