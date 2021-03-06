<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>考试清理</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/head.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/admin/clearExam.css">
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <link rel="icon"  sizes="32x32" href="${pageContext.request.contextPath}/img/systemIcon.png"/>
    <link rel="apple-touch-icon"  sizes="32x32" href="${pageContext.request.contextPath}/img/systemIcon.png"/>
</head>
<body style="background:url('${pageContext.request.contextPath}/img/background.jpg') no-repeat;background-size:100% 100%;">

<jsp:include page="head.jsp" />

<div class="panel panel-default"  style="background-color: rgba(112,128,144,0.5); margin:3% 5% 5% 6%;"> <%-- 修改面板背景颜色--%>
    <div class="panel-body" style="margin-bottom: 30px;">
<div class="container2" style="margin-top: 50px;">
    <table class="table table-bordered table-hover" style="color: white">
    <tr class="tableHead">
        <td>考试名称</td>
        <td>考试时间</td>
        <td>创建人</td>
        <td>上传试卷</td>
        <td>自动开始</td>
        <td>进行中</td>
        <td>已结束</td>
        <td>已归档</td>
        <td>已清理</td>
        <td>操作</td>
    </tr>

    <c:forEach items="${pb.list}" var="exam" varStatus="s">
        <tr>
            <td>${exam.examName}</td>
            <td>${exam.startTime}</td>
            <td>${exam.owner}</td>
            <td>
                <c:if test="${exam.isPageExist == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isAutoStart == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isStarting == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isFinished == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isFiled == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isCleaned == 1}">
                    <img src="${pageContext.request.contextPath}/img/yes.png" style="width: 25px; height: 25px;">
                </c:if>
            </td>
            <td>
                <c:if test="${exam.isFinished == 1}">
                    <c:if test="${exam.isCleaned == 0}">
                        <a class="btn btn-default btn-sm" href="${pageContext.request.contextPath}/cleanExamServlet?id=${exam.id}">清除</a>
                    </c:if>
                    <c:if test="${exam.isCleaned == 1}">
                        <a class="btn btn-danger btn-sm" href="${pageContext.request.contextPath}/deleteExamServlet?id=${exam.id}">删除</a>
                    </c:if>
                </c:if>
            </td>
        </tr>
    </c:forEach>
    </table>
    <%--分页工具条    --%>
    <%--    <div style="margin-left: 33%;">--%>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <li>
                    <c:if test="${pb.currentPage == 1}">
                        <a href="${pageContext.request.contextPath}/examManagerServlet?currentPage=1" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </c:if>
                    <c:if test="${pb.currentPage != 1}">
                        <a href="${pageContext.request.contextPath}/examManagerServlet?currentPage=${pb.currentPage - 1}" aria-label="Previous">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </c:if>
                </li>
                <c:forEach begin="1" end="${pb.totalPage}" var="i">
                    <li><a href="${pageContext.request.contextPath}/examManagerServlet?currentPage=${i}">${i}</a></li>
                </c:forEach>
                <li>
                    <c:if test="${pb.currentPage == pb.totalPage}">
                        <a href="${pageContext.request.contextPath}/examManagerServlet?currentPage=${pb.currentPage}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </c:if>
                    <c:if test="${pb.currentPage != pb.totalPage}">
                        <a href="${pageContext.request.contextPath}/examManagerServlet?currentPage=${pb.currentPage + 1}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </c:if>
                </li>
                <span style="font-size: 30px; margin-left: 8px;">
                    共${pb.totalCount}条记录，共${pb.totalPage}页
                </span>
            </ul>
        </nav>
    </div>
</div>
    </div>
</div>

</body>
</html>
