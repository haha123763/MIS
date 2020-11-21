<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- 页面meta -->
    <jsp:include page="../meta.jsp"></jsp:include>

    <!-- Tell the browser to be responsive to screen width -->
    <meta
            content="width=device-width,initial-scale=1,maximum-scale=1,paper-scalable=no"
            name="viewport">
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
                论文成果管理 <small>论文列表</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="${pageContext.request.contextPath}/index.jsp"><i
                        class="fa fa-dashboard"></i> 首页</a></li>
                <li><a
                        href="${pageContext.request.contextPath}/paper/findAll.do">论文成果管理</a></li>

                <li class="active">论文列表</li>
            </ol>
        </section>
        <!-- 内容头部 /-->

        <!-- 正文区域 -->
        <section class="content">

             <div class="panel panel-default">
                <div class="panel-heading">论文信息</div>
                <div class="row data-type">
                    <div class="col-md-2 title">编号</div>
                    <div class="col-md-4 data text">${paper.id }</div>
                    <div class="col-md-2 title">论文标题</div>
                    <div class="col-md-4 data text">${paper.title}</div>
                    <div class="col-md-2 title">作者列表</div>
                    <div class="col-md-4 data text">${paper.authors}</div>
                    <div class="col-md-2 title">刊物(会议)名称</div>
                    <div class="col-md-4 data text">${paper.pc_name}</div>
                    <div class="col-md-2 title">年份</div>
                    <div class="col-md-4 data text">${paper.year }</div>
                    <div class="col-md-2 title">论著类别</div>
                    <div class="col-md-4 data text">${paper.category}</div>
                    <div class="col-md-2 title">论著收录情况</div>
                    <div class="col-md-4 data text">${paper.inclusion}</div>
                    <div class="col-md-2 title">影响因子</div>
                    <div class="col-md-4 data text">${paper.impact}</div>
                    <div class="col-md-2 title">SCI分区</div>
                    <div class="col-md-4 data text">${paper.sci}</div>
                    <div class="col-md-2 title">填报人是否第一作者</div>
                    <div class="col-md-4 data text">${paper.firstAuthor}</div>
                    <div class="col-md-2 title">填报人是否通讯作者</div>
                    <div class="col-md-4 data text">${paper.corAuthor}</div>
                    <div class="col-md-2 title">填报人的作者排名</div>
                    <div class="col-md-4 data text">${paper.rank}</div>
                    <div class="col-md-2 title">卷</div>
                    <div class="col-md-4 data text">${paper.volume}</div>
                    <div class="col-md-2 title">期</div>
                    <div class="col-md-4 data text">${paper.issue}</div>
                    <div class="col-md-2 title">页码</div>
                    <div class="col-md-4 data text">${paper.page}</div>
                    <div class="col-md-2 title">论文pdf</div>
                    <div class="col-md-4 data text"><a href="${pageContext.request.contextPath}/paper/downLoadFile.do?id=${paper.id}">${paper.paperFile}</a></div>
                </div>
            </div>
                    <button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>

            <!--工具栏/-->
        </section>
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