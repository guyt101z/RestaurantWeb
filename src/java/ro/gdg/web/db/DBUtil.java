/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package ro.gdg.web.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author diana
 */
public class DBUtil {
    public static ArrayList<HashMap> executeQuery(String query){
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        ResultSetMetaData rsmd = null;
        ArrayList<HashMap> res = new ArrayList<HashMap>();
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
            stmt = conn.createStatement();
            rs = stmt.executeQuery(query);
            rsmd = rs.getMetaData();
            int numberOfColumns = rsmd.getColumnCount();
            int i=0,j;
            HashMap aux = new HashMap();
            while(rs.next())
            {
                aux = new HashMap();
                for(j=1;j<=numberOfColumns;j++)
                {
                   aux.put(rsmd.getColumnLabel(j), rs.getString(j));
                }
                res.add(i,aux );
                i++;
            }

        }
        catch(SQLException ex)
        {   ex.printStackTrace();
        }

        catch(ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        finally {
            try {
                if(stmt != null)
                    stmt.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if(conn != null)
                    conn.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if(rs != null)
                    rs.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            return res;
        }
    }
    
    public static int executeUpdate(String query)
    {
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        int key=-1;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant","root","root");
            stmt = conn.createStatement();
            stmt.executeUpdate(query, Statement.RETURN_GENERATED_KEYS);
            if(query.toLowerCase().startsWith("insert"))
            {
                rs=stmt.getGeneratedKeys();
                rs.next();
                key = rs.getInt(1);
            }
        }
        catch(SQLException ex)
        {   ex.printStackTrace();
        }

        catch(ClassNotFoundException ex) {
            ex.printStackTrace();
        }
        finally {
            try {
                if(stmt != null)
                    stmt.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if(conn != null)
                    conn.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            try {
                if(rs != null)
                    rs.close();
            }
            catch(SQLException ex) {
                ex.printStackTrace();
            }
            return key;
        }
    }
}
