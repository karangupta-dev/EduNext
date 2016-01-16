package com.UploadContent;

import java.io.File;
import java.io.IOException;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;
import java.sql.*;

import javax.mail.Session;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 * Servlet implementation class UploadContent
 */
@WebServlet("/UploadContent")
public class UploadContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletFileUpload uploader = null;
	
	
	
	public void init() throws ServletException{
		DiskFileItemFactory fileFactory = new DiskFileItemFactory();
		File filesDir = (File) getServletContext().getAttribute("FILES_DIR_FILE");
		fileFactory.setRepository(filesDir);
		this.uploader = new ServletFileUpload(fileFactory);
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(!ServletFileUpload.isMultipartContent(request)){
			throw new ServletException("Content type is not multipart/form-data");
		}
	
		String email = request.getParameter("id");		
		
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.write("<html><head></head><body>");
		
		try {
				    
		
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin"); 
		    Statement st = con.createStatement();
		  
		    	    
			List<FileItem> fileItemsList = uploader.parseRequest(request);
			Iterator<FileItem> fileItemsIterator = fileItemsList.iterator();

			
		while(fileItemsIterator.hasNext())
			{
			FileItem fileItem = fileItemsIterator.next();

				System.out.println(""+fileItem.getString());
				System.out.println("FieldName="+fileItem.getFieldName());
				System.out.println("FileName="+fileItem.getName());
				System.out.println("ContentType="+fileItem.getContentType());
				System.out.println("Size in bytes="+fileItem.getSize());
				
				File file = new File(request.getServletContext().getAttribute("FILES_DIR")+File.separator+fileItem.getName());
				System.out.println("Absolute Path at server="+file.getAbsolutePath());
				fileItem.write(file);
				
			String path=file.getAbsolutePath();
			String fname=file.getName();
			String cname=fileItem.getString();
				int i=st.executeUpdate("insert into course(email_id,course_name,file_name,server_add)values('"+email+"','"+cname+"','"+fname+"','"+path+"')");
				
				if(i>0){
				response.sendRedirect("content.jsp?File Uploaded Successfully");
				}
			
			}
		} catch (FileUploadException e) {
			out.write(""+e/*"Exception in uploading file."*/);
	} catch (Exception e) {
			out.write(""+e/*"Exception in uploading file."*/);
		}
		out.write("</body></html>");
	}

	}


