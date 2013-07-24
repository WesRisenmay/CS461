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
    </body>
</html>
