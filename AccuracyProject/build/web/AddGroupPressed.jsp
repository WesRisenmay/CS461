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
        
        <script language="JavaScript" src="GetStuffFromUrl.js">
        </script>
        <script language="JavaScript" src="CookieStuff.js">
        </script>
        <script language="JavaScript" src="UserStorage.js">
        </script>
        
        <script type="text/javascript">
            function whichWeapon(weapon, weaponAdded)
            {
                if(weapon === "NONE")
                {
                    return weaponAdded;
                }
                return weapon;
            }
            
            function calculateGroupSize(lengthFromOuterEdges, caliber, size, shots, date, distance, weapon)
            {
                var temp = {"size": 0.0};
                if(size === "")
                {
                    temp.size = lengthFromOuterEdges - caliber;
                }
                else{
                    temp.size = size;
                }
                temp.shots = shots;
                temp.date = date;
                temp.distance = distance;

                return temp;
            }
        </script>  
    </head>
    <body>
        <script type="text/javascript">
        var size = getValue("size");
        var lengthFromOuterEdges = getValue("lengthFromOuterEdges");
        var caliber = getValue("caliber");
        var shots = getValue("shots");
        var date = getValue("timestamp");
        var distance = getValue("distance");
        var weapon = getValue("selectWeapon");
        var weaponAdded = getValue("weaponAdded");
        weapon = whichWeapon(weapon, weaponAdded);
        
        var objectReturned = calculateGroupSize(lengthFromOuterEdges, caliber, size, shots, date, distance);
        document.write("Calculated group size was: " + objectReturned.size);
           
        var userName = localStorage["currentUser"];
        if(!doesWeaponExist(userName, weapon))
        {
            addWeapon(userName, weapon);
        }
        addGroup(userName, weapon, objectReturned);
        
        </script>
    </body>
</html>
