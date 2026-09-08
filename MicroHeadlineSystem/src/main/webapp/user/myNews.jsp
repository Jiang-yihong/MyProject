<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>我的头条 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="logo">微头条系统</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/headline?action=list">首页</a>
        <a href="${pageContext.request.contextPath}/headline?action=my">我的头条</a>
        <a href="${pageContext.request.contextPath}/headline?action=toPublish">发布头条</a>
        <a href="${pageContext.request.contextPath}/user?action=personal">个人中心</a>
    </div>
    <div class="user-info">
        欢迎，${loginNick}
        <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>我的头条</h2>
        <form class="search-bar" method="get" action="${pageContext.request.contextPath}/headline">
            <input type="hidden" name="action" value="my">
            <input type="text" name="keyword" placeholder="搜索标题或内容" value="${keyword}">
            <select name="typeId">
                <option value="0">全部类型</option>
                <c:forEach items="${types}" var="t">
                    <option value="${t.typeId}">${t.typeName}</option>
                </c:forEach>
            </select>
            <button class="btn btn-primary btn-sm" type="submit">搜索</button>
            <a href="${pageContext.request.contextPath}/headline?action=toPublish" class="btn btn-success btn-sm">发布新头条</a>
        </form>

        <table>
            <thead>
            <tr>
                <th>ID</th><th>标题</th><th>类型</th><th>发布时间</th>
                <th>浏览</th><th>点赞</th><th>评论</th><th>操作</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${myList}" var="h">
                <tr>
                    <td>${h.hid}</td>
                    <td><a href="${pageContext.request.contextPath}/headline?action=detail&hid=${h.hid}">${h.title}</a></td>
                    <td><span class="tag">${h.typeName}</span></td>
                    <td>${h.createTime}</td>
                    <td>${h.viewCount}</td>
                    <td>${h.likeCount}</td>
                    <td>${h.commentCount}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/headline?action=toEdit&hid=${h.hid}" class="btn btn-default btn-sm">修改</a>
                        <a href="${pageContext.request.contextPath}/headline?action=delete&hid=${h.hid}"
                           class="btn btn-danger btn-sm"
                           onclick="return confirm('确定删除该头条？删除后关联的点赞和评论将一并清除！')">删除</a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <c:if test="${empty myList}">
            <p style="text-align:center;color:#999;padding:20px;">暂无头条，点击右上角发布新头条</p>
        </c:if>
    </div>
</div>
</body>
</html>
