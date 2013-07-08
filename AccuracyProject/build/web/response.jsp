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
        
        <script type="text/javascript">
        <!-- hide from old browsers

        function getValue(varname)
        {
          // First, we load the URL into a variable
          var url = window.location.href;

          // Next, split the url by the ?
          var qparts = url.split("?");

          // Check that there is a querystring, return "" if not
          if (qparts.length === 0)
          {
            return "";
          }

          // Then find the querystring, everything after the ?
          var query = qparts[1];

          // Split the query string into variables (separates by &s)
          var vars = query.split("&");

          // Initialize the value with "" as default
          var value = "";

          // Iterate through vars, checking each one for varname
          for (i=0;i<vars.length;i++)
          {
            // Split the variable by =, which splits name and value
            var parts = vars[i].split("=");

            // Check if the correct variable
            if (parts[0] === varname)
            {
              // Load value into variable
              value = parts[1];

              // End the loop
              break;
            }
          }

          // Convert escape code
          value = unescape(value);

          // Convert "+"s to " "s
          value.replace(/\+/g," ");

          // Return the value
          return value;
        }

        // end hide -->
        </script>   
        
        <script type="text/javascript">
        function setCookie(c_name,value,exdays)
        {
            var exdate=new Date();
            exdate.setDate(exdate.getDate() + exdays);
            var c_value=escape(value) + ((exdays===null) ? "" : "; expires="+exdate.toUTCString());
            document.cookie=c_name + "=" + c_value;
        }
        
        function getCookie(c_name)
        {
            var c_value = document.cookie;
            var c_start = c_value.indexOf(" " + c_name + "=");
            if (c_start === -1)
              {
              c_start = c_value.indexOf(c_name + "=");
              }
            if (c_start === -1)
              {
              c_value = null;
              }
            else
              {
              c_start = c_value.indexOf("=", c_start) + 1;
              var c_end = c_value.indexOf(";", c_start);
              if (c_end === -1)
              {
            c_end = c_value.length;
            }
            c_value = unescape(c_value.substring(c_start,c_end));
            }
            return c_value;
        }
        </script>
        
        <script type="text/javascript">
        function calculateGroupSize(lengthFromOuterEdges, caliber, size, shots, date)
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
        
        var objectReturned = calculateGroupSize(lengthFromOuterEdges, caliber, size, shots, date);
        document.write("Calculated group size was: " + objectReturned.size);
           
        setCookie("davesCookie",JSON.stringify(objectReturned), 20000);
        document.write(getCookie("davesCookie"));
        
        localStorage["test"] = JSON.stringify(objectReturned);
        document.write(JSON.stringify(JSON.parse(localStorage["test"])));
        
        </script>
    </body>
</html>
