<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 页面meta -->
	<jsp:include page="../meta.jsp"></jsp:include>

	<!-- Tell the browser to be responsive to screen width -->
	<meta
			content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
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
				软著成果管理 <small>软著编辑</small>
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

		<form action="${pageContext.request.contextPath}/softWork/update.do"
			  method="post">
			<!-- 正文区域 -->
			<section class="content">
				<div class="panel panel-default">
					<div class="panel-heading">软著信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">id</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="论文编号" value="${softWork.id}" name="id"  required="required" readonly="readonly">
						</div>

						<div class="col-md-2 title">软著名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="软著名称" name="name" required="required" value="${softWork.name}">
						</div>
						<div class="col-md-2 title">申请人列表</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="申请人列表" name="applicant"  value="${softWork.applicant}">
						</div>
						<div class="col-md-2 title">状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="status" style="width: 100%;">
								<option value="${softWork.status}" selected="selected">${softWork.status}</option>
								<option value="申请">申请</option>
								<option value="获批">获批</option>
								<option value="未批准">未批准</option>
							</select>
						</div>
						<div class="col-md-2 title">申请日期</div>
						<div class="col-md-4 data">
							<input type="date" class="form-control pull-right" name="applyDate" value="${softWork.applyDate}">
						</div>
						<div class="col-md-2 title">授权日期</div>
						<div class="col-md-4 data">
							<input type="date" class="form-control pull-right" name="authDate" value="${softWork.authDate}">
						</div>
						<div class="col-md-2 title">软著编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="软著编号" name="impact" value="${softWork.number}">
						</div>



						<div class="col-md-2 title">填报人的作者排名</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="填报人的作者排名" name="rank" value="${softWork.rank}">
						</div>

						<div class="col-md-2 title">论文pdf</div>
						<div class="col-md-4 data">
							<input type="file"  class="form-control" id="exampleInputFile">
						</div>


					</div>
				</div>
				<!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
							onclick="history.back(-1);">返回</button>
				</div>
				<!--工具栏/--> </section>
			<!-- 正文区域 /-->
		</form>
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