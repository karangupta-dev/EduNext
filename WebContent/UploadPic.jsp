<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="ProfilePicUpload" method="post" enctype="multipart/form-data">
Upload a pic:<input type="file" name=myFile>
<input type="submit">

</form>
<br>
<br>
<a href="view.jsp">View pics uploaded earlier</a>
<%=session.getAttribute("email_id") %>
</body>
</html>