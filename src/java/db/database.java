/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;

/**
 *
 * @author Administrator
 */
public class database {
    public database(){
    try{
    Class.forName("com.mysql.jdbc.Driver");
    }
    catch(Exception e){
        System.out.println(e);
    }
    
}
    public Connection connect() throws SQLException{
        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/pdd","root","");
        return conn;
        
    }
    public ResultSet exquery(String query) throws Exception{
        Connection conn=connect();
        Statement s=conn.createStatement();
        ResultSet rss=s.executeQuery(query);
        return rss;
        
    }
    public int exupdate(String query1) throws Exception{
        Connection conn=connect();
        Statement s=conn.createStatement();
        int a=s.executeUpdate(query1);
        return a;
    }
}
    

