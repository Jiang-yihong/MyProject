<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>修改头条 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="navbar">
    <div class="logo">微头条系统</div>
    <div class="nav-links">
        <a href="${pageContext.request.contextPath}/headline?action=list">首页</a>
        <a href="${pageContext.request.contextPath}/headline?action=my">我的头条</a>
        <a href="${pageContext.request.contextPath}/user?action=personal">个人中心</a>
    </div>
    <div class="user-info">
        欢迎，${loginNick}
        <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
    </div>
</div>

<div class="container">
    <div class="card">
        <h2>修改头条</h2>
        <form method="post" action="${pageContext.request.contextPath}/headline">
            <input type="hidden" name="action" value="edit">
            <input type="hidden" name="hid" value="${headline.hid}">
            <div class="form-group">
                <label>标题</label>
                <input type="text" name="title" value="${headline.title}" required maxlength="200">
            </div>
            <div class="form-group">
                <label>类型（不可修改）</label>
                <input type="text" value="${headline.typeName}" disabled style="background:#f5f5f5;">
            </div>
            <div class="form-group">
                <label>内容（最多5000字）</label>
                <textarea name="content" rows="12" required maxlength="5000">${headline.content}</textarea>
            </div>
            <button type="submit" class="btn btn-primary">保存修改</button>
            <a href="${pageContext.request.contextPath}/headline?action=my" class="btn btn-default">取消</a>
        </form>
    </div>
</div>
</body>
</html>
