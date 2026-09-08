<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>注册 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="auth-box">
    <h1>微头条系统</h1>
    <div class="card">
        <h2>用户注册</h2>
        <c:if test="${not empty msg}">
            <div class="msg msg-error">${msg}</div>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/user">
            <input type="hidden" name="action" value="register">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>昵称</label>
                <input type="text" name="nickname" required>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" required>
            </div>
            <div class="form-group">
                <label>确认密码</label>
                <input type="password" name="confirmPwd" required>
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%">注册</button>
        </form>
        <p style="text-align:center;margin-top:16px;font-size:14px;">
            已有账号？<a href="${pageContext.request.contextPath}/user?action=toLogin">去登录</a>
        </p>
    </div>
</div>
</body>
</html>
