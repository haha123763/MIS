<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<!-- 页面meta -->
	<jsp:include page="../meta.jsp"></jsp:include>

<!-- Tell the browser to be responsive to screen width -->
<meta	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"	name="viewport">

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
					项目成果管理 <small>项目详情</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/index.jsp"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li><a
							href="${pageContext.request.contextPath}/project/findAll.do">项目成果管理</a></li>

					<li class="active">项目详情</li>
				</ol>
			</section>
			<!-- 内容头部 /-->


				<!-- 正文区域 -->
				<section class="content">
					<div class="panel panel-default">
						<div class="panel-heading">${project.category}项目信息</div>
						<div class="row data-type">

							<div class="col-md-2 title">id</div>
							<div class="col-md-4 data">${project.id}</div>
							<div class="col-md-2 title">课题编号</div>
							<div class="col-md-4 data">${project.number}</div>
							<div class="col-md-2 title">课题名称</div>
							<div class="col-md-4 data">${project.name}</div>
							<div class="col-md-2 title">开始日期</div>
							<div class="col-md-4 data">${project.startDate}</div>
							<div class="col-md-2 title">结束日期</div>
							<div class="col-md-4 data">${project.endDate}</div>
							<div class="col-md-2 title">课题负责人</div>
							<div class="col-md-4 data">${project.leader}</div>
							<div class="col-md-2 title">填报人课题排名</div>
							<div class="col-md-4 data">${project.rank}</div>
							<div class="col-md-2 title">课题类别</div>
							<div class="col-md-4 data" id="category">${project.category}</div>
							<div class="col-md-2 title" >课题来源</div>
							<div class="col-md-4 data">${project.source}</div>
							<div class="col-md-2 title">课题总经费</div>
							<div class="col-md-4 data">${project.totalFund}</div>
							<div class="col-md-2 title" id="receivedFund1">已到账经费</div>
							<div class="col-md-4 data" id="receivedFund2">${project.receivedFund}</div>
							<div class="col-md-2 title" id="scanFile1">扫描件</div>
							<div class="col-md-4 data" id="scanFile2">${project.scanFile}</div>

						</div>
					</div>
			 <!--工具栏-->
				<div class="box-tools text-center">
					<button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
				</div>
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

	</script>


</body>

</html>