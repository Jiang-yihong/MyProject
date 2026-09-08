<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>公告管理 - 微头条</title>
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
                <li><a href="${pageContext.request.contextPath}/announcement?action=list" class="active">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>发布公告</h2>
                <form method="post" action="${pageContext.request.contextPath}/announcement">
                    <input type="hidden" name="action" value="add">
                    <div class="form-group">
                        <label>标题</label>
                        <input type="text" name="title" required>
                    </div>
                    <div class="form-group">
                        <label>内容</label>
                        <textarea name="content" rows="4" required></textarea>
                    </div>
                    <div class="form-group">
                        <label>备注（可选）</label>
                        <input type="text" name="remark">
                    </div>
                    <button type="submit" class="btn btn-primary">发布公告</button>
                </form>
            </div>
            <div class="card">
                <h2>公告列表</h2>
                <form class="search-bar" method="get" action="${pageContext.request.contextPath}/announcement">
                    <input type="hidden" name="action" value="list">
                    <input type="text" name="keyword" placeholder="按标题搜索" value="${keyword}">
                    <button class="btn btn-primary btn-sm" type="submit">搜索</button>
                </form>
                <table>
                    <thead>
                    <tr><th>ID</th><th>标题</th><th>内容</th><th>备注</th><th>发布时间</th><th>操作</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${announcements}" var="a">
                        <tr>
                            <td>${a.aid}</td>
                            <td>${a.title}</td>
                            <td style="max-width:300px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap;">${a.content}</td>
                            <td>${a.remark}</td>
                            <td>${a.publishTime}</td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/announcement" style="display:inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="aid" value="${a.aid}">
                                    <input type="text" name="title" value="${a.title}" required style="width:120px;">
                                    <input type="text" name="content" value="${a.content}" required style="width:150px;">
                                    <input type="text" name="remark" value="${a.remark}" style="width:80px;">
                                    <button class="btn btn-default btn-sm" type="submit">保存</button>
                                </form>
                                <a href="${pageContext.request.contextPath}/announcement?action=delete&aid=${a.aid}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('确定删除该公告？')">删除</a>
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
