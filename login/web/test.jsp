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

<script src="​http://cdn-hangzhou.goeasy.io/goeasy.js​"></script>

<script>

    var goeasy = new GoEasy({
        appkey:"BC-6a58030b5d6b44b1bbd27023e46bcb74"
    });


    goeasy.publish({
        channel:"TestGoeasy",
        message:"hello world"
    });


</script>

