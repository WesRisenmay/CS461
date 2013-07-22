<%-- 
    Document   : AddGroup
    Created on : Jul 10, 2013, 1:59:08 PM
    Author     : Wes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Accuracy Project Home Page</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <script language="JavaScript" src="ts_picker.js">
        //Script by Denis Gritcyuk: tspicker@yahoo.com
        //Submitted to JavaScript Kit (http://javascriptkit.com)
        //Visit http://javascriptkit.com for this script

        </script>
        <script language="JavaScript" src="UserStorage.js">
        </script>
    </head>
    <body>               
        <form name="CalcSize" action="AddGroupPressed.jsp">           
            Please fill out the following fields to add a group. <br>
            Date: <input type="text" name="timestamp" value="">
            <a href="javascript:show_calendar('document.CalcSize.timestamp', document.CalcSize.timestamp.value);">
            <img src="cal.gif" width="16" height="16" border="0"></a><br>
            
            Weapon Used:
            <select id="selectWeapon" name="selectWeapon">
              <option>NONE</option>
            </select>
            OR Add a new weapon <input type="text" name="weaponAdded" /><br>
            
            <script type="text/javascript">
                //populate the dropdown list
                var select = document.getElementById("selectWeapon"); 
                var options = getWeaponListNames(localStorage["currentUser"]); 

                for(var i = 0; i < options.length; i++) 
                {
                    var opt = options[i];
                    var el = document.createElement("option");
                    el.textContent = opt;
                    el.value = opt;
                    select.appendChild(el);
                }
                
            </script>
            
            Distance from target: <input type="text" name="distance" /><br>
            Number of shots in the group: <input type="text" name="shots" /><br>
            Group size: <input type="text" name="size" /><br>
          
            OR<br>
            
            Length from outer edges of the farthest two shots: <input type="text" name="lengthFromOuterEdges" /> <br>
            Caliber of the bullet, or diameter of the arrow: <input type="text" name="caliber" /><br>
            <input type="submit" value="Add Group" />
        </form>
    </body>
</html>
