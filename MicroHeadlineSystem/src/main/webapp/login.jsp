<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>登录 - 微头条</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/css/style.css">
</head>
<body>
<div class="auth-box">
    <h1>微头条系统</h1>
    <div class="card">
        <h2>用户登录</h2>
        <c:if test="${not empty msg}">
            <div class="msg msg-error">${msg}</div>
        </c:if>
        <c:if test="${not empty msgSuccess}">
            <div class="msg msg-success">${msgSuccess}</div>
        </c:if>
        <form method="post" action="${pageContext.request.contextPath}/user">
            <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label>用户名</label>
                <input type="text" name="username" required>
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary" style="width:100%">登录</button>
        </form>
        <p style="text-align:center;margin-top:16px;font-size:14px;">
            没有账号？<a href="${pageContext.request.contextPath}/user?action=toRegister">立即注册</a>
        </p>
        <p style="text-align:center;margin-top:8px;font-size:12px;color:#999;">
            管理员账号：admin / 123456
        </p>
    </div>
</div>
</body>
</html>
