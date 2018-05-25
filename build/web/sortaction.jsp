<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="com.google.common.collect.Table.Cell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFSheet"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFWorkbook"%>
<html>
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
   <link href="css/glyphicons.css" rel="stylesheet">
   <link href="css/bootstrap.css" rel="stylesheet">
   <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css"/>
   <link rel="stylesheet" type="text/css"href="https://cdn.datatables.net/buttons/1.5.1/css/buttons.dataTables.min.css"/>
        <title>Sort</title>
        <style>
            .input-group{
                margin-bottom: 50px;
                width:80%;
                margin-left: 100px;
                margin-right: 100px;
                margin-top: 50px;
            }
             nav{
height:60px;
}
.color-me,
.color-me:hover{
color:#c5c6c7;
text-decoration:none;
}
button{
background-color:#1f2833;
color:#c5c6c7;
}
        </style>
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
<a class="navbar-brand" href="userhome.jsp">
    <span class="glyphicon glyphicon-th-list"></span>
</a>
<ul class="nav navbar-navbar-right">
      <li><a href="logout.jsp" class="color-me"><button type="button" class="btn btn-default btn-md">Log Out</a></li>
	  </ul>
</nav>
        <div class="input-group has-success">
					<!--<label for="textUsrname">Username</label>-->
        <input type="text" class="form-control" id="textUsrname" name="name" placeholder="Sort Key">
        <span class="input-group-addon" id="hit" onclick="">sort</span>
	</div>
         <%
             String filename=request.getParameter("filename");
                FileInputStream ExcelFileToRead1 = new FileInputStream("C:/Users/user/Downloads/"+filename);
        Workbook wb12=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh1=wb12.getSheet("Sheet1");
        XSSFCell cell;
        int rowno=sh1.getLastRowNum();
        int k;
          Row c1=sh1.getRow(0);
          Iterator cells = c1.cellIterator();
                %>
        <table id="example" class="table table-striped table-bordered" style="width:100%">
        <thead>
           
            <tr>
                <%
               while (cells.hasNext())
			{
				cell=(XSSFCell) cells.next();
                    %>
                <th scope="col"><%=cell.getStringCellValue()%></th>
                <%
                }
                    %>
            </tr>
     </thead>
        <tbody>
            <%
            for(k=0;k<rowno;++k)
        {
            %>
            <tr>
                <% Row c12=sh1.getRow(k);
                   Iterator cells1 = c12.cellIterator();
        while (cells1.hasNext())
			{
				cell=(XSSFCell) cells1.next();
                                if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {%>
                                         <td><%=cell.getStringCellValue()%></td>
                                         <%
                                        }
                                    else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {%>
                                    <td><%=cell.getNumericCellValue()%></td>
                                    <%}
                                %>
                                
                                <%}
        %>
            </tr>
            <%
        }
                %>
        </tbody>
                
    </table>
              <script src="js/jquery-1.12.4.js"></script> 
        <script src="js/jquery.min.js"></script>
        <script src="js/jquery.dataTables.min.js"></script>
        <script src="js/dataTables.buttons.js"></script>
         <script src="js/jszip.min.js"></script>
          <script src="js/buttons.html5.min.js"></script>
          <script src="js/vfs_fonts.js"></script>
           <script src="js/pdfmake.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
             $('#example').DataTable( {
             dom: 'Bfrtip',
        buttons: [
            'excelHtml5'
        ],
        "order": [[ 0, "desc" ]]
    } );
    table.buttons().container()
    .appendTo( $('.col-sm-6:eq(0)', table.table().container() ) );
   // var term = $('#textUsrname').val();
  $('#hit').click(function() {
    var term=$('#textUsrname').val();
    //alert(term);
     var textArr = [];
     var i=0,j=-1,k;
     $('thead tr th').each(function() {
     textArr[i]=$(this).text();
     i++;
   });
   //alert(i);
   for(k=0;k<i;++k){
       if(textArr[k]===term){
           j=k;
           break;
       }
   }
   if(j===-1)
       alert("invalid");
    //else
      //  alert(j);
    $('#example').DataTable( {
        "destroy": true,
        "order": [[ j, "desc" ]]
    } );
  });
} );
        </script>
    </body>
</html>