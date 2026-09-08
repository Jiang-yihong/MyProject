<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.micro.service.CommentService" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.List" %>
<%@ page import="com.micro.entity.Comment" %>
<%
    CommentService commentService = new CommentService();
    Integer hid = (Integer) request.getAttribute("headline") != null ?
            ((com.micro.entity.NewsHeadline) request.getAttribute("headline")).getHid() : null;
    String order = (String) request.getAttribute("order");
    if (order == null) order = "desc";
    Map<String, Object> commentData = null;
    if (hid != null) {
        commentData = commentService.getCommentsByHid(hid, order);
    }
    request.setAttribute("commentData", commentData);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${headline.title} - 微头条</title>
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
                欢迎，${loginNick}
                <a href="${pageContext.request.contextPath}/user?action=logout">退出</a>
            </c:when>
            <c:otherwise>
                <a href="${pageContext.request.contextPath}/user?action=toLogin">登录</a>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<div class="container">
    <c:if test="${not empty sessionScope.msg}">
        <div class="msg msg-error">${sessionScope.msg}</div>
        <c:remove var="msg" scope="session"/>
    </c:if>

    <div class="card">
        <h1 style="font-size:24px;margin-bottom:12px;">${headline.title}</h1>
        <div class="meta" style="font-size:13px;color:#999;margin-bottom:16px;">
            <span>作者：${headline.publisherNick}</span>
            <span class="tag">${headline.typeName}</span>
            <span>发布：${headline.createTime}</span>
            <span>浏览：${headline.viewCount}</span>
        </div>
        <div style="line-height:1.8;font-size:15px;white-space:pre-wrap;">${headline.content}</div>

        <div style="margin-top:24px;padding-top:16px;border-top:1px solid #f0f0f0;display:flex;gap:16px;align-items:center;">
            <c:choose>
                <c:when test="${liked}">
                    <form method="post" action="${pageContext.request.contextPath}/like" style="display:inline;">
                        <input type="hidden" name="action" value="cancel">
                        <input type="hidden" name="hid" value="${headline.hid}">
                        <button type="submit" class="btn btn-danger btn-sm">取消点赞 (${headline.likeCount})</button>
                    </form>
                </c:when>
                <c:otherwise>
                    <form method="post" action="${pageContext.request.contextPath}/like" style="display:inline;">
                        <input type="hidden" name="action" value="do">
                        <input type="hidden" name="hid" value="${headline.hid}">
                        <button type="submit" class="btn btn-primary btn-sm">点赞 (${headline.likeCount})</button>
                    </form>
                </c:otherwise>
            </c:choose>
            <span style="color:#666;">评论数：${headline.commentCount}</span>
            <span style="margin-left:auto;">
                排序：
                <a href="?action=detail&hid=${headline.hid}&order=asc" class="${order == 'asc' ? '' : ''}">正序</a>
                <a href="?action=detail&hid=${headline.hid}&order=desc">倒序</a>
            </span>
        </div>
    </div>

    <div class="card">
        <h2>发表评论</h2>
        <c:if test="${empty loginUid}">
            <p>请先<a href="${pageContext.request.contextPath}/user?action=toLogin">登录</a>后发表评论</p>
        </c:if>
        <c:if test="${not empty loginUid}">
            <form method="post" action="${pageContext.request.contextPath}/comment">
                <input type="hidden" name="action" value="add">
                <input type="hidden" name="hid" value="${headline.hid}">
                <div class="form-group">
                    <textarea name="content" rows="3" placeholder="写下你的评论（最多500字）" maxlength="500" required></textarea>
                </div>
                <button type="submit" class="btn btn-primary btn-sm">发表评论</button>
            </form>
        </c:if>
    </div>

    <div class="card">
        <h2>全部评论</h2>
        <c:forEach items="${commentData.roots}" var="root">
            <div class="comment-item">
                <div class="comment-meta">
                    <strong>${root.userNick}</strong>
                    <span style="margin-left:8px;">${root.createTime}</span>
                    <c:if test="${not empty loginUid && (loginUid == root.uid || loginRole == 1)}">
                        <a href="${pageContext.request.contextPath}/comment?action=delete&cid=${root.cid}&hid=${headline.hid}"
                           style="margin-left:8px;color:#ff4d4f;"
                           onclick="return confirm('确定删除该评论？')">删除</a>
                    </c:if>
                </div>
                <div class="comment-content">${root.content}</div>

                <c:if test="${not empty loginUid}">
                    <div style="margin-top:8px;">
                        <a href="javascript:void(0)" onclick="document.getElementById('replyForm${root.cid}').style.display='block'">回复</a>
                    </div>
                    <form id="replyForm${root.cid}" method="post" action="${pageContext.request.contextPath}/comment" style="display:none;margin-top:8px;">
                        <input type="hidden" name="action" value="add">
                        <input type="hidden" name="hid" value="${headline.hid}">
                        <input type="hidden" name="parentCid" value="${root.cid}">
                        <div style="display:flex;gap:8px;">
                            <input type="text" name="content" placeholder="回复 ${root.userNick}" maxlength="500" style="flex:1;padding:6px;">
                            <button type="submit" class="btn btn-primary btn-sm">回复</button>
                        </div>
                    </form>
                </c:if>

                <c:forEach items="${commentData.childMap[root.cid]}" var="child">
                    <div class="comment-reply">
                        <div class="comment-meta">
                            <strong>${child.userNick}</strong>
                            <span style="margin-left:8px;">${child.createTime}</span>
                            <c:if test="${not empty loginUid && (loginUid == child.uid || loginRole == 1)}">
                                <a href="${pageContext.request.contextPath}/comment?action=delete&cid=${child.cid}&hid=${headline.hid}"
                                   style="margin-left:8px;color:#ff4d4f;"
                                   onclick="return confirm('确定删除该评论？')">删除</a>
                            </c:if>
                        </div>
                        <div class="comment-content">${child.content}</div>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
        <c:if test="${empty commentData.roots}">
            <p style="text-align:center;color:#999;padding:20px;">暂无评论，快来抢沙发吧！</p>
        </c:if>
    </div>
</div>
</body>
</html>
