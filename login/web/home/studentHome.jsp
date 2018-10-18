<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/6/29
  Time: 16:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>submitStudentHome</title>
</head>
<body>
<%
    PrintWriter writer = response.getWriter();
    request.setCharacterEncoding("UTF-8");

    String time = request.getParameter("time");
    String aclass = request.getParameter("class");
    String subject = request.getParameter("subjects");
    String total_time = request.getParameter("total-time");
    String grade = request.getParameter("grade");
    String target = request.getParameter("target-grade");
    String location = request.getParameter("location");
    String sex = request.getParameter("sex");
    String payment = request.getParameter("payment");
    String demand_other = request.getParameter("demand-other");
    String replenish = request.getParameter("replenish");
    String name = request.getParameter("name");
    String tel = request.getParameter("tel");
    String education = request.getParameter("education");

    if (time.equals("-1")||aclass.equals("-1")||subject.equals("请选择")||total_time.equals("-1")||sex.equals("-1")||education.equals("-1")){
        writer.print("<script>alert('时间、年级、科目、时长、性别、类型为必填项！');window.history.back()</script>");
    }
    Cookie cookies[]=request.getCookies(); //读出用户硬盘上的Cookie，并将所有的Cookie放到一个cookie对象数组里面
    Cookie sCookie=null;
    String svalue=null;
    String sname=null;
    boolean online = false;
    for(int i=0;i<cookies.length-1;i++) {    //用一个循环语句遍历刚才建立的Cookie对象数组
        sCookie = cookies[i];   //取出数组中的一个Cookie对象
        sname = sCookie.getName(); //取得这个Cookie的名字
        System.out.println(sname);
        if (sname.equals("email")){
            online = true;
            svalue = sCookie.getValue(); //取得这个Cookie的内容
        }
    }
    if (!online){
        writer.print("<script>alert('操作超时，请重新登录！');window.location='../login/login.html'</script>");
    }
    //加载驱动程序
    String driverName="com.mysql.jdbc.Driver";
    //数据库信息
    String userName="root";
    //密码
    String userPasswd="";
    //数据库名
    String dbName= "yxjj";
    //表名
    String tableName="customer_need";
    if (education.length()<1||subject.length()<1||total_time.length()<1||time.length()<1||location.length()<1||payment.length()<1
            ||grade.length()<1||target.length()<1||aclass.length()<1||replenish.length()<1||demand_other.length()<1
            || tel.length()<1||sex.length()<1||name.length()<1){
        writer.print("<script>alert('请将信息填写完整！');window.history.back()</script>");
        return;
    }
    String url="jdbc:mysql://localhost/"+dbName+"?tucao="+userName+"&password="+userPasswd;
    try {
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        Connection conn= DriverManager.getConnection(url);
        Statement stmt = conn.createStatement();
        String need_id = svalue+"&"+System.currentTimeMillis();
        String sql="INSERT INTO customer_need values('" + subject + "','" + time+"','" + total_time + "','" + payment + "','"  + grade +
                "','" + target + "','" + need_id + "','"  + location + "','"  + name + "','"  + tel + "','"  + sex + "','"  + aclass + "','"  + demand_other + "','"  + replenish +  "','"  + education + "')";
        stmt.executeUpdate(sql);
        writer.print("<script>alert('登记成功，我们会尽快与您联系！');window.location='finished.html'</script>");
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
</body>
</html>
