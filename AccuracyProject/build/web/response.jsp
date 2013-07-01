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
        function calculateGroupSize(lengthFromOuterEdges, caliber, size, shots)
        {
            if(size === "")
            {
                this.size = lengthFromOuterEdges - caliber;
            }
            else{
                this.size = size;
            }

            this.shots = shots;
            
            return this;
        }
        </script>  
    </head>
    <body>
        <script type="text/javascript">
        var size = getValue("size");
        var lengthFromOuterEdges = getValue("lengthFromOuterEdges");
        var caliber = getValue("caliber");
        document.write("Calculated group size was: " + calculateGroupSize(lengthFromOuterEdges, caliber, size, 0).size);
        </script>
    </body>
</html>
