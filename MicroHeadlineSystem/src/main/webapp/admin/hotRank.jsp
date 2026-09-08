<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>热门排行 - 微头条</title>
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
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank" class="active">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <div class="card">
                <h2>热门头条排行榜</h2>
                <div class="search-bar">
                    <span>排序方式：</span>
                    <a href="${pageContext.request.contextPath}/admin?action=hotRank&sortBy=like"
                       class="btn ${sortBy == 'like' ? 'btn-primary' : 'btn-default'} btn-sm">按点赞数</a>
                    <a href="${pageContext.request.contextPath}/admin?action=hotRank&sortBy=comment"
                       class="btn ${sortBy == 'comment' ? 'btn-primary' : 'btn-default'} btn-sm">按评论数</a>
                    <a href="${pageContext.request.contextPath}/admin?action=hotRank&sortBy=view"
                       class="btn ${sortBy == 'view' ? 'btn-primary' : 'btn-default'} btn-sm">按浏览量</a>
                </div>
                <table>
                    <thead>
                    <tr><th>排名</th><th>标题</th><th>作者</th><th>类型</th>
                        <th>点赞数</th><th>评论数</th><th>浏览量</th><th>发布时间</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${rankList}" var="h" varStatus="status">
                        <tr>
                            <td>
                                <c:choose>
                                    <c:when test="${status.index == 0}"><span style="color:#faad14;font-weight:bold;font-size:18px;">1</span></c:when>
                                    <c:when test="${status.index == 1}"><span style="color:#8c8c8c;font-weight:bold;font-size:18px;">2</span></c:when>
                                    <c:when test="${status.index == 2}"><span style="color:#d46b08;font-weight:bold;font-size:18px;">3</span></c:when>
                                    <c:otherwise>${status.index + 1}</c:otherwise>
                                </c:choose>
                            </td>
                            <td><a href="${pageContext.request.contextPath}/headline?action=detail&hid=${h.hid}" target="_blank">${h.title}</a></td>
                            <td>${h.publisherNick}</td>
                            <td><span class="tag">${h.typeName}</span></td>
                            <td style="color:#fa541c;font-weight:bold;">${h.likeCount}</td>
                            <td>${h.commentCount}</td>
                            <td>${h.viewCount}</td>
                            <td>${h.createTime}</td>
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
