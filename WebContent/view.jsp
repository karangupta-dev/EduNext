<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*"
     import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%
String folderName=(String)session.getAttribute("email_id")+"/";
//System.out.print(fileName);
String filePath = "C:/Users/Karan/git/Edunext/EduNext/WebContent/FileUpload/"+folderName;    

    File file = new File(filePath);
    File[] files = file.listFiles();
    
    for(File f: files){
	//	out.println("<a href=\"View?fileName="+f.getName()+"\">View--> "+f.getName()+" </a><br>");
		//System.out.println("in loo"); 
	String a=f.getAbsolutePath();	 
	
	 %> 

<!-- 	 <p><img src="images/poster2 copy.jpg" /></p> 
 -->
 	 <p><img src="FileUpload/<%=folderName %><%=f.getName() %>" width=700px height=500px /></p> 
  	 	
<!-- //	out.println("<p><img src="+f+" width=700px height=500px></img></p>"); 
/* 	out.println("</body>"); 
	out.println("</html>"); 
 */--> <% 	System.out.println(a);
    }    
    %>
  

</body>
</html>