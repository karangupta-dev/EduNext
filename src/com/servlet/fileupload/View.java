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


@WebServlet("/View")
public class View extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession(false);
		  String name=((String)session.getAttribute("name")+"/");
		  String filePath = "D:/FileUpload/"+name;    

		
		String fileName = request.getParameter("fileName");
		if(fileName == null || fileName.equals("")){
			throw new ServletException("File Name can't be null or empty");
		}
		/*File file = new File(filePath+File.separator+fileName);*/
		File file = new File(filePath+fileName);
		if(!file.exists()){
			throw new ServletException("File doesn't exists on server.");
		}else
		{
		System.out.println("File location on server::"+file.getAbsolutePath());
		out.println("<html>"); 
		out.println("<head>"); 
		out.println("<title>Servlet upload</title>"); 
		out.println("</head>"); 
		out.println("<body>"); 
		out.println("<p><img src="+file+" width=700px height=500px></img></p>"); 
		out.println("</body>"); 
		out.println("</html>"); 
	}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
