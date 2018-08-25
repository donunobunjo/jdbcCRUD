<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Customer</title>
    </head>
    <body>
        <%
           String host = "jdbc:derby://localhost:1527/JDBCcrud";
           Connection conn = null;
           Statement stat= null;
           ResultSet res = null;
           PreparedStatement stmt = null;
           Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
           conn=DriverManager.getConnection(host,"sa","123456");
        %>
        <h1>Edit Customer</h1>
        <form method="POST" action="">
            <%
                stat = conn.createStatement();
                String cName = request.getParameter("cname");
                String data = "Select * from INFO where CUSTOMERNAME = '"+cName+"'";
                res = stat.executeQuery(data);
                while (res.next()){
            %>
            <table border="0">
                
                <tbody>
                    <tr>
                        <td>Customer name</td>
                        <td><input type="text" name="name" value='<%=res.getString("CUSTOMERNAME")%>' /></td>
                    </tr>
                    <tr>
                        <td>Customer Email</td>
                        <td><input type="email" name="email" value='<%=res.getString("EMAIL")%>' /></td>
                    </tr>
                    <tr>
                        <td>Customer City</td>
                        <td><input type="text" name="city" value='<%=res.getString("CITY")%>'/></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Update" /></td>
                    </tr>
                </tbody>
            </table>
            <%
                }
            %>
        </form>
        <a href="View.jsp">View Customer</a>
    </body>
</html>
<% 
    
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String city = request.getParameter("city");
    String query = "Update INFO set CUSTOMERNAME = ?, EMAIL = ?, CITY = ? where CUSTOMERNAME = '"+name+"'";
    stmt = conn.prepareStatement(query);
    stmt.setString(1, name);
    stmt.setString(2, email);
    stmt.setString(3, city);
    stmt.executeUpdate();
    //response.sendRedirect("View.jsp");
%>
