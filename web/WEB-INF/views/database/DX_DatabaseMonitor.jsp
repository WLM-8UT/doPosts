<%--
  Created by IntelliJ IDEA.
  User: 17868
  Date: 2020/8/22
  Time: 17:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>DX_Database 监控主页</title>
    <link rel="icon" href="<%=path%>/static/images/database/database.ico">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/layui/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/admin.css" media="all">
    <link rel="stylesheet" href="<%=path%>/static/layuiadmin/style/login.css" media="all">
    <script src="<%=path%>/static/layuiadmin/layui/layui.js"></script>
    <script src="<%=path%>/static/js/jquery.js"></script>
</head>
<body>
<div class="layui-card-body" style="padding: 0 0 0 0">
    <ul class="layui-nav" lay-filter="component-nav">
        <li style="display: inline-block;vertical-align: middle;"><img src="<%=path%>/static/images/database/database.png" alt="???" height="30" width="30"></li>
        <li style="display: inline-block;position: relative;vertical-align: middle;margin-right: 25px;margin-left: 7px;text-align: -webkit-match-parent;"><div style="color: white;font-size: 14px;line-height: 58px;text-align: -webkit-match-parent;">DX_Database数据库</div></li>
        <li class="layui-nav-item"><a href="javascript:">概览</a></li>
        <li class="layui-nav-item"><a href="javascript:">SQL监控</a></li>
        <li class="layui-nav-item">
            <a href="javascript:">数据库接口调用统计</a>
        </li>
        <li class="layui-nav-item"><a href="javascript:">数据库</a></li>
    </ul>
</div>
</body>
</html>
