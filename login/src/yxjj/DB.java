package yxjj;

import java.net.URLEncoder;
import java.sql.*;

public class DB {
    private Connection connection;
    private Statement statement;
    String tableName = "userinfo";

    public void connectToDB(){
        try {
            String driver = "com.mysql.jdbc.Driver";
            String dbName = "yxjj";
            String userName = "root";
            String password = "";
            String url = "jdbc:mysql://localhost/"+dbName+"?user="+userName+"&password="+password;
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url);
            System.out.println("连接数据库");
        } catch (IllegalAccessException | InstantiationException | SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public  ResultSet queryDaike(){
        tableName="daike";
        ResultSet rs=null;
        return getResultSet(rs);
    }

    public  ResultSet queryTucao(){
        tableName="tucao";
        ResultSet rs=null;
        return getResultSet(rs);
    }

    public ResultSet queryKuaidi(){
        tableName="kuaidi";
        ResultSet rs = null;
        return getResultSet(rs);
    }

    public ResultSet queryUserinfo(){
        tableName="userinfo";
        ResultSet rs = null;
        return getResultSet(rs);
    }

    private ResultSet getResultSet(ResultSet rs) {
        try{
            statement = connection.createStatement();
            String sql="SELECT * FROM "+tableName;
            rs = statement.executeQuery(sql);
            return rs;
        } catch (SQLException e) {
            e.printStackTrace();
            return rs;
        }
    }

    public void insertUserInfo(String tn,String email,String pwd,String name ){
        tableName = tn;
        try{
            statement = connection.createStatement();
            String sql = "insert into "+tableName+" values('" + email + "','" + pwd + "','" +name + "')";
            int flag = statement.executeUpdate(sql);
            if (flag!=0){
                System.out.println("插入成功！");
            }else{
                System.out.println("插入失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void updateUserpwd(String email,String pwd){
        tableName = "userinfo";
        try{
            statement = connection.createStatement();
            String sql = "UPDATE "+tableName+" SET password = '" + pwd +"' WHERE email = '" + email + "'";
            int flag = statement.executeUpdate(sql);
            if (flag!=0){
                System.out.println("更新成功！");
            }else{
                System.out.println("更新失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insertKuaidi(String tn,String cName,String cTel,String mesg,String location,String qkbc,String xiaoer,String xiaoerTel,String email){
        tableName = tn;
        try{
            statement = connection.createStatement();
            String id = System.currentTimeMillis()+"#"+email;
            String sql = "insert into "+tableName+" values('" +  cName + "','" + cTel + "','" +mesg + "','" + location + "','" + qkbc + "','" + xiaoer + "','" + xiaoerTel + "','" + id + "')";
            int flag = statement.executeUpdate(sql);
            if (flag!=0){
                System.out.println("插入成功！");
            }else{
                System.out.println("插入失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insertTucao(String lueluelue,String email){
        tableName = "tucao";
        try{
            statement = connection.createStatement();
            String id = System.currentTimeMillis()+"#"+email;
            String sql = "insert into "+tableName+" values('" +  lueluelue + "','"  + id + "','"  + 0 + "','" + 0 + "','" + 0 +"')";
            int flag = statement.executeUpdate(sql);
            if (flag!=0){
                System.out.println("插入成功！");
            }else{
                System.out.println("插入失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void insertDaike(String tn,String email,String location,String date,String time,String ks,String sex,String subject,String payment,String demand,String qkbc,String name,String tel){
        tableName = tn;
        String daike_id = System.currentTimeMillis()+email;
        try{
            statement = connection.createStatement();
            String sql = "insert into "+tableName+" values('" + daike_id + "','" + location + "','" + date + "','" +time + "','" + ks + "','" + sex + "','" + subject + "','" + payment + "','" + demand + "','" + qkbc + "','" + name + "','" + tel +"')";
            int flag = statement.executeUpdate(sql);
            if (flag!=0){
                System.out.println("插入成功！");
            }else{
                System.out.println("插入失败！");
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }



}
