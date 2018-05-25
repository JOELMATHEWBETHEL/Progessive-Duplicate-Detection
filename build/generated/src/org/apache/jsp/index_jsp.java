package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no\">\n");
      out.write("  <link href=\"css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("   <link href=\"css/glyphicons.css\" rel=\"stylesheet\">\n");
      out.write("   <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write(" <title>index</title>\n");
      out.write("<style>\n");
      out.write("    input.error, textarea.error, select.error{\n");
      out.write("\t\t\tborder-color: #ebccd1;\n");
      out.write("\t\t\tbackground-color: #f2dede;\n");
      out.write("\t\t\tcolor: #a94442;\n");
      out.write("\t\t}\n");
      out.write("\t\tinput:focus.error, textarea:focus.error, select:focus.error{\n");
      out.write("\t\t\tborder-color: #ebccd1;\n");
      out.write("\t\t\tbox-shadow:0 1px 1px rgba(0, 0, 0, 0.075) inset, 0 0 8px rgba(242, 222, 222, 0.6);\n");
      out.write("\t\t}\n");
      out.write("\t\tlabel.error {\n");
      out.write("\t\t\tcolor: #a94442;\n");
      out.write("\t\t\tfont-size:10px;\n");
      out.write("\t\t\tpadding-top:.5px;\n");
      out.write("\t\t\tpadding-bottom:.5px;\n");
      out.write("\t\t}\n");
      out.write("img{\n");
      out.write("height:600px;\n");
      out.write("width:100%;\n");
      out.write("}\n");
      out.write("nav{\n");
      out.write("height:60px;\n");
      out.write("}\n");
      out.write("button{\n");
      out.write("background-color:#1f2833;\n");
      out.write("color:#c5c6c7;\n");
      out.write("}\n");
      out.write(".color-me,\n");
      out.write(".color-me:hover{\n");
      out.write("color:#c5c6c7;\n");
      out.write("text-decoration:none;\n");
      out.write("}\n");
      out.write("h3{\n");
      out.write("\tpadding-top:20px;\n");
      out.write("\tcolor:#66fcf1;\n");
      out.write("\tfont-weight:bolder;\n");
      out.write("\t}\n");
      out.write("\t.form-group{\n");
      out.write("\tmargin-left:100px;\n");
      out.write("\tmargin-right:100px;\n");
      out.write("\t}\n");
      out.write("\t#textUsrname{\n");
      out.write("\tmargin-top:30px;\n");
      out.write("\t}\n");
      out.write("\ta{\n");
      out.write("\ttext-decoration:underline;\n");
      out.write("\t}\n");
      out.write("\t.click-me{\n");
      out.write("\twidth:85%;\n");
      out.write("\tmargin-left:100px;\n");
      out.write("\tmargin-right:100px;\n");
      out.write("\tmargin-bottom:50px;\n");
      out.write("\tbackground-color:#45a29e;\n");
      out.write("\t}\n");
      out.write("\t.footer{\n");
      out.write("\tbackground-color:#0b0c10;\n");
      out.write("\theight:80px;\n");
      out.write("\t}\n");
      out.write("\t.carousel-caption {\n");
      out.write("    top: 75px;\n");
      out.write("    bottom: auto;\n");
      out.write("}\n");
      out.write("\th1{\n");
      out.write("\tpadding-left:100px;\n");
      out.write("\tcolor:#66fcf1;\n");
      out.write("\tfont-size:100px;\n");
      out.write("\t}\n");
      out.write("\th2{\n");
      out.write("\tfont-weight:bold;\n");
      out.write("\tcolor:#45a29e;\n");
      out.write("\t}\n");
      out.write("        .icon{\n");
      out.write("         margin-left: 50%;\n");
      out.write("        }\n");
      out.write("        .footicon,\n");
      out.write("        .footicon:active,\n");
      out.write("        .footicon:hover{\n");
      out.write("            margin-top:20px;\n");
      out.write("            color:#FFF;\n");
      out.write("            text-decoration: none;\n");
      out.write("        }\n");
      out.write("        .copyright,\n");
      out.write("        .copyright:active,\n");
      out.write("        .copyright:hover{\n");
      out.write("            margin-left:45%;\n");
      out.write("            text-decoration: none;\n");
      out.write("            margin-top: -10px;\n");
      out.write("        }\n");
      out.write("</style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("<nav class=\"navbar navbar-dark bg-dark\">\n");
      out.write("<a class=\"navbar-brand\" href=\"index.jsp\">\n");
      out.write("<span class=\"glyphicon glyphicon-th-list\"></span>\n");
      out.write("</a>\n");
      out.write("<ul class=\"nav navbar-navbar-right\">\n");
      out.write("      <li><a href=\"signup.jsp\" class=\"color-me\"><button type=\"button\" class=\"btn btn-default btn-md\">Signup</a></li>\n");
      out.write("\t  </ul>\n");
      out.write("</nav>\n");
      out.write("<div id=\"mycarousel\" class=\"carousel slide\" data-ride=\"carousel\">\n");
      out.write("    <div class=\"carousel-inner\">\n");
      out.write("        <div class=\"item active\">\n");
      out.write("\t\t\t<img src=\"images/macbook-apple-imac-computer-39284.jpeg\" alt=\"\" class=\"img-responsive\">\n");
      out.write("\t\t\t<div class=\"carousel-caption\">\n");
      out.write("\t\t\t\t\t\t<p class=\"lead\"><h1>EXCLDUP</h1></p>\n");
      out.write("\t\t\t\t\t\t<p class=\"lead\"><h2><center>Get your Way Out Of Duplicate World</center></h2></p>\n");
      out.write("\t\t\t\t\n");
      out.write("           </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\t<div class=\"container-fluid\">\n");
      out.write("\t\t\t\t<h3><center>SIGN IN</center></h3>\n");
      out.write("                                <form id=\"form\" action=\"loginaction.jsp\" method=\"post\">\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t<!--<label for=\"textUsrname\">Username</label>-->\n");
      out.write("\t\t\t\t\t<input type=\"text\" class=\"form-control\" id=\"textUsrname\" name=\"name\" placeholder=\"Username\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"form-group\">\n");
      out.write("\t\t\t\t\t<input type=\"password\" class=\"form-control\" id=\"txtPassword\" name=\"pswd\" placeholder=\"Password\">\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"text-center\"><button type=\"submit\" class=\"btn btn-lg btn-default btn-block click-me\">Login</button></div>\n");
      out.write("                                </form>\n");
      out.write("                        </div>\n");
      out.write("\t\t\t<div class=\"container-fluid footer\">\n");
      out.write("                            <ul class=\"icon\">\n");
      out.write("                            <a href=\"#\" class=\"fa fa-facebook footicon\"></a>\n");
      out.write("                            <a href=\"#\" class=\"fa fa-twitter footicon\"></a>\n");
      out.write("                            <a href=\"#\" class=\"fa fa-google footicon\"></a>\n");
      out.write("                            </ul>\n");
      out.write("                               <div class=\"row text-center copyright\"><a href=\"http://xyz.com\" style=\"color: #fff;text-decoration: none;\"><h6>Copyright © Your Website XCLDUP 2017</h6></a></div>\n");
      out.write("\t\t\t</div>\n");
      out.write("    <script src=\"js/jquery.min.js\"></script>\n");
      out.write("\t<!-- Include all compiled plugins (below), or include individual files as needed -->\n");
      out.write("\t<script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("        <script src=\"js/jquery.validate.js\"></script>\n");
      out.write("        <script type=\"text/javascript\">\n");
      out.write("\t\t$(document).ready(function(){\n");
      out.write("\t\t\t$('#form').validate({\n");
      out.write("\t\t\t\trules:{\n");
      out.write("\t\t\t\t\tname:{\n");
      out.write("\t\t\t\t\t\trequired: true\n");
      out.write("\t\t\t\t\t},\n");
      out.write("\t\t\t\t\tpswd:{\n");
      out.write("\t\t\t\t\t\trequired: true\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t},\n");
      out.write("\t\t\t\tmessages:{\n");
      out.write("\t\t\t\t\tname:{\n");
      out.write("\t\t\t\t\t\trequired:\"Please enter your user name\"\n");
      out.write("\t\t\t\t\t},\n");
      out.write("\t\t\t\t\tpswd:{\n");
      out.write("\t\t\t\t\t\trequired:\"Please enter your password\"\n");
      out.write("\t\t\t\t\t}\n");
      out.write("\t\t\t\t}\n");
      out.write("\t\t\t});\n");
      out.write("\t\t});\n");
      out.write("    </script>\t\n");
      out.write("</body>\n");
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
