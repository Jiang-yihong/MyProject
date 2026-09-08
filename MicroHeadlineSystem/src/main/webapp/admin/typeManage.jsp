<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>类型管理 - 微头条</title>
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
                <li><a href="${pageContext.request.contextPath}/type?action=list" class="active">类型管理</a></li>
                <li><a href="${pageContext.request.contextPath}/announcement?action=list">公告管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=commentManage">评论管理</a></li>
                <li><a href="${pageContext.request.contextPath}/admin?action=hotRank">热门排行</a></li>
            </ul>
        </div>
        <div class="admin-main">
            <c:if test="${not empty sessionScope.msg}">
                <div class="msg msg-error">${sessionScope.msg}</div>
                <c:remove var="msg" scope="session"/>
            </c:if>
            <div class="card">
                <h2>新增类型</h2>
                <form method="post" action="${pageContext.request.contextPath}/type" class="search-bar">
                    <input type="hidden" name="action" value="add">
                    <input type="text" name="typeName" placeholder="类型名称" required>
                    <button class="btn btn-primary btn-sm" type="submit">新增</button>
                </form>
            </div>
            <div class="card">
                <h2>类型列表</h2>
                <table>
                    <thead>
                    <tr><th>ID</th><th>类型名称</th><th>操作</th></tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${types}" var="t">
                        <tr>
                            <td>${t.typeId}</td>
                            <td>
                                <form method="post" action="${pageContext.request.contextPath}/type" style="display:inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="typeId" value="${t.typeId}">
                                    <input type="text" name="typeName" value="${t.typeName}" required style="width:150px;">
                                    <button class="btn btn-default btn-sm" type="submit">保存</button>
                                </form>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/type?action=delete&typeId=${t.typeId}"
                                   class="btn btn-danger btn-sm"
                                   onclick="return confirm('确定删除该类型？若有关联头条将无法删除！')">删除</a>
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
