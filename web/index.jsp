<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java1.java1" %>
<%@page import="java1.java2" %>

<%-- 
    Document   : index
    Created on : 21-Mar-2016, 16:31:03
    Author     : connor.steer
--%>
<sql:query var="catdrop" dataSource="jdbc/CalTest">
    SELECT DISTINCT cat FROM event_set
</sql:query>
    
    


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>IFPWAFCAD Homepage.</title>
        <link rel="stylesheet" type="text/css" href="style.css">
    </head>
    <body>
    <h2>Welcome to <strong>IFPWAFCAD</strong>, the International Former
        Professional Wrestlers' Association for Counseling and Development!
    </h2>
    <% java2 test = new java2(); test.main(); %>
        
    <table border="0">
        <thead>
            <tr>
                <th>IFPWAFCAD offers expert counseling in a wide range of fields.</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>To view the contact details of an IFPWAFCAD certified former
                    professional wrestler in your area, select a subject below:</td>
            </tr>
            <tr>
                <td>
                    <form action="mscal.ics">
                        <strong>Select a subject:</strong>
                        <select name="catfor" multiple="multiple">
                            <c:forEach var="row" items="${catdrop.rowsByIndex}">
                                <c:forEach var="column" items="${row}">
                                    <option value="<c:out value="${column}"/>"><c:out value="${column}"/></option>
                                </c:forEach>
                            </c:forEach>
                        </select>
                        <input type="submit" value="submit"/>
                        
                    </form>
                </td>
            </tr>
        </tbody>
    </table>
</body>
</html>


