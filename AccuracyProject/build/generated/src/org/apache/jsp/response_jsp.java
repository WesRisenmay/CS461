package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class response_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("        <!-- hide from old browsers\n");
      out.write("\n");
      out.write("        function getValue(varname)\n");
      out.write("        {\n");
      out.write("          // First, we load the URL into a variable\n");
      out.write("          var url = window.location.href;\n");
      out.write("\n");
      out.write("          // Next, split the url by the ?\n");
      out.write("          var qparts = url.split(\"?\");\n");
      out.write("\n");
      out.write("          // Check that there is a querystring, return \"\" if not\n");
      out.write("          if (qparts.length === 0)\n");
      out.write("          {\n");
      out.write("            return \"\";\n");
      out.write("          }\n");
      out.write("\n");
      out.write("          // Then find the querystring, everything after the ?\n");
      out.write("          var query = qparts[1];\n");
      out.write("\n");
      out.write("          // Split the query string into variables (separates by &s)\n");
      out.write("          var vars = query.split(\"&\");\n");
      out.write("\n");
      out.write("          // Initialize the value with \"\" as default\n");
      out.write("          var value = \"\";\n");
      out.write("\n");
      out.write("          // Iterate through vars, checking each one for varname\n");
      out.write("          for (i=0;i<vars.length;i++)\n");
      out.write("          {\n");
      out.write("            // Split the variable by =, which splits name and value\n");
      out.write("            var parts = vars[i].split(\"=\");\n");
      out.write("\n");
      out.write("            // Check if the correct variable\n");
      out.write("            if (parts[0] === varname)\n");
      out.write("            {\n");
      out.write("              // Load value into variable\n");
      out.write("              value = parts[1];\n");
      out.write("\n");
      out.write("              // End the loop\n");
      out.write("              break;\n");
      out.write("            }\n");
      out.write("          }\n");
      out.write("\n");
      out.write("          // Convert escape code\n");
      out.write("          value = unescape(value);\n");
      out.write("\n");
      out.write("          // Convert \"+\"s to \" \"s\n");
      out.write("          value.replace(/\\+/g,\" \");\n");
      out.write("\n");
      out.write("          // Return the value\n");
      out.write("          return value;\n");
      out.write("        }\n");
      out.write("\n");
      out.write("        // end hide -->\n");
      out.write("        </script>   \n");
      out.write("        \n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("        function calculateGroupSize(lengthFromOuterEdges, caliber, size, shots)\n");
      out.write("        {\n");
      out.write("            if(size === \"\")\n");
      out.write("            {\n");
      out.write("                this.size = lengthFromOuterEdges - caliber;\n");
      out.write("            }\n");
      out.write("            else{\n");
      out.write("                this.size = size;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            this.shots = shots;\n");
      out.write("            \n");
      out.write("            return this;\n");
      out.write("        }\n");
      out.write("        </script>  \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("        var size = getValue(\"size\");\n");
      out.write("        var lengthFromOuterEdges = getValue(\"lengthFromOuterEdges\");\n");
      out.write("        var caliber = getValue(\"caliber\");\n");
      out.write("        var shots = getValue(\"shots\");\n");
      out.write("        \n");
      out.write("        var objectReturned = calculateGroupSize(lengthFromOuterEdges, caliber, size, shots);\n");
      out.write("        document.write(\"Calculated group size was: \" + objectReturned.size);\n");
      out.write("        document.write(JSON.stringify(objectReturned));\n");
      out.write("        \n");
      out.write("        var fso = new ActiveXObject(\"Scripting.FileSystemObject\");\n");
      out.write("        var s = fso.CreateTextFile(\"C:\\\\NetbeansWriteTest.txt\", true);\n");
      out.write("        s.WriteLine('Hello');\n");
      out.write("        s.Close();\n");
      out.write("        </script>\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
