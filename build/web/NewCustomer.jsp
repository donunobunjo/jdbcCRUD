<%-- 
    Document   : NewCustomer
    Created on : Aug 14, 2018, 2:55:03 PM
    Author     : Aduwu
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Customer</title>
    </head>
    <body>
        <form action="Insert.jsp" method="POST">
            <table border="0">
               
                <tbody>
                    <tr>
                        <td>Customer Name</td>
                        <td><input type="text" name="name" value="" /></td>
                    </tr>
                    <tr>
                        <td>Email</td>
                        <td><input type="email" name="email" value="" /></td>
                    </tr>
                    <tr>
                        <td>City</td>
                        <td><input type="text" name="city" value="" /></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td><input type="submit" value="Submit" /><input type="reset" value="Cancel" /></td>
                    </tr>
                </tbody>
            </table>

        </form>
    </body>
</html>
