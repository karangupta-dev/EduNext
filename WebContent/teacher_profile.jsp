
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import ="java.sql.*" %>

     <%@ page import="java.util.*"
     import="java.io.*"%>

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
    
    
    System.out.print(t_id+"is the key recieved");
    
	ResultSet rs1 = st.executeQuery("select * from teacher where permission='"+id+"'");

	while (rs1.next())
	{
	
		System.out.println(perm+"Fetching permission");
		perm=rs1.getInt(7);
	}
    
	
	if(perm==0 )
    {	
		System.out.println(perm+"when perm is 0");
    		   response.sendRedirect("index.jsp?Your account is restricted");
    }	
	
	else if(perm==1)
    {
 	   out.print("<h3>Welcome</h3>"+" "+email+session.getAttribute("email_id"));
 	  System.out.println(perm+" when perm is 1");
    }
	else if(perm==2)
    {
    	int i = st.executeUpdate("update teacher set permission=1 , status='Activated' where permission=2");

    	   ResultSet rs = st.executeQuery("select * from teacher where teacher_id='"+id+"'");
    	     
    	   while(rs.next())
    	    {
    	  	email=rs.getString(2);
    	    }
    	   out.print("<h3>Welcome</h3>"+" "+email+session.getAttribute("email_id"));
    }
	
    else 
    {
    	
    }
    
    	
    	
   
    
   /* 
   {
	
	int i = st.executeUpdate("update teacher_reg set permission=1 where permission=0");

   ResultSet rs = st.executeQuery("select * from teacher_reg where teacher_id='"+id+"'");
     
   while(rs.next())
    {
  	email=rs.getString(2);
    }
   out.print("<h3>Welcome</h3>"+" "+email+session.getAttribute("email_id"));
   }
   */
    %>
      
    </div>
    <div id="topnav">
       <ul>
        <li class="active"><a href="teacher_profile.jsp">Home</a></li>
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
      
      <img class="imgl" src="images/demo/imgl.gif" alt="" width="125" height="125" />
      <p>This is the area where you can write about yourself.
      <p>This is the area where you can write about yourself.
      <p>This is the area where you can write about yourself.
     
    </div>
    <div id="column">
      <div class="subnav">
        <h2>Account Settings</h2>
         <ul>
          <li><a href="changepwd.jsp">Change password</a></li>
           <li><a href="ad.jsp">Post An Ad</a></li>
           <li><a href="#">View Students</a></li>
           <li><a href="UploadPic.jsp">Upload a Picture</a></li>
           </ul>
           <br>
           <br>
           <h2>Content Setting</h2>
           <ul>
           <li><a href="content_view.jsp">View Content</a></li>
          <li><a href="content.jsp?id=<% out.print(session.getAttribute("email_id"));%>">Provide Content</a></li>
          </ul>
          <br>
          <br>
          <h2>Test</h2>
          <ul>
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