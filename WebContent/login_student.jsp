<%@ page import="java.sql.*" language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%
String email_id = request.getParameter("studname");    
String pwd = request.getParameter("studpass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin");
Statement st = con.createStatement();

ResultSet rs;
try{
	  rs = st.executeQuery("select * from student where email_id='" + email_id + "' and pwd='" + pwd + "' and permission=1");
	    if (rs.next())
	    {
	    	session.setAttribute("email_id", email_id);
	        response.sendRedirect("stud_profile.jsp?key=1");
	    } else 
	    {
	    	response.sendRedirect("index.jsp?You dont have access rights");
	    }
}
catch(Exception e){
e.printStackTrace();
}


%>



</body>
</html>