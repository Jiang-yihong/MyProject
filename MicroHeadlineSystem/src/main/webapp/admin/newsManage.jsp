<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>头条管理 - 微头条</title>
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
                <li><a href="${pageContext.request.contextPath}/admin?action=newsManage" class="active">头条管理</a></li>
                <li><a href="${pageContext.request.contextPath}/type?action=list">类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/announcement?action=list">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>头条管理</h2>
                <form class="search-bar" method="get" action="${pageContext.request.contextPath}/admin">
                    <input type="hidden" name="action" value="newsManage">
                    <input type="text" name="keyword" placeholder="搜索标题或内容" value="${keyword}">
                    <select name="typeId">
                        <option value="0">全部类型</option>
                        <c:forEach items="${types}" var="t">
                            <option value="${t.typeId}" ${typeId == t.typeId ? 'selected' : ''}>${t.typeName}</option>
                        </c:forEach>
                    </select>
                    <select name="isDeleted">
                        <option value="-1">全部状态</option>
                        <option value="0" ${isDeleted == 0 ? 'selected' : ''}>未删除</option>
                        <option value="1" ${isDeleted == 1 ? 'selected' : ''}>已删除</option>
                    </select>
                    <button class="btn btn-primary btn-sm" type="submit">搜索</button>
                </form>

                <table>
                    <thead>
                    <tr><th>ID</th><th>标题</th><th>作者</th><th>类型</th><th>发布时间</th>
                        <th>浏览</th><th>点赞</th><th>评论</th><th>状态</th><th>操作</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${headlines}" var="h">
                        <tr>
                            <td>${h.hid}</td>
                            <td><a href="${pageContext.request.contextPath}/headline?action=detail&hid=${h.hid}" target="_blank">${h.title}</a></td>
                            <td>${h.publisherNick}</td>
                            <td><span class="tag">${h.typeName}</span></td>
                            <td>${h.createTime}</td>
                            <td>${h.viewCount}</td>
                            <td>${h.likeCount}</td>
                            <td>${h.commentCount}</td>
                            <td>${h.isDeleted == 1 ? '<span style="color:#ff4d4f;">已删除</span>' : '正常'}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/admin?action=deleteNews&hid=${h.hid}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('确定删除该头条？关联点赞评论将一并清除！')">删除</a>
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
