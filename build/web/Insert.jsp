<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Success!!!</title>
    </head>
    <body>
        <h1>Your Data has been submitted successfully</h1>
        <a href="NewCustomer.jsp">Add New Customer</a>
    </body>
</html>
<%
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String host = "jdbc:derby://localhost:1527/JDBCcrud";
    Connection conn = null;
    PreparedStatement stmt = null;
    Class.forName("org.apache.derby.jdbc.ClientDriver");
    conn=DriverManager.getConnection(host,"sa","123456");
    String data ="insert into INFO(CUSTOMERNAME,EMAIL,CITY)values(?,?,?)";
    stmt = conn.prepareStatement(data);
    stmt.setString(1, name);
    stmt.setString(2, email);
   stmt.setString(3, city);
   stmt.executeUpdate();
   response.sendRedirect("View.jsp");
%>
