<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
				专利成果管理 <small>专利列表</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
						href="${pageContext.request.contextPath}/patent/findAll.do">专利成果管理</a></li>

				<li class="active">专利编辑</li>
			</ol>
		</section>
		<!-- 内容头部 /-->

		<form action="${pageContext.request.contextPath}/patent/update.do"
			  method="post">
			<!-- 正文区域 -->
			<section class="content">
				<div class="panel panel-default">
					<div class="panel-heading">专利信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">id</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="id" required="required" value="${patent.id}" name="id" readonly="readonly">
						</div>
						<div class="col-md-2 title">专利名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="专利名称" required="required" name="name" value="${patent.name}">
						</div>
						<div class="col-md-2 title">申请编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="申请编号" name="appnum"  value="${patent.appnum}">
						</div>
						<div class="col-md-2 title">申请人列表</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="申请人列表" name="patentee"  value="${patent.patentee}">
						</div>


						<div class="col-md-2 title">专利类型</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="type" style="width: 100%;">
								<option value="${patent.type}" selected="selected">${patent.type}</option>
								<option value="发明专利">发明专利</option>
								<option value="实用新型">实用新型</option>
								<option value="PCT或国外申请专利">PCT或国外申请专利</option>
							</select>
						</div>
						<div class="col-md-2 title">专利状态</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="status" style="width: 100%;">
								<option value="${patent.status}" selected="selected">${patent.status}</option>
								<option value="初审" >初审</option>
								<option value="实审">实审</option>
								<option value="授权">授权</option>
								<option value="未批准">未批准</option>
							</select>
						</div>

						<div class="col-md-2 title">填报人的专利排名</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="填报人的作者排名" name="rank" value="${patent.rank}">
						</div>

						<div class="col-md-2 title">证书编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="证书编号" name="volume" value="${patent.certnum}">
						</div>
						<div class="col-md-2 title">申请日期</div>
						<div class="col-md-4 data">
							<input type="date" class="form-control pull-right" name="applicationDate" value="${patent.applicationDate}">
						</div>
						<div class="col-md-2 title">实审日期</div>
						<div class="col-md-4 data">
							<input type="date" class="form-control pull-right" name="checkDate"  value="${patent.checkDate}">
						</div>
						<div class="col-md-2 title">批准日期</div>
						<div class="col-md-4 data">
							<input type="date" class="form-control pull-right" name="approvalDate"  value="${patent.approvalDate}">
						</div>
						<div class="col-md-2 title">扫描件</div>
							<div class="col-md-4 data">
								<input type="file"  class="form-control" id="exampleInputFile1">
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