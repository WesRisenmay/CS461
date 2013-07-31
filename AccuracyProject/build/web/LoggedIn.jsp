<%-- 
    Document   : LoggedIn
    Created on : Jul 10, 2013, 1:59:40 PM
    Author     : Wes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logged In</title>
        
        <script language="JavaScript" src="GetStuffFromUrl.js">
        </script>
        
        <script language="JavaScript" src="CookieStuff.js">
        </script>
        
        <script language="JavaScript" src="UserStorage.js">
        </script>
        <script language="javascript" type="text/javascript" src="jquery.min.js"></script>
        <script language="javascript" type="text/javascript" src="jquery.jqplot.min.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery.jqplot.css" />

    </head>
    <body>
        <script type="text/javascript">  
            var userName = getValue("userName");
            localStorage["currentUser"] = userName;

            if(localStorage.getItem("UserDatabase") === null)
            {
                createDatabaseWithFirstUser(userName);      
            }
            else
            {
                if(!doesUserNameExist(userName))
                {
                    addUser(userName);
                }
            }
        </script>
        
        <form name="AddGroup" action="AddGroup.jsp">                     
            <input type="submit" value="Add Group" />
        </form>
        
        <form name="WeaponMaintenance" action="Maintenance.jsp">                     
            <input type="submit" value="WeaponMaintenance" />
        </form>
        
        <div id="chartdiv" style="height:400px;width:300px; "></div>
        
        <script>
            //$.jqplot('chartdiv',  [[[1, 2],[3,5.12],[5,13.1],[7,33.6],[9,85.9],[11,219.9]]]);
            //document.write(plotGroups(localStorage["currentUser"], ".243"));
            $.jqplot('chartdiv',  [plotGroups(localStorage["currentUser"], ".243")]);
            
        </script>
    </body>
</html>
