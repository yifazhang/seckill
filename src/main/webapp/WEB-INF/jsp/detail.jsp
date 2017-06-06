<%--
  Created by IntelliJ IDEA.
  User: zhangyifa
  Date: 6/5/17
  Time: 10:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 引入jstl -->
<%@include file="common/tag.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>秒杀的详情页</title>
    <%@include file="common/head.jsp"%>
</head>
<body>

    <!-- 页面显示部分 -->
    <div class="container">
        <div class="panel panel-default">
            <div class="panel panel-heading text-center">
               <div class="pannel-heading">
                   <h1>${seckill.name}</h1>
               </div>
            </div>
            <div class="panel-body">

            </div>
        </div>
    </div>

</body>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</html>
