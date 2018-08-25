<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String host = "jdbc:derby://localhost:1527/JDBCcrud";
    String cName = request.getParameter("cname");
    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
    Connection conn=DriverManager.getConnection(host,"sa","123456");
    Statement stat = conn.createStatement();
    String query = "Delete from INFO where CUSTOMERNAME = '"+cName+"'"; 
    //response.sendRedirect("View.jsp");
%><a href="View.jsp">View Customers</a>