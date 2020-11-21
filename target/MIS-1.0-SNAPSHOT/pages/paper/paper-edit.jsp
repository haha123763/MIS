<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
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

		<form action="${pageContext.request.contextPath}/paper/update.do"  enctype="multipart/form-data"  method="post">
			<!-- 正文区域 -->
			<section class="content">
				<div class="panel panel-default">
					<div class="panel-heading">论文信息</div>
					<div class="row data-type">

						<div class="col-md-2 title">论文编号</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" required="required" placeholder="论文编号" value="${paper.id}" name="id" readonly="readonly">
						</div>

						<div class="col-md-2 title">论文标题</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" required="required" placeholder="论文标题" name="title" value="${paper.title}">
						</div>
						<div class="col-md-2 title">作者列表</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="作者列表" name="authors"  value="${paper.authors}">
						</div>
						<div class="col-md-2 title">刊物(会议)名称</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="刊物(会议)名称" name="pc_name" value="${paper.pc_name}">
						</div>

						<div class="col-md-2 title">年份</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="年份" name="year" value="${paper.year}">
						</div>

						<div class="col-md-2 title">论著类别</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="category" style="width: 100%;">
								<option value="${paper.category}" selected="selected">${paper.category}</option>
								<option value="会议">会议</option>
								<option value="期刊">期刊</option>
							</select>
						</div>

						<div class="col-md-2 title">论著收录情况</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="inclusion" style="width: 100%;"><option value="${paper.inclusion}" selected="selected">${paper.inclusion}</option>
								<option value="SCI" >SCI</option>
								<option value="EI">EI</option>
								<option value="北大核心">北大核心</option>
								<option value="中国科学引文数据库（CSCD）">中国科学引文数据库（CSCD）</option>
								<option value="中国科技论文统计源期刊（CSTPCD）">中国科技论文统计源期刊（CSTPCD）</option>
							</select>
						</div>
						<div class="col-md-2 title">影响因子</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="影响因子" name="impact" value="${paper.impact}">
						</div>

						<div class="col-md-2 title">SCI分区</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="sci" style="width: 100%;">
								<option value="${paper.sci}" selected="selected">${paper.sci}</option>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
						</div>
						<div class="col-md-2 title">填报人是否第一作者</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="firstAuthor" style="width: 100%;">
								<option value="${paper.firstAuthor}" selected="selected">${paper.firstAuthor}</option>
								<option value="是">是</option>
								<option value="否">否</option>
							</select>
						</div>
						<div class="col-md-2 title">填报人是否通讯作者</div>
						<div class="col-md-4 data">
							<select class="form-control select2" name="corAuthor" style="width: 100%;">
								<option value="${paper.corAuthor}" selected="selected">${paper.corAuthor}</option>
								<option value="是">是</option>
								<option value="否">否</option>
							</select>
						</div>
						<div class="col-md-2 title">填报人的作者排名</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="填报人的作者排名" name="rank" value="${paper.rank}">
						</div>

						<div class="col-md-2 title">卷</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="卷" name="volume" value="${paper.volume}">
						</div>
						<div class="col-md-2 title">期</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="期" name="issue" value="${paper.issue}">
						</div>
						<div class="col-md-2 title">页码</div>
						<div class="col-md-4 data">
							<input type="text" class="form-control" placeholder="页码" name="page" value="${paper.page}">
						</div>
						<div class="col-md-2 title">论文pdf</div>
						<div class="col-md-4 data">
							<input type="file"  class="form-control" id="exampleInputFile" value="${paper.paperFile}">
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
	function checkForm(form){
		if(!form.file.value == "")
		{
			if(!form.file.value.endsWith(".pdf")) {
				alert("上传文件的类型不匹配,请选择PDF文件");
				$("#file").val("");
				return false;
			}
		}
		return  true;
	}
</script>


</body>

</html>