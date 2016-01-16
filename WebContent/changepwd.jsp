<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import ="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>EduNext-Change Password</title>
<link rel="stylesheet" href="styles/layout.css" type="text/css" />
<script type="text/javascript" src="scripts/alertbox.js"></script>

</head>
<body>
 <% 
String email_id=request.getParameter("email_id");
	String prevpwd = request.getParameter("prevpwd");
    String newpwd = request.getParameter("newpwd");
    String repwd = request.getParameter("repwd");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/EduNext","root","admin");
    Statement st = con.createStatement();
    
    ResultSet rs;
    try{
    	  rs = st.executeQuery("select * from teacher where email_id='"+ email_id + "' and pwd='" + prevpwd + "'");
    	    if (rs.next())
    	    {
    	       if(repwd.equals(newpwd)) 
    	       {
    	    	    
    	    	   int i = st.executeUpdate("update teacher set pwd ='"+newpwd+"' where email_id='" + session.getAttribute("email_id") + "'");
    	    //	   out.print("Password changed Successfully!!"+"<a href='teacher_profile.jsp'>proceed to profile</a>");
    	    	   //response.sendRedirect("pro.jsp");
    	       }
    	    }
    //	    else 
    	//    {
    	  //      out.println("Invalid password <a href='index.jsp'>try again</a>");
    	    //}
    	}
    	    finally
    		  {
      			}
    
   %>   
   <div class="wrapper col1">
  <div id="header">
    <div id="logo">
      <h1><a href=".jsp">EduNext</a></h1>
      <p>Your True Education Partner</p>
    </div>
    <div id="topnav">
      <ul>
        <li><a href="teacher_profile.jsp?key=1">Home</a></li>
         <li class="active"><a href="changepwd.jsp">Change Password</a></li>
        <li ><a href="contact_us.jsp">Contact Us</a></li>
      </ul>
    </div>
    <br class="clear" />
  </div>
</div>
<!-- ####################################################################################################### -->
<div class="wrapper col6">
  <div id="container">
  
  <br><br><br><br><br><br>
  <table width="100%" cellpadding="0" align="center" cellspacing="1" >
         
         <tr align="center" valign="middle" > 
		<td height="9" colspan="3" size="10">Kindly enter the neccessary details</td>
			</tr>
     <form action="changepwd.jsp" method="post" onsubmit="pwdchange();">
     <tr>
     <td align="right"> Email_id</td><td> <input type="text" name="email_id"   required ></td>
     </tr> 
      <tr>
      <td align="right">Previous Password:</td><td> <input type="password" name="prevpwd"   required ></td>
      </tr>
      <tr>
      <td align="right">New Password:</td><td> <input type="password" name="newpwd"  /></td>
      </tr>
      <tr>
      <td align="right">Re-Enter</td><td> <input type="password" name="repwd"  /></td>
      </tr>
      <tr>
      <td colspan="2" align="center"><input type="submit" name="pwdsubmit" id="pwdsubmit" value="submit" /></td>
		</tr>   
   </form>
</table>
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