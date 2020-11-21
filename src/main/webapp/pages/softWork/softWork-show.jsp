<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <jsp:include page="../meta.jsp"></jsp:include>
    <jsp:include page="../link.jsp"></jsp:include>
</head>

<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">

    <!-- 页面头部 -->
    <jsp:include page="../header.jsp"></jsp:include>
    <!-- 页面头部 /-->

    <!-- 导航侧栏 -->
    <jsp:include page="../aside.jsp"></jsp:include>
    <!-- 导航侧栏 /-->

    <!-- 内容区域 -->
    <div class="content-wrapper">

        <!-- 内容头部 -->
        <section class="content-header">
            <h1>
                软著成果管理 <small>软著详情</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/softWork/findAll.do">软著成果管理</a></li>

                <li class="active">软著信息</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

             <div class="panel panel-default">
                <div class="panel-heading">软著信息</div>
                <div class="row data-type">

                    <div class="col-md-2 title">id</div>
                    <div class="col-md-4 data text">${softWork.id }</div>
                    <div class="col-md-2 title">软著名称</div>
                    <div class="col-md-4 data text">${softWork.name}</div>
                    <div class="col-md-2 title">申请人列表</div>
                    <div class="col-md-4 data text">${softWork.applicant}</div>
                    <div class="col-md-2 title">状态</div>
                    <div class="col-md-4 data text">${softWork.status}</div>
                    <div class="col-md-2 title">申请日期</div>
                    <div class="col-md-4 data">${softWork.applyDate}</div>
                    <div class="col-md-2 title">授权日期</div>
                    <div class="col-md-4 data">${softWork.authDate}</div>
                    <div class="col-md-2 title">软著编号</div>
                    <div class="col-md-4 data text">${softWork.number}</div>
                    <div class="col-md-2 title">填报人的作者排名</div>
                    <div class="col-md-4 data text">${softWork.rank}</div>

                    <div class="col-md-2 title">软著证书扫描件</div>
                    <div class="col-md-4 data">
                        <div class="col-md-4 data text"><a href="${pageContext.request.contextPath}/softWork/downLoadFile.do?id=${softWork.id}">${softWork.scanFile}</a></div>
                    </div>
                </div>
            </div>
                    <button type="button" class="btn bg-default"
                        onclick="history.back(-1);">返回</button>

            <!--工具栏/--> </section>
        <!-- 正文区域 /-->


    </div>
    <!-- 内容区域 /-->



</div>
<jsp:include page="../js.jsp"></jsp:include>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale : 'zh-CN'
        });
    });

    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("order-manage");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass : 'icheckbox_square-blue',
            increaseArea : '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });
    });
</script>
</body>


</html>