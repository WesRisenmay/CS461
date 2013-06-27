<%-- 
    Document   : response
    Created on : Jun 25, 2013, 5:06:06 PM
    Author     : Wes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="groupInfo" scope="session" class="org.mypackage.group.Group" />
        <jsp:setProperty name="groupInfo" property="size" />
        <jsp:setProperty name="groupInfo" property="lengthFromOuterEdges" />
        <jsp:setProperty name="groupInfo" property="caliber" />
        <h2>Size entered was, <%= groupInfo.calculateGroupSize() %> !</h2>
    </body>
</html>
