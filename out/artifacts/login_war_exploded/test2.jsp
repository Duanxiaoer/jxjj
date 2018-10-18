<%@page import="java.util.List"%>
<%@page import="yxjj.TestGoeasy" %>
<%@ page import="yxjj.Tucao" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
</head>
<body>

</body>
</html>

​<script src="​https://cdn-hangzhou.goeasy.io/goeasy.js​"></script>

<script>
    var goeasy = new GoEasy({
        appkey:"BS-5f627adccff44dd5bb3dd0883af18fa8"
    });

    goEasy.subscribe({
        channel:'TestGoeasy',
        onMessage: function(message){
            alert('收到：'+message.content);
        }
    });

</script>


