<%@ page import ="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head profile="http://gmpg.org/xfn/11">
<title>EduNext</title>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta http-equiv="imagetoolbar" content="no" />
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<link href="styles/popup.css" type="text/css"  rel="stylesheet">
<script type="text/javascript" src="scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" src="scripts/jquery.slidepanel.setup.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.min.js"></script>
<script type="text/javascript" src="scripts/jquery.cycle.setup.js"></script>

<script type="text/javascript">
<!--
    function toggle_visibility(id) {
       var e = document.getElementById(id);
       if(e.style.display == 'block')
          e.style.display = 'none';
       else
          e.style.display = 'block';
    }
//-->
</script>

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
    <h1>EduNext</h1>
      
 <%
    String id=request.getParameter("key");
      int t_id= Integer.parseInt(id);    
    int perm=0;
    String email="";
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin"); 
    Statement st = con.createStatement();
    
	ResultSet rs1 = st.executeQuery("select * from student where stud_id='"+id+"'");

	while (rs1.next())
	{
		perm=rs1.getInt(7);
	}
    
	
	if(perm==0 )
    {	
    		   response.sendRedirect("index.jsp?Your account is restricted");
    }	
	
	else if(perm==1)
    {
 	   out.print("<h3>Welcome</h3>"+" "+email+session.getAttribute("email_id"));
    	
    }
	else if(perm==2)
    {
    	int i = st.executeUpdate("update student set permission=1, status='Activated' where permission=2");

    	   ResultSet rs = st.executeQuery("select * from student where stud_id='"+id+"'");
    	     
    	   while(rs.next())
    	    {
    	  	email=rs.getString(2);
    	    }
    	   out.print("<h3>Welcome</h3>"+" "+email+session.getAttribute("email_id"));
    }
	
    else 
    {
    	
    }
    
    	%>
    </div>
    <div id="topnav">
      <ul>
        <li class="active"><a href="stud_profile.jsp?key=1">Home</a></li>
        <li><a href="feedback.jsp">Feedback</a></li>
        <li><a href="contact_us.jsp">Contact Us</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col3">
  <div id="container">
    <div id="content">
      <h1>Profile Page</h1>
    <br>
    <br>   
     <br>
       <br>
        <br>
         <br>
          <br>
           <br>
            <br>
            <br>
           <br>
            <br>
            <br>
           <br>
            <br>
            <br>
            <br>
    </div>
    <!-- ####################################################################################################### -->
    
    <div id="column">
      <div class="subnav">
        <h2>Account Settings</h2>
        <ul>
          <li><a href="changepwd.jsp">Change password</a></li>
        <!--<li><a href="join_course.jsp?id=<% out.print(session.getAttribute("email_id"));%>">Join Course</a></li>-->
          </ul>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
          <br>
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