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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>AddAnimals</title>
        
        <script language="javascript" type="text/javascript" src="jquery.min.js"></script>
        <script language="javascript" type="text/javascript" src="jquery.jqplot.min.js"></script>
        <script language="JavaScript" src="UserStorage.js"></script>
    </head>
    <body>
        Enter the animal name: <input type="text" id="name" /><br>
        Enter the diameter of killing shots: <input type="text" id="size" /><br>
        <input type="submit" id="AddAnimal" value="AddAnimal" />
        
        <br>
        <h2>Animals Already Added:</h2>
        <ul id="animalList">
        </ul>
        
        <script>
            var animalList = GetAnimalList();
            
            $("#animalList").empty();
            for(var i = 0; i < animalList.length; i++)
            {
                $("#animalList").append(animalList[i].name + '<br>');
            }
            
            $("#AddAnimal").click(function() {
                animalList = GetAnimalList();
                var name = $("#name").val();
                var size = $("#size").val();
                
                var animalDoesntExist = AddAnimal(name, size);
                if(!animalDoesntExist)
                    alert("The animal already exists");
                else
                {
                    animalList = GetAnimalList();
                    $("#animalList").empty();
                    for(var i = 0; i < animalList.length; i++)
                    {
                        $("#animalList").append(animalList[i].name + '<br>');
                    }
                    alert("The animal was added");
                }
            });
            
            
        </script>
    </body>
</html>
