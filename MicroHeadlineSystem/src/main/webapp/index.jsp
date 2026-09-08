<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>微头条 - 首页</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="logo">微头条系统</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/headline?action=list">首页</a>
        <c:if test="${not empty loginUid}">
            <a href="${pageContext.request.contextPath}/headline?action=my">我的头条</a>
            <a href="${pageContext.request.contextPath}/headline?action=toPublish">发布头条</a>
            <a href="${pageContext.request.contextPath}/user?action=personal">个人中心</a>
            <c:if test="${loginRole == 1}">
                <a href="${pageContext.request.contextPath}/admin?action=index">管理面板</a>
            </c:if>
        </c:if>
    </div>
    <div class="user-info">
        <c:choose>
            <c:when test="${not empty loginUid}">
                欢迎，${loginNick}（${loginRole == 1 ? '管理员' : '普通用户'}）
                <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/user?action=toLogin">登录</a>
                <a href="${pageContext.request.contextPath}/user?action=toRegister">注册</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container">
    <c:if test="${not empty msg}">
        <div class="msg msg-error">${msg}</div>
    </c:if>

    <div class="card">
        <h2>全部头条</h2>
        <form class="search-bar" method="get" action="${pageContext.request.contextPath}/headline">
            <input type="hidden" name="action" value="list">
            <input type="text" name="keyword" placeholder="搜索标题或内容" value="${keyword}">
            <select name="typeId">
                <option value="0">全部类型</option>
                <c:forEach items="${types}" var="t">
                    <option value="${t.typeId}" ${typeId == t.typeId ? 'selected' : ''}>${t.typeName}</option>
                </c:forEach>
            </select>
            <button class="btn btn-primary btn-sm" type="submit">搜索</button>
        </form>

        <c:forEach items="${pageBean.dataList}" var="h">
            <div class="headline-item">
                <div class="title">
                    <a href="${pageContext.request.contextPath}/headline?action=detail&hid=${h.hid}">${h.title}</a>
                </div>
                <div class="meta">
                    <span>作者：${h.publisherNick}</span>
                    <span class="tag">${h.typeName}</span>
                    <span>发布：${h.createTime}</span>
                    <span>浏览：${h.viewCount}</span>
                    <span>点赞：${h.likeCount}</span>
                    <span>评论：${h.commentCount}</span>
                </div>
                <div class="summary">${fn:substring(h.content, 0, 100)}...</div>
            </div>
        </c:forEach>

        <div class="pagination">
            <c:forEach begin="1" end="${pageBean.totalPage}" var="p">
                <c:choose>
                    <c:when test="${p == pageBean.pageNum}">
                        <span class="current">${p}</span>
                    </c:when>
                    <c:otherwise>
                        <a href="${pageContext.request.contextPath}/headline?action=list&pageNum=${p}&keyword=${keyword}&typeId=${typeId}">${p}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>
