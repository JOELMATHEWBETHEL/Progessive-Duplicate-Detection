<%@page import="Encryption.AES"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.poi.ss.usermodel.Row"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCell"%>
<%@page import="org.apache.poi.ss.usermodel.Sheet"%>
<%@page import="org.apache.poi.ss.usermodel.WorkbookFactory"%>
<%@page import="org.apache.poi.ss.usermodel.Workbook"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.FileNotFoundException"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="db.database"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.BufferedWriter"%>
<%
    String Login_id=(String)session.getAttribute("login_id");
    int id=0;
    String path="",filename="";
    String[] User_id=new String[10];
    //String User_id=(String)session.getAttribute("u_id");
    database db=new database();
    String a="select max(File_id) from tbl_file";
        ResultSet rs2=db.exquery(a);
         while(rs2.next()){
                    id=rs2.getInt(1);
   }
    String a1="select * from tbl_file where File_id='"+id+"'";
    ResultSet rs1=db.exquery(a1);
    while(rs1.next()){
        //User_id=rs1.getString("User_id");
        path=rs1.getString("Filepath");
        filename=rs1.getString("Filename");
        
    }
    String re_count=String.valueOf(application.getAttribute("count"));
    int count=Integer.parseInt(re_count);
    int j1=count,j2=id,j3=0;
    while(j1>0){
    String a2="update tbl_file set Filetype='.xlsx' where File_id='"+id+"'";
    db.exupdate(a2);
    id--;
    j1--;
    }
    j1=count;
    id=j2-count+1;
    while(j1>0){
    String a11="select * from tbl_file where File_id='"+id+"'";
    ResultSet rs11=db.exquery(a11);
    while(rs11.next()){
        User_id[j3]=rs11.getString("User_id");
    }
    j1--;
    id++;
    j3++;
    }
    j1=count;
    j3=0;
    FileInputStream ExcelFileToRead1 = new FileInputStream(path); 
    Workbook wb1=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno1=sh.getLastRowNum();
        int noOfColumns1 = sh.getRow(0).getLastCellNum();
        XSSFCell cell;
         int noOfColumns = sh.getRow(0).getLastCellNum();
        String s1,s2;
        //int flag=0,len1,len2,i,rowno1=0;
        for(int j=0;j<=rowno1;++j)
        {
        Row c=sh.getRow(j);
       // flag=0;
        Iterator cells = c.cellIterator();
        while (cells.hasNext())
			{
                            s1="";
				cell=(XSSFCell) cells.next();
                                    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s1=cell.getStringCellValue();
                                        }
                                    else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {
                                        s1=String.valueOf(cell.getNumericCellValue());
                                    }
                         AES aes = new AES("lv39extlvuhaqqsr");
                         String encdata = aes.encrypt(s1);
                         cell.setCellValue(encdata);
                         }
        FileOutputStream fileOut = new FileOutputStream(path);
                //write this workbook to an Outputstream.
		wb1.write(fileOut);
                fileOut.flush();
		fileOut.close();
        }
        wb1.close();
    
     try {

           FileInputStream fin = new FileInputStream(path);

           int i = 0;
           String s = "";

           while((i=fin.read())!=-1) {

               s = s + String.valueOf((char)i);

           }
          
        /*   FileInputStream ExcelFileToRead1 = new FileInputStream(path); 
    Workbook wb1=WorkbookFactory.create(ExcelFileToRead1);
        Sheet sh=wb1.getSheet("Sheet1");
        int rowno1=sh.getLastRowNum();
        int noOfColumns1 = sh.getRow(0).getLastCellNum();
        XSSFCell cell;
         int noOfColumns = sh.getRow(0).getLastCellNum();
        String s1,s2;
        //int flag=0,len1,len2,i,rowno1=0;
        for(int j=0;j<=rowno1;++j)
        {
        Row c=sh.getRow(j);
       // flag=0;
        Iterator cells = c.cellIterator();
        while (cells.hasNext())
			{
                            s1="";
				cell=(XSSFCell) cells.next();
                                    if (cell.getCellType() == XSSFCell.CELL_TYPE_STRING)
                                        {
                                         s1=cell.getStringCellValue();
                                        }
                                    else if(cell.getCellType() == XSSFCell.CELL_TYPE_NUMERIC)
                                    {
                                        s1=String.valueOf(cell.getNumericCellValue());
                                    }
                         AES aes = new AES("lv39extlvuhaqqsr");
                         String encdata = aes.encrypt(s1);
                         cell.setCellValue(encdata);
                         }
        FileOutputStream fileOut = new FileOutputStream(path);
                //write this workbook to an Outputstream.
		wb1.write(fileOut);
                fileOut.flush();
		fileOut.close();
        }
        wb1.close();*/
           
            String fname=filename+".xlsx";
           FileOutputStream fout = new FileOutputStream("C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname);
           String fpath="C:/Users/user/Documents/NetBeansProjects/PDD/web/upload files/"+fname;
           byte[] b = s.getBytes();
           fout.write(b);
           while(j1>=0){
           String e="insert into tbl_file(Filename,Login_id,User_id,Filetype,Filepath,Status)values('"+fname+"','"+Login_id+"','"+User_id[j3]+"','.xlsx.xlsx','"+fpath+"','SEND')"; 
                     db.exupdate(e); 
                     j1--;
                     j3++;
           }
     } catch(Exception e){
         System.out.println(e);
      }
    
%>
<script>
  alert("file sended successfully");
  window.location="userhome.jsp";
</script>