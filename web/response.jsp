<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java1.java2" %>
<%@page import="java1.java3" %>
<%-- 
    Document   : response
    Created on : 29-Mar-2016, 14:03:14
    Author     : connor.steer
--%>
<sql:query var="testQuery" dataSource="jdbc/CalTest">
    SELECT * FROM event_details
    WHERE event_details.cat = ? <sql:param value="${param.subject_id}"/> 
    AND event_details.session = ? <sql:param value="${param.session_id}"/>
</sql:query> 

<c:set var="testDetails" value="${testQuery.rows[0]}"/>
<c:set var="testSumm" value="${testDetails.summary}"/>
<c:set var="testLoc" value="${testDetails.location}"/>
<c:set var="testDesc" value="${testDetails.description}"/>
<c:set var="testSt" value="${testDetails.dtstart}"/>
<c:set var="testEnd" value="${testDetails.dtend}"/>
<% java3 test = new java3(); 
                        test.calendar((String) pageContext.getAttribute("testSumm"),(String) pageContext.getAttribute("testLoc"),(String) pageContext.getAttribute("testDesc"),(String) pageContext.getAttribute("testSt"),(String) pageContext.getAttribute("testEnd")); %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${testDetails.summary}</title>
    </head>
    <body>
    <c:forEach items="${paramValues['subject_id']}" var="selectedValue">
    <li><c:out value="${selectedValue}" /></li>
    </c:forEach>
    
        <c:set var="rowCount" value="${testQuery.rowCount}"/>    
        <table border="0">
    <thead>
        <tr>
            <th colspan="2">{placeholder}</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <td><strong>Description: </strong></td>
            <td><span style="font-size:smaller; font-style:italic;">${testDetails.description}</span></td>
        </tr>
        <tr>
            <td><strong>Counselor: </strong></td>
            <td>{placeholder}
                <br>
                <span style="font-size:smaller; font-style:italic;">
                member since: ${testDetails.dtstart}</span>
            </td>
        </tr>
        <tr>
            <td><strong>Contact Details: </strong></td>
            <td><strong>email: </strong>
                <a href="mailto:{placeholder}">${testDetails.location}</a>
                <br><strong>phone: </strong>${testDetails.dtend}
            </td>
        </tr>
    </tbody>
</table>
<c:forEach items="${paramValues['subject_id']}" var="loopCat" varStatus="outer">
        <c:out value="${selectedValue}" /></li>
        <sql:query var="testQuery2" dataSource="jdbc/CalTest">
        SELECT * FROM event_details
        WHERE event_details.cat = ? <sql:param value="${loopCat}"/>
        AND event_details.session = ? <sql:param value="${param.session_id}"/>
        </sql:query>
        <c:set var="rowCount" value="${testQuery2.rowCount}"/> 
        <c:forEach var='i' begin='1' end="${rowCount-1}" varStatus="inner">
            <c:set var="testDetails" value="${testQuery2.rows[i]}"/>
            <c:set var="testSumm" value="${testDetails.summary}"/>           
            <c:set var="testLoc" value="${testDetails.location}"/> 
            <c:set var="testDesc" value="${testDetails.description}"/>
            <c:set var="testSt" value="${testDetails.dtstart}"/>
            <c:set var="testEnd" value="${testDetails.dtend}"/>
                        <% java3 test2 = new java3(); 
                        test2.event((String) pageContext.getAttribute("testSumm"),(String) pageContext.getAttribute("testLoc"),(String) pageContext.getAttribute("testDesc"),(String) pageContext.getAttribute("testSt"),(String) pageContext.getAttribute("testEnd")); %>
        </c:forEach>
    </c:forEach>   
    </body>
</html>
