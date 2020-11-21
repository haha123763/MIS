
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>页面没有找到</title>
</head>
<body>
<!-- 页面头部 -->
<jsp:include page="header.jsp"></jsp:include>
<!-- 页面头部 /-->

<!-- 导航侧栏 -->

<jsp:include page="aside.jsp"></jsp:include>
<!-- 导航侧栏 /-->
<!-- 内容区域 -->
<div class="content-wrapper" >
    <h1>页面没有找到！</h1>
    <a href="${pageContext.request.contextPath}/pages/main.jsp">返回</a>
</div>
<jsp:include page="js.jsp"></jsp:include>
</body>
</html>
