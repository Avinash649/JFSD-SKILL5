<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
   
String pwd = request.getParameter("password");
try {
	Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe",
		"jfsd","jfsd123");
System.out.println("Connected to database");
 Statement st = con.createStatement();

 String sql = "update user_skill5 set password = ? where username = ?";
 PreparedStatement pst = con.prepareStatement(sql);
  
    pst.setString(1, pwd);
    pst.setString(2, (String)session.getAttribute("user"));
	int c = pst.executeUpdate();
    if(c>0) {
		out.println("<h2>Password changed Successfull</h2>");
		out.println("<h2>Click <a href='log.jsp'>here</a></h2>");
    }else {
    	out.println("<h2>password changing Failed</h2>");
    	out.println("<h2>Click <a href='dash.jsp'>here</a></h2>");
    }
}catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
    }catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}


%>
</body>
</html>