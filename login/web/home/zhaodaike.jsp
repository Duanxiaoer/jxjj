<%@ page import="java.io.PrintWriter" %>
<%@ page import="yxjj.DB" %><%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/7/11
  Time: 13:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>zhaoxiaer</title>
</head>
<body>
<%
    PrintWriter writer = response.getWriter();
    request.setCharacterEncoding("UTF-8");

    String location = request.getParameter("location");
    String date = request.getParameter("date");
    String time = request.getParameter("time");
    String ks = request.getParameter("ks");
    String sex = request.getParameter("sex");
    String subject = request.getParameter("subject");
    String payment = request.getParameter("payment");
    String demand = request.getParameter("demand");
    String qkbc = request.getParameter("qkbc");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");

    if (location.equals("")||date.equals("")||time.equals("-1")||ks.equals("-1")||sex.equals("-1")||subject.equals("")||payment.equals("")||name.equals("")||tel.equals("")){
        writer.print("<script>alert('地点、日期、时间、课时、科目、薪酬、姓名、联系方式为必填项！');window.history.back()</script>");
        return;
    }
    HttpSession httpSession =request.getSession();
    String svalue = (String) httpSession.getAttribute("email");
    boolean online = false;
    if (svalue!=null){
        online = true;
    }
    if (!online){
        writer.print("<script>alert('操作超时，请重新登录！');window.location='../login/login.html'</script>");
        return;
    }

    DB db = new DB();
    db.connectToDB();
    db.insertDaike("daike",svalue,location,date,time,ks,sex,subject,payment,demand,qkbc,name,tel);
    writer.print("<script>alert('登记成功，我们会尽快与您联系！');window.location='bangdaike.jsp'</script>");
%>
</body>
</html>
