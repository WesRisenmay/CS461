<%-- 
    Document   : Maintanence
    Created on : Jul 22, 2013, 10:00:04 AM
    Author     : Wes
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Maintenance</title>
        
        <script language="JavaScript" src="ts_picker.js">
        //Script by Denis Gritcyuk: tspicker@yahoo.com
        //Submitted to JavaScript Kit (http://javascriptkit.com)
        //Visit http://javascriptkit.com for this script

        </script>
        
        <script language="JavaScript" src="UserStorage.js">
        </script>
        
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>

    </head>
    <body>   
        Weapon:
            <select id="selectWeapon" name="selectWeapon">
              <option>NONE</option>
            </select>
        <br>Preferred number of rounds to clean after: <input type="text" id="cleaningCount" /><br>
        
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
        
        <form name="CalcSize" action="">
            Entering cleaning date: <input type="text" id="timestamp"  name="timestamp" value="">
            <a href="javascript:show_calendar('document.CalcSize.timestamp', document.CalcSize.timestamp.value);">
            <img src="cal.gif" width="16" height="16" border="0"></a><br>        
        </form>
        
        <input type="submit" id="AddCleaningDate" value="AddCleaningDate" /><br>

        Weapons needing cleaned (list)
       
        
        <script>
            $("#AddCleaningDate").click(function() {
            var weaponName = $("#selectWeapon").val();
            var newDate = $("#timestamp").val();
            var preferredRounds = $("#cleaningCount").val();
            addCleaning(localStorage["currentUser"], weaponName, newDate, preferredRounds);
          });
        </script>
        
    </body>
</html>
