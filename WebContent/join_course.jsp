<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EduNext-Join Course</title>
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/alertbox.js"></script>

</head>
<body>
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
      <h1><a href="index.jsp">EduNext</a></h1>
      <% out.print("<h3>Welcome</h3>"+" "+session.getAttribute("email_id"));%>
    </div>
    <div id="topnav">
      <ul>
        <li><a href="stud_profile.jsp?key=1">Home</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="container">
  
   <form action="join_course.jsp" method="post">
  Enter the preferred location:
   <input type="text" name=cloc> &nbsp; and course: <input type="text" name=cname>
  <input type="submit" value="Submit">
  </form>
  
   <%
  String uloc = request.getParameter("cloc");    
  String ucourse = request.getParameter("cname");

  
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin");
 
  Statement st = con.createStatement();
  ResultSet rs;
  rs = st.executeQuery("select * from search where location='" + uloc + "' AND cname='" + ucourse + "'");
  //out.println(rs.getString("cname"));
 /* if(rs.next())
  {
	  
	  out.println("The record is filled");
  }
  */
  %>   
     <center>
            <table  width="100%">
                <caption><b>Search Results</b></caption>
                <br>
                <br>
                <tr>
                   
                    <th>Course</th>
                   <th>Location</th>
                    <th>Contact Person</th>
                    <th>Phone</th>
                    <th>Duration</th>
                    <th>Fees</th>
                    
                    
                </tr>
   
              <%
              while(rs.next())
              {            	  
              %>
            
                    <tr>
                       <td align="center"><% out.println(rs.getString(1));%></td>
                       <td align="center"><% out.println(rs.getString(3));%></td>
                       <td align="center"><% out.println(rs.getString(2));%></td>
                       <td align="center"><% out.println(rs.getString(4));%></td>
                       <td align="center"><% out.println(rs.getString(5));%></td>                                     
                       <td align="center"><% out.println(rs.getString(6));%></td>       
                        
                    </tr>
          		
          
               <%     
               }
              %>
                
            </table>
    </center>
    <br>
 <form method=post action=join_course2.jsp?id=<% out.print(session.getAttribute("email_id"));%>>
    Enter the course name    
    <input type="text" name=jc_location> &nbsp; and Phone no of teacher:  <input type="text" name=jc_phn>
   <input type="submit" value="Join">
    </form>
 
  </div>
  </div>

<!-- ####################################################################################################### -->
<div class="wrapper col5">
  <div id="copyright">
    <p class="fl_left">Copyright &copy; 2014 - All Rights Reserved - EduNext</p>
    <p class="fl_right">Powered by <a href="http://www.issac.meximas.com/" >Issac Meximas</a></p>
    <br class="clear" />
  </div>
</div>
</body>
</html>