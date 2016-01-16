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
      <p>Your True Education Partner</p>
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
  <%
  String loc = request.getParameter("jc_location");    
  String phn = request.getParameter("jc_phn");
  String id=request.getParameter("id");
  
  Class.forName("com.mysql.jdbc.Driver");
  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin");
 
  Statement st = con.createStatement();
  ResultSet rs1,rs2,rs3;
  
  rs1= st.executeQuery("select * from teacher where phone='"+phn+"'");
rs2=st.executeQuery("select * from student where email_id='"+id+"'");
  
  //int i = st.executeUpdate("insert into ");
  
  
  
  
  
  %>

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