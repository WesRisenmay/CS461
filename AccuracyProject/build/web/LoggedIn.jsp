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
        <script language="javascript" type="text/javascript" src="jqplot.cursor.min.js"></script>
        <script language="javascript" type="text/javascript" src="jqplot.highlighter.min.js"></script>
        <script language="javascript" type="text/javascript" src="jqplot.dateAxisRenderer.min.js"></script>
        <link rel="stylesheet" type="text/css" href="jquery.jqplot.css" />
        
        <style>
            form{ display: inline-block; }
            input{border:8px solid rgb(75, 178, 197); border-radius: 6px; height:50px; width:150px}
            table, td, th
            {
            border:1px solid black;
            }
            td
            {
            padding:15px;
            }
        </style>
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
        
         <form name="AddAnimals" action="AddAnimals.jsp">                     
            <input type="submit" value="AddAnimals" />
        </form>
        
        <div id="chartdiv" style="height:500px;width:1300px; "></div>

        <script>
            //$.jqplot('chartdiv',  [[[1, 2],[3,5.12],[5,13.1],[7,33.6],[9,85.9],[11,219.9]]]);
            //document.write(plotGroups(localStorage["currentUser"], ".243"));
            var labelNames = [];
            var weaponNames = getWeaponListNames(localStorage["currentUser"]);
            
            for(var i = weaponNames.length-1; i > -1; i--)
            {
                labelNames.push({label:weaponNames[i]})
            }
            
            $.jqplot('chartdiv',  plotGroups(localStorage["currentUser"]), 
            {   title:'Group Sizes',
                axes:{yaxis:{min:0, max:5, label:"Size(in.)"}, 
                    xaxis:{label:"Group #", renderer:$.jqplot.DateAxisRenderer,
                        tickOptions:{
                        formatString:'%b&nbsp;%#d'
                    } }},
                series:labelNames,
                legend:{show:true},
                highlighter: {
                  show: true,
                  sizeAdjust: 7.5
                },
                cursor: {
                  show: false
                }
            });
            
            function populateAnimalTable(userName) {
                var storage = JSON.parse(localStorage["UserDatabase"]);
                var userLocation = getUserLocationInArray(userName);

                var weaponSizes = new Array();
                var weaponListLength = storage.userList[userLocation].weaponList.length;
                var tablePopulator = new Array();
                
                for(var i = 0; i < weaponListLength; i++)
                {
                    weaponSizes.splice(i, 0, getAverageGroupSize(userName, storage.userList[userLocation].weaponList[i].name));
                }
                
                //populate first row with animals
                tablePopulator.splice(0, 0, "");
                for(var i = 0; i < animalList.length; i++) {
                    tablePopulator.splice(i+1, 0, animalList[i].name);
                }
                
                for(var i = 0; i < weaponSizes.length; i++) {
                    var angle = Math.atan(weaponSizes[i].avgSize/weaponSizes[i].distance);
                    tablePopulator.splice(tablePopulator.length, 0, storage.userList[userLocation].weaponList[i].name);
                    for(var j = 0; j < animalList.length; j++) {  
                        var accurateDistance = Math.round((animalList[j].size/Math.tan(angle))*10)/10;
                        tablePopulator.splice(tablePopulator.length, 0, accurateDistance);
                    }
                }
                
                var table = document.createElement("table");
                var i = 0;
                for (var r = 0; r < weaponListLength+1; r++) {
                  var row = table.insertRow(-1);
                  for (var c = 0; c < animalList.length + 1; c++) {
                    var cell = row.insertCell(-1);
                    cell.appendChild(document.createTextNode(tablePopulator[i++]));
                  }
                }

                document.body.appendChild(table);
                
                //stopped here. Need to figure out how to populate the table, and to calculate distances for animals that are too small
                
            }
            
            var animalList = GetAnimalList();
            populateAnimalTable(localStorage["currentUser"]);
            
        </script>
    </body>
</html>
