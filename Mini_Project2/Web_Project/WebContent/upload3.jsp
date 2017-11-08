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
	ServletContext servlet_context = pageContext.getServletContext();
	String path_file = servlet_context.getInitParameter("file-upload");	
	    
	    int file_size_max = 6000000 * 1024;
	    File file;
	    int memory_size_max = 6000000 * 1024;
	    
	    

	    // The content type is verified
	    String type_content = request.getContentType();
	    if ((type_content.indexOf("multipart/form-data") >= 0)) {

	        DiskFileItemFactory instance_factory = new DiskFileItemFactory();
	        // Maximum size which can be stored
	        instance_factory.setSizeThreshold(memory_size_max);
	        // The location where the data has to be stored
	        instance_factory.setRepository(new File("Mini_Project2/Web_Project/image"));

	        // A new instance for upload is created
	        ServletFileUpload instance_upload = new ServletFileUpload(instance_factory);
	        // teh limit is set for the maximum file size upload
	        instance_upload.setSizeMax(file_size_max);
	        try {
	            // The request is parsed to get the list of items
	            List<FileItem> list_items_file = instance_upload.parseRequest(request);

	            // Upload file items is processed
	            Iterator iterate = list_items_file.iterator();

	            while (iterate.hasNext()) {
	                FileItem item_file = (FileItem) iterate.next();
	                if (!item_file.isFormField()) {
	                    // The file parameters are fetched
	                    String str_fieldName = item_file.getFieldName();
	                    String str_file_name = item_file.getName();
	                    boolean bool_isInMemory = item_file.isInMemory();
	                    long file_size_i_bytes = item_file.getSize();
	                    // the data is written to the file
	                    if (str_file_name.lastIndexOf("/") >= 0) {
	                        file = new File(path_file + str_file_name.substring(str_file_name.lastIndexOf("/")));
	                    } else {
	                        file = new File(path_file +"/image"+str_file_name.substring(str_file_name.lastIndexOf("/") + 1));
	                        System.out.println("File : " + file);
	                    }
	                    item_file.write(file);

	                    request.setAttribute("Success", "The file is uploaded successfully");
	                    RequestDispatcher dispatcher_rd = request.getRequestDispatcher("/upload3.jsp");
	                    dispatcher_rd.forward(request, response);
	                }
	            }

	        } catch (Exception except) {
	            System.out.println(except);
	        }
	    } else {
	        request.setAttribute("Error", "Error while Uploading the file");
	        RequestDispatcher rd = request.getRequestDispatcher("/upload3.jsp");
	        rd.forward(request, response);
	    }
	%>
</body>
</html>