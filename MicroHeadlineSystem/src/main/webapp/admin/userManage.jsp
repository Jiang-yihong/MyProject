<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户管理 - 微头条</title>
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
                <li><a href="${pageContext.request.contextPath}/admin?action=userManage" class="active">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=newsManage">头条管理</a></li>
                <li><a href="${pageContext.request.contextPath}/type?action=list">类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/announcement?action=list">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>用户管理</h2>
                <table>
                    <thead>
                    <tr><th>ID</th><th>用户名</th><th>昵称</th><th>角色</th><th>注册时间</th><th>操作</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${users}" var="u">
                        <tr>
                            <td>${u.uid}</td>
                            <td>${u.username}</td>
                            <td>${u.nickname}</td>
                            <td>${u.role == 1 ? '<span class="tag tag-hot">管理员</span>' : '普通用户'}</td>
                            <td>${u.registerTime}</td>
                            <td>
                                <c:if test="${u.role == 0}">
                                    <a href="${pageContext.request.contextPath}/admin?action=deleteUser&uid=${u.uid}"
                                       class="btn btn-danger btn-sm"
                                       onclick="return confirm('确定删除该用户？')">删除</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>
</html>
