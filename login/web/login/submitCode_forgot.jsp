<%@ page import="yxjj.DB" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.net.URLDecoder" %><%--
  Created by IntelliJ IDEA.
  Tucao: duanqifeng
  Date: 2018/7/10
  Time: 11:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>提交验证码</title>
</head>
<body>
<%
    request.setCharacterEncoding("utf-8");
    PrintWriter writer = response.getWriter();
    String code_input = request.getParameter("code");
    String code_email=null;
    Cookie cookies[]=request.getCookies(); //读出用户硬盘上的Cookie，并将所有的Cookie放到一个cookie对象数组里面
    Cookie sCookie=null;
    String svalue=null;
    String sname=null;
    boolean Useful = false;
    for(int i=0;i<cookies.length-1;i++) {    //用一个循环语句遍历刚才建立的Cookie对象数组
        sCookie = cookies[i];   //取出数组中的一个Cookie对象
        sname = sCookie.getName(); //取得这个Cookie的名字
        if (sname.equals("code")){
            Useful = true;
            code_email = sCookie.getValue(); //取得这个Cookie的内容
        }
    }

    if (code_email !=null){
        if (Useful){
            if (code_email.equals(code_input)){
                writer.print("<script>alert('请重置您的密码！');window.location='resetPwd.html'</script>");
            }else if (code_input.equals("")){
                writer.print("<script>alert('验证码错误🙅！');window.history.back()</script>");
                return;
            }
        }else{
            writer.print("<script>alert('操作超时，重来！');window.location='sentEmail_forgot.html'</script>");
        }
    }else {
        writer.print("<script>alert('请输入验证码！');window.history.back()</script>");
        return;
    }
%>
</body>
</html>
