<!-- Copyright © 2013 Wesley Risenmay-->
<!-- [This program is licensed under the GNU GPL]-->
<!-- Please see the file LICENSE in the source-->
<!-- distribution of this software for license terms.-->
<!-- Repo: https://github.com/WesRisenmay/CS461-->
<!-- Contact: wrr@pdx.edu-->

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
        <script src="http://code.jquery.com/jquery-1.10.1.min.js"></script>
        <script src="http://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
        
        <style>
            div {
                border-style: solid;
                border-width: medium;
                border-color: activeborder;
            }
        </style>
    </head>
    <body>                       
            Please fill out the following fields to add a group. <br>
            <div>
                <form name="CalcSize" action="">
                    Date: <input type="text" id="timestamp" value="">
                    <a href="javascript:show_calendar('document.CalcSize.timestamp', document.CalcSize.timestamp.value);">
                    <img src="cal.gif" width="16" height="16" border="0"></a><br>
                </form>

                Weapon Used:
                <select id="selectWeapon">
                  <option>NONE</option>
                </select>
                OR Add a new weapon <input type="text" id="weaponAdded" /><br>

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

                Distance from target: <input type="text" id="distance" /><br>
                Number of shots in the group: <input type="text" id="shots" /><br>
            </div>
            Group size: <input type="text" id="size" /><br>
          
            OR<br>
            
            Length from outer edges of the farthest two shots: <input type="text" id="lengthFromOuterEdges" /> <br>
            Caliber of the bullet, or diameter of the arrow: <input type="text" id="caliber" /><br>
            <input type="submit" id="AddGroup" value="AddGroup" />
       
        
        <script>
            $("#AddGroup").attr('disabled','disabled');
            
            $("#size").on("change keyup blur", validateData);
            $("#lengthFromOuterEdges").on("change keyup blur", validateData);
            $("#caliber").on("change keyup blur", validateData);
            $("#shots").on("change keyup blur", validateData);
            $("#timestamp").on("change keyup blur", validateData);
            $("#distance").on("change keyup blur", validateData);
            $("#selectWeapon").on("change keyup blur", validateData);
            $("#weaponAdded").on("change keyup blur", validateData);
            
            function validateData() {
                var size = $("#size").val();
                var lengthFromOuterEdges = $("#lengthFromOuterEdges").val();
                var caliber = $("#caliber").val();
                var shots = $("#shots").val();
                var date = $("#timestamp").val();
                var distance = $("#distance").val();
                var weapon = $("#selectWeapon").val();
                var weaponAdded = $("#weaponAdded").val();
                
                var doubleRegExp = new RegExp("[0-9]+[.]{0,1}[0-9]*");
                var doubleRegExpNotRequired = new RegExp("[0-9]*[.]{0,1}[0-9]*");
                var dateRegExp = new RegExp("[0-9]{1,2}[-][0-9]{1,2}[-][0-9]{4}[ ][0-9]{1,2}[:][0-9]{1,2}[:][0-9]{1,2}");
                
                //document.write(doubleRegExp.test(size) + doubleRegExp.test(lengthFromOuterEdges) +  doubleRegExp.test(caliber) + doubleRegExp.test(shots) + doubleRegExp.test(distance) + dateRegExp.test(timestamp));
                if(doubleRegExp.test(size) && doubleRegExpNotRequired.test(lengthFromOuterEdges) && doubleRegExpNotRequired.test(caliber) && doubleRegExp.test(shots) && doubleRegExp.test(distance) && dateRegExp.test(date))
                {
                    $("#AddGroup").removeAttr('disabled');
                }
                else 
                {
                    $("#AddGroup").attr('disabled','disabled');
                }
            }
            $("#AddGroup").click(function() {
                var size = $("#size").val();
                var lengthFromOuterEdges = $("#lengthFromOuterEdges").val();
                var caliber = $("#caliber").val();
                var shots = $("#shots").val();
                var date = $("#timestamp").val();
                var distance = $("#distance").val();
                var weapon = $("#selectWeapon").val();
                var weaponAdded = $("#weaponAdded").val();
                weapon = whichWeapon(weapon, weaponAdded);

                var objectReturned = calculateGroupSize(lengthFromOuterEdges, caliber, size, shots, date, distance);

                var userName = localStorage["currentUser"];
                var weaponExists = doesWeaponExist(userName, weapon)
                if(!weaponExists)
                {
                    addWeapon(userName, weapon);
                }
                addGroup(userName, weapon, objectReturned);
                
                if($("#selectWeapon").val() === "NONE" && !weaponExists)
                {
                    var tempList = new Array();
                    tempList[0] = weapon;
                    var select = document.getElementById("selectWeapon"); 
                    var options = tempList; 

                    for(var i = 0; i < options.length; i++) 
                    {
                        var opt = options[i];
                        var el = document.createElement("option");
                        el.textContent = opt;
                        el.value = opt;
                        select.appendChild(el);
                    }
                }
                alert("The group was added");
              });
          
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
                temp.cleaned = false;

                return temp;
            }
        </script>
    </body>
</html>
