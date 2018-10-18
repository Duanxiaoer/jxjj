<%@ page import="yxjj.SentEmail" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="yxjj.DB" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/7/17
  Time: 21:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>获取验证码</title>
</head>
<body>
<%
    PrintWriter writer=response.getWriter();
    DB db = new DB();
    db.connectToDB();
    ResultSet resultSet = db.queryUserinfo();
    String email = request.getParameter("email");
    boolean signed=false;
    try{
        while (resultSet.next()){
            if (email.equals(resultSet.getString("email"))){
                signed = true;
            }
        }
    }catch (Exception e){
        e.printStackTrace();
    }

    if (signed){
        int one = (int) (Math.random()*10000);
        int two = (int) (Math.random()*3000);
        int three = (int) (Math.random()*400);
        int four = (int) (Math.random()*70);
        String code = String.valueOf(one+two+three+four);
        Cookie cookie_code = new Cookie("code",code);
        Cookie cookie_email = new Cookie("email",email);
        cookie_code.setMaxAge(60*5);
        cookie_email.setMaxAge(60*5);
        cookie_code.setPath("/");
        cookie_email.setPath("/");
        response.addCookie(cookie_code);
        response.addCookie(cookie_email);
        SentEmail.sendEmail_resetPwd(email,code);
        writer.print("<script>alert('验证码已发送至您的邮箱，五分钟内输入有效！');window.location='sentEmail_forgot.html'</script>");
    }else {
        writer.print("<script>alert('该邮箱还未注册！');window.history.back()</script>");
        return;
    }

%>
</body>
</html>
