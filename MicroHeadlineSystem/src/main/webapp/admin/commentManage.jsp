<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>评论管理 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="logo">微头条系统 - 管理面板</div>
    <div class="user-info">
        管理员：${loginNick}
        <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
    </div>
</div>
<div class="container">
    <div class="admin-layout">
        <div class="admin-sidebar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin?action=index">控制台</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=userManage">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=newsManage">头条管理</a></li>
                <li><a href="${pageContext.request.contextPath}/type?action=list">类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/announcement?action=list">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage" class="active">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>评论管理</h2>
                <table>
                    <thead>
                    <tr><th>ID</th><th>头条ID</th><th>用户</th><th>父评论ID</th><th>内容</th><th>时间</th><th>操作</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${comments}" var="c">
                        <tr>
                            <td>${c.cid}</td>
                            <td><a href="${pageContext.request.contextPath}/headline?action=detail&hid=${c.hid}" target="_blank">${c.hid}</a></td>
                            <td>${c.userNick}</td>
                            <td>${c.parentCid == null ? '-' : c.parentCid}</td>
                            <td style="max-width:300px;">${c.content}</td>
                            <td>${c.createTime}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin?action=deleteComment&cid=${c.cid}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('确定删除该评论？子评论将一并删除！')">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <c:if test="${empty comments}">
                    <p style="text-align:center;color:#999;padding:20px;">暂无评论</p>
                </c:if>
            </div>
        </div>
    </div>
</div>
</body>
</html>
