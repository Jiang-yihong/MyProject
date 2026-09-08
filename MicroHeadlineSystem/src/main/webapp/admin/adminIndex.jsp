<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>管理面板 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="logo">微头条系统 - 管理面板</div>
    <div class="user-info">
        管理员：${loginNick}
        <a href="${pageContext.request.contextPath}/headline?action=list">返回前台</a>
        <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
    </div>
</div>

<div class="container">
    <div class="admin-layout">
        <div class="admin-sidebar">
            <ul>
                <li><a href="${pageContext.request.contextPath}/admin?action=index" class="active">控制台</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=userManage">用户管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=newsManage">头条管理</a></li>
                <li><a href="${pageContext.request.contextPath}/type?action=list">类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/announcement?action=list">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>欢迎使用微头条管理系统</h2>
                <p>请在左侧菜单选择需要管理的功能模块。</p>
                <div style="display:grid;grid-template-columns:repeat(3,1fr);gap:16px;margin-top:24px;">
                    <a href="${pageContext.request.contextPath}/admin?action=userManage" class="card" style="text-align:center;display:block;">
                        <div style="font-size:32px;color:#667eea;">👥</div>
                        <div style="margin-top:8px;font-weight:bold;">用户管理</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin?action=newsManage" class="card" style="text-align:center;display:block;">
                        <div style="font-size:32px;color:#52c41a;">📰</div>
                        <div style="margin-top:8px;font-weight:bold;">头条管理</div>
                    </a>
                    <a href="${pageContext.request.contextPath}/admin?action=hotRank" class="card" style="text-align:center;display:block;">
                        <div style="font-size:32px;color:#fa541c;">🔥</div>
                        <div style="margin-top:8px;font-weight:bold;">热门排行</div>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
