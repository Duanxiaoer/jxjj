<%@ page import="yxjj.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/7/11
  Time: 14:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>帮daike</title>
</head>
<body>
<%
    PrintWriter writer = response.getWriter();
    DB db = new DB();
    db.connectToDB();
    ResultSet resultSet = db.queryDaike();
    if (resultSet!=null){
        try{
            int count=1;
            while(resultSet.next()){
                String daike_id = resultSet.getString("daike_id");
                String location = resultSet.getString("location");
                String date = resultSet.getString("date");
                String time = resultSet.getString("time");
                String ks = resultSet.getString("ks");
                String sex = resultSet.getString("sex");
                String subject = resultSet.getString("subject");
                String payment = resultSet.getString("payment");
                String demand = resultSet.getString("demand");
                String qkbc = resultSet.getString("qkbc");
                String name = resultSet.getString("name");
                String tel = resultSet.getString("tel");
                String info = daike_id+"䵆"+location+"䵆"+date+"䵆"+time+"䵆"+ks+"䵆"+sex+"䵆"+subject+"䵆"+payment+"䵆"+demand+"䵆"+qkbc+"䵆"+name+"䵆"+tel;
                info = URLEncoder.encode(info,"utf-8");
                Cookie cookie = new Cookie("renwu"+count,info);
                ++count;
                cookie.setMaxAge(60*3);
                cookie.setPath("/");
                response.addCookie(cookie);
                writer.print("<script>window.location='bangdaike.html'</script>");
            }
            --count;//计数时超前了一个，回退
            int num=15;
            while(num>count){//删除无效cookie
                Cookie cookie = new Cookie("renwu"+num,null);
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                --num;
            }
            if (count==0){
                writer.print("<script>alert('目前还没有同学发布代课，你可以做第一个吃螃蟹的胖砸😯');window.location='bangdaike.html'</script>");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
%>
</body>
</html>
