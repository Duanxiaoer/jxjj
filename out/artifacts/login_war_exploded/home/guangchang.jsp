<%@ page import="java.io.PrintWriter" %>
<%@ page import="yxjj.DB" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.sql.SQLException" %><%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/7/16
  Time: 16:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>围观</title>
</head>
<body>
</body>
<%
    PrintWriter writer = response.getWriter();
    DB db = new DB();
    db.connectToDB();
    ResultSet resultSet = db.queryTucao();
    if (resultSet!=null){
        try{
            int count=1;
            while(resultSet.next()){
                String lueluelue = resultSet.getString("lueluelue");
                String id = resultSet.getString("id");
                String zan = resultSet.getString("zan");
                String cai = resultSet.getString("cai");
                String jubao = resultSet.getString("jubao");
                String info = id+"䵆"+lueluelue+"䵆"+zan+"䵆"+cai+"䵆"+jubao;
                info = URLEncoder.encode(info,"utf-8");
                Cookie cookie = new Cookie("tucao"+count,info);
                ++count;
                cookie.setMaxAge(60*60);
                cookie.setPath("/");
                response.addCookie(cookie);
                writer.print("<script>window.location='guangchang.html'</script>");
            }
            --count;//计数时超前了一个，回退
            System.out.println(count);
            int num=20;
            while(num>count){//删除无效cookie
                Cookie cookie = new Cookie("tucao"+num,null);
                cookie.setPath("/");
                cookie.setMaxAge(0);
                response.addCookie(cookie);
                --num;
            }
            if (count==0){
                writer.print("<script>alert('目前还没有同学吐槽，快来抢沙发啊😄');window.location='guangchang.html'</script>");
            }
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
%>
</html>
