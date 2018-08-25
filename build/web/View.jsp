<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Information</title>
    </head>
    <body>
        <h1>Customer Details</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Email</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>

                <%
                    String host = "jdbc:derby://localhost:1527/JDBCcrud";
                    Connection conn = null;
                    Class.forName("org.apache.derby.jdbc.ClientDriver");
                    conn=DriverManager.getConnection(host,"sa","123456");
                    Statement stmt = conn.createStatement();
                    String data = "Select * from INFO";
                    ResultSet res = stmt.executeQuery(data);
                    
                 while(res.next()){
                %>
               <tr>
                    <td><%=res.getString("CUSTOMERNAME")%></td>
                    <td><%=res.getString("EMAIL")%></td>
                    <td><%=res.getString("CITY")%></td>
                    <td><a href='Edit.jsp?cname=<%=res.getString("CUSTOMERNAME")%>'>Edit</a>&nbsp;&nbsp;&nbsp;<a href='Delete.jsp?cname=<%=res.getString("CUSTOMERNAME")%>'>Delete</a></td>
               </tr>
                <%
                    }
                 %>
            </tbody>
            <a href="NewCustomer.jsp">New Customer</a>
    </body>
</html>
