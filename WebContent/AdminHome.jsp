<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link href="styles/popup.css" type="text/css"  rel="stylesheet">
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EduNext-Admin</title>
</head>
<body>
<%

String id = request.getParameter("adminid");    
String pwd = request.getParameter("adminpass");

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/edunext","root","admin");

Statement st = con.createStatement();

ResultSet rs;
try{
	  rs = st.executeQuery("select * from admin where adminid='" + id + "' and adminpass='" + pwd + "'");
	    
		if (rs.next())
		{

	    session.setAttribute("adminid", id);
	    response.sendRedirect("AdminHome.jsp");
		}
	/*	if(!rs.next()) 
		{

		out.println("Invalid Username and Password!!!   Try Again");
		response.sendRedirect("AdminPage.jsp");
		
		}*/
}

catch(Exception e){
e.printStackTrace();
}


%>
<div class="wrapper col0">
  <div id="topbar">
    <div id="loginpanel">
      <ul>
        <li class="left">Click Here &raquo;</li>
        <li class="right" ><a href="sign_out.jsp">Sign Out</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col1">
  <div id="header">
    <div id="logo">
    <h1>EduNext</h1>
      <h3>Welcome <%=session.getAttribute("adminid")%></h3>
    </div>
    <div id="topnav">
      <ul>
        <li class="active"><a href="AdminHome.jsp">Home</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
  
      <h2>User's Query</h2>
     <table border="2" width="100%">
                <caption><b>Query</b></caption>
                <br>
                <tr>
                	<th>S.No.</th>
     	            <th>First Name</th>
     	            <th>Last Name</th>
                    <th>Email id</th>
                    <th>Contact No.</th>
                    <th>Query</th>
                    <th><u>Remove</u></th>
                 </tr>
   
              <%
              Class.forName("com.mysql.jdbc.Driver");
              Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/edunext","root","admin");

              Statement st2 = con2.createStatement();
              Statement st3 = con2.createStatement();

              ResultSet rs2;
              
              //int i = st2.executeUpdate(" delete  from contact where fname is NULL ");

              	rs2 = st3.executeQuery("select * from contact where fname is NOT NULL");
              

              while(rs2.next())
              {            	  
              %>
           			
                    <tr>
                       <td><% out.println(rs2.getString(1));%></td>
                       <td><% out.println(rs2.getString(2));%></td>
                       <td><% out.println(rs2.getString(3));%></td>
                       <td><% out.println(rs2.getString(4));%></td>
                       <td><% out.println(rs2.getString(5));%></td>
                     	<td><% out.println(rs2.getString(6));%></td>
                     	<td><a href ="edit_contact.jsp?c_id=<%=rs2.getString(1) %>">Remove</a></td>             
                    </tr>
          		
          
               <%     
               }
              %>
                </table>
      </div>
<!-- ####################################################################################################### -->

    <div id="column">
      <div class="subnav">
        <h2>General Settings</h2>
         <ul>
          <li><a href="manage_teachers.jsp">Manage Teachers</a></li>
          <li><a href="manage_students.jsp">Manage Students</a></li>
          <li><a href="manage_feedback.jsp">Manage Feedbacks</a></li>
           <li><a href="#">Notifications</a></li>
           </ul>
           <br>
           <br>
           <ul><h2>Announcements</h2>
          <li><a href="#">Discussion Board</a></li>
          <li><a href="#">Public announcement</a></li>
          </ul>
          <br>
          <br>
          <ul><h2>Test</h2>
          <li><a href="#">Conduct Test</a></li>
          <li><a href="#">View Result</a>
          </ul>    
        
      </div>
      <div class="holder">
        <h2>Courses offered:</h2>
        <p>Click on Link to view content:</p>
        <ul>
          <li>Academic Coaching</li>
          <li>Cooking</li>
          <li>Dance and Aerobics</li>
          <li>Textile Designing</li>
          <li>Advance Computer Training</li>
        </ul>
      </div>
    </div>
    <div class="clear"></div>
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - EduNext</p>
    <br class="clear" />
  </div>
</div>
</body>
</html>