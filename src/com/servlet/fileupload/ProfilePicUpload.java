package com.servlet.fileupload;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import java.util.*;

@WebServlet("/ProfilePicUpload")
public class ProfilePicUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletFileUpload uploader = null;
		
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
        HttpSession session=request.getSession(false);  
      String name=((String)session.getAttribute("email_id")+"/");
		PrintWriter out=response.getWriter();
		File file = null ; 
		int maxFileSize = 5000 * 1024; 
		int maxMemSize = 5000 * 1024; 
		String filePath = "C:/Users/karan Pc/git/EduNext/WebContent/FileUpload/"+name;    

		// Verify the content type 
		String contentType = request.getContentType(); 
		if ((contentType.indexOf("multipart/form-data") >= 0)) { 

		DiskFileItemFactory factory = new DiskFileItemFactory(); 
		
		// maximum size that will be stored in memory 
		factory.setSizeThreshold(maxMemSize); 
		
		// Location to save data that is larger than maxMemSize. 
		factory.setRepository(new File("c:\\temp")); 

		// Create a new file upload handler 
		ServletFileUpload upload = new ServletFileUpload(factory); 
		
		// maximum file size to be uploaded. 
		upload.setSizeMax( maxFileSize ); 
		
		try{ 
		
			// Parse the request to get file items. 
		List fileItems = upload.parseRequest(request); 

		// Process the uploaded file items 
		Iterator i = fileItems.iterator(); 

		out.println("<html>"); 
		out.println("<head>"); 
		out.println("<title>JSP File upload</title>"); 
		out.println("</head>"); 
		out.println("<body>"); 
		while ( i.hasNext () ) 
		{ 
		FileItem fi = (FileItem)i.next(); 
		if ( !fi.isFormField () )	
		{ 
		// Get the uploaded file parameters 
		String fieldName = fi.getFieldName(); 
		String fileName = fi.getName(); 
		boolean isInMemory = fi.isInMemory(); 
		long sizeInBytes = fi.getSize(); 
		// Write the file 
		if( fileName.lastIndexOf("\\") >= 0 )
		{ 
		file = new File( filePath + fileName.substring( fileName.lastIndexOf("\\"))) ; 
		}
		else
		{ 
		file = new File( filePath + 
		fileName.substring(fileName.lastIndexOf("\\")+1)) ; 
		} 
		fi.write( file ) ; 
		out.println("Actual address of file: " + filePath + fileName + "<br>"); 
		} 
		}   
		String v="view.jsp";
		out.println("<br><a href="+v+">View Pics Uploaded by you</a>");
		out.println("</body>"); 
		out.println("</html>"); 
		}catch(Exception ex) { 
		System.out.println(ex); 
		} 
		}else{ 
		out.println("<html>"); 
		out.println("<head>"); 
		out.println("<title>Servlet upload</title>"); 
		out.println("</head>"); 
		out.println("<body>"); 
		out.println("<p>No file uploaded</p>"); 
		out.println("</body>"); 
		out.println("</html>"); 
		} 		
	
	}
	
	}

