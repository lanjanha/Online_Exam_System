<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>修改教师信息</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/teacherManage.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="icon"  sizes="32x32" href="${pageContext.request.contextPath}/img/systemIcon.png"/>
    <link rel="apple-touch-icon"  sizes="32x32" href="${pageContext.request.contextPath}/img/systemIcon.png"/>

</head>
<body style="background:url('${pageContext.request.contextPath}/img/background.jpg') no-repeat;background-size:100% 100%;">
<div class="alert_container">
    <h3 style="text-align: center;">修改教师信息</h3>
    <form action="${pageContext.request.contextPath}/updateTeacherServlet" method="post">
        <input type="hidden" name="id" value="${teacher.id}">

        <div class="form-group">
            <label>用户名：</label>
            <input type="text" class="form-control" id="username" name="username"  value="${teacher.username}"/>
        </div>

        <div class="form-group">
            <label>密码：</label>
            <input type="password" class="form-control" id="password"  name="password" value="${teacher.password}" />
        </div>

        <div class="form-group">
            <label>真实姓名：</label>
            <input type="text" class="form-control" name="teacherName" value="${teacher.teacherName}"/>
        </div>

        <div class="form-group">
            <label>是否设置管理员：</label>
            <c:if test="${teacher.isAdmin == 1}">
                <input type="radio" name="isAdmin" value="是" checked />是
                <input type="radio" name="isAdmin" value="否" />否
            </c:if>
            <c:if test="${teacher.isAdmin == 0}">
                <input type="radio" name="isAdmin" value="是" />是
                <input type="radio" name="isAdmin" value="否" checked />否
            </c:if>
        </div>

        <div class="form-group" style="text-align: center">
            <input class="btn btn-primary" type="submit" value="提交" />
            <input class="btn btn-default" type="reset" value="重置" />
            <a href="${pageContext.request.contextPath}/teacherManagerServlet?currentPage=1">
                <input class="btn btn-default" type="button" value="返回"/>
            </a>
        </div>
    </form>
</div>
</body>
</html>