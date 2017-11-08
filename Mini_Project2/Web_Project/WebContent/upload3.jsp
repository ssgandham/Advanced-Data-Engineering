<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	    //Refereces
	    // https://stackoverflow.com/questions/13411827/how-to-upload-file-to-folder-on-server-in-jsp
	%>


	<%
	    String session_username = (String) session.getAttribute("User");
	    File file;
	    int file_size_max = 5000000 * 1024;
	    int memory_size_max = 5000000 * 1024;
	    ServletContext servlet_context = pageContext.getServletContext();
	    String path_file = servlet_context.getInitParameter("file-upload");

	    // Verify the content type
	    String contentType = request.getContentType();
	    if ((contentType.indexOf("multipart/form-data") >= 0)) {

	        DiskFileItemFactory factory = new DiskFileItemFactory();
	        // maximum size that will be stored in memory
	        factory.setSizeThreshold(memory_size_max);
	        // Location to save data that is larger than maxMemSize.
	        factory.setRepository(new File("Mini_Project2/Web_Project/image"));

	        // Create a new file upload handler
	        ServletFileUpload upload = new ServletFileUpload(factory);
	        // maximum file size to be uploaded.
	        upload.setSizeMax(file_size_max);
	        try {
	            // Parse the request to get file items.
	            List<FileItem> fileItems = upload.parseRequest(request);

	            // Process the uploaded file items
	            Iterator i = fileItems.iterator();

	            while (i.hasNext()) {
	                FileItem fi = (FileItem) i.next();
	                if (!fi.isFormField()) {
	                    // Get the uploaded file parameters
	                    String fieldName = fi.getFieldName();
	                    String fileName = fi.getName();
	                    boolean isInMemory = fi.isInMemory();
	                    long sizeInBytes = fi.getSize();
	                    // Write the file
	                    if (fileName.lastIndexOf("/") >= 0) {
	                        file = new File(path_file + fileName.substring(fileName.lastIndexOf("/")));
	                    } else {
	                        file = new File(path_file +"/image"+fileName.substring(fileName.lastIndexOf("/") + 1));
	                        System.out.println("File : " + file);
	                    }
	                    fi.write(file);

	                    request.setAttribute("Success", "Successfully Uploaded");
	                    RequestDispatcher rd = request.getRequestDispatcher("/upload3.jsp");
	                    rd.forward(request, response);
	                }
	            }

	        } catch (Exception ex) {
	            System.out.println(ex);
	        }
	    } else {
	        request.setAttribute("Error", "Error!!");
	        RequestDispatcher rd = request.getRequestDispatcher("/upload3.jsp");
	        rd.forward(request, response);
	    }
	%>
</body>
</html>