<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>个人中心 - 微头条</title>
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
        <h2>个人信息</h2>
        <c:if test="${not empty msg}">
            <div class="msg msg-error">${msg}</div>
        </c:if>
        <table>
            <tr><th>用户名</th><td>${user.username}</td></tr>
            <tr><th>昵称</th><td>${user.nickname}</td></tr>
            <tr><th>角色</th><td>${user.role == 1 ? '管理员' : '普通用户'}</td></tr>
            <tr><th>注册时间</th><td>${user.registerTime}</td></tr>
        </table>
    </div>

    <div class="card">
        <h2>修改密码</h2>
        <form method="post" action="${pageContext.request.contextPath}/user">
            <input type="hidden" name="action" value="updatePwd">
            <div class="form-group">
                <label>旧密码</label>
                <input type="password" name="oldPwd" required>
            </div>
            <div class="form-group">
                <label>新密码</label>
                <input type="password" name="newPwd" required>
            </div>
            <div class="form-group">
                <label>确认新密码</label>
                <input type="password" name="confirmNewPwd" required>
            </div>
            <button type="submit" class="btn btn-primary">确认修改</button>
        </form>
    </div>
</div>
</body>
</html>
