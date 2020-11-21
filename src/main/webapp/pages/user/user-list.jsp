<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				用户管理 <small>全部用户</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findAllByRole.do?role=ROLE_USER">用户管理</a></li>

				<li class="active">全部用户</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">列表 </h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div class="pull-left">
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建"   onclick="location.href='${pageContext.request.contextPath}/pages/user/user-add.jsp'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										<button type="button" class="btn btn-danger" title="删除"  id="delSelected">
											<i class="fa fa-file-o"></i> 删除
										</button>
										<button id="importUsers" type="button" class="btn btn-default" title="批量导入用户" >
											<i class="fa fa-file-o"></i> 批量导入用户
										</button>
									</div>
								</div>
							</div>
							<form id="form" action="${pageContext.request.contextPath}/user/deleteSelect.do" method="post">
							<!--数据列表-->
								<table id="dataList"
									class="table table-bordered table-striped table-hover dataTable">
									<thead>
										<tr>
											<td >
												<input	type="checkbox" id="all" class="icheckbox_square-blue" onclick="selectAll(this)">
											</td>
											<th class="sorting_asc">ID</th>
											<th class="sorting_desc">用户名</th>
											<th class="sorting_asc sorting_asc_disabled">中文名</th>
											<th class="sorting_desc sorting_desc_disabled">英文名</th>
											<th class="text-center">职称</th>
											<th class="text-center">所在系</th>
											<th class="">操作</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${pageInfo.list}" var="user">
											<tr>
												<td><input class="itemSelect" type="checkbox" name="uid" value="${user.id}"></td>
												<td>${user.id}</td>
												<td>${user.username }</td>
												<td>${user.chinese_name }</td>
												<td>${user.english_name}</td>
												<td>${user.job_title}</td>
												<td>${user.department}</td>
												<td class="text-center">
													<a href="${pageContext.request.contextPath}/user/findById.do?id=${user.id}" class="btn bg-olive btn-xs">详情</a>
													<a href="${pageContext.request.contextPath}/user/editById.do?id=${user.id}" class="btn bg-olive btn-xs">编辑</a>
													<a href="${pageContext.request.contextPath}/user/deleteById.do?id=${user.id}" class="btn bg-olive btn-xs" onclick="return confirm('你确认要删除该用户吗？')">删除</a>
												</td>
											</tr>
										</c:forEach>
									</tbody>

								</table>
								<!--数据列表/-->
							</form>
						</div>
						<!-- 数据表格 /-->

					</div>
					<!-- /.box-body -->

					<!-- .box-footer-->
					<div class="box-footer">
						<div class="pull-left">
							<div class="form-group form-inline">
								总共${pageInfo.pages}页，共${pageInfo.size}条数据。 每页
								<select class="form-control" id="changePageSize" onchange="changePageSize()">
									<option>2</option>
									<option>4</option>
									<option>6</option>
									<option>8</option>
									<option>10</option>
								</select> 条
							</div>
						</div>
						<div class="box-tools pull-right">
							<ul class="pagination">
								<li>
									<a href="${pageContext.request.contextPath}/user/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
								<li>
									<a href="${pageContext.request.contextPath}/user/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
								</li>
							</ul>
						</div>
					</div>
					<!-- /.box-footer-->

				</div>

				</section>
				<!-- 正文区域 /-->

			</div>
			<!-- @@close -->
			<!-- 内容区域 /-->


		</div>

	<!-- 导入用户信息模态框 -->
	<div class="modal fade" id="import_modal" table-index="-1" role="dialog"
		 aria-labelledby="myModalLabel" aria-hidden="true"
		 data-backdrop="static">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" type="button" data-dismiss="modal"
							aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel">导入用户信息</h4>
				</div>
				<div class="modal-body">
					<div id="step1">
						<div class="row" style="margin-top: 15px">
							<div class="col-md-1 col-sm-1"></div>
							<div class="col-md-10 col-sm-10">
								<div>
									<h4>点击下面的下载按钮，下载用户信息电子表格</h4>
								</div>
								<div style="margin-top: 30px; margin-buttom: 15px">
									<a class="btn btn-info" href="${pageContext.request.contextPath}/commons/fileSource/download.do?fileName=userInfo.xlsx"
									   target="_blank"> <span class="glyphicon glyphicon-download"></span>
										<span>下载</span>
									</a>
								</div>
							</div>
						</div>
					</div>
					<div id="step2" class="hide">
						<div class="row" style="margin-top: 15px">
							<div class="col-md-1 col-sm-1"></div>
							<div class="col-md-10 col-sm-10">
								<div>
									<h4>请按照信息电子表格中指定的格式填写需要添加的一个或多个用户信息</h4>
								</div>
								<div class="alert alert-info" style="margin-top: 10px; margin-buttom: 30px">
									<p>注意：表格中用户id，用户名，密码不能为空，若存在未填写的项，则该条信息将不能成功导入</p>
								</div>
							</div>
						</div>
					</div>
					<div id="step3" class="hide">
						<div class="row" style="margin-top: 15px">
							<div class="col-md-1 col-sm-1"></div>
							<div class="col-md-8 col-sm-10">
								<div>
									<div>
										<h4>请点击下面上传文件按钮，上传填写好的用户信息电子表格</h4>
									</div>
									<div style="margin-top: 30px; margin-buttom: 15px">
										<span class="btn btn-info btn-file">
											<span>
												<span class="glyphicon glyphicon-upload">											</span>
												<span>上传文件</span>
											</span>
											<form id="import_file_upload">
												<input type="file" id="file" name="file">
											</form>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="hide" id="uploading">
						<div class="row" style="margin-top: 15px" id="import_progress_bar">
							<div class="col-md-1 col-sm-1"></div>
							<div class="col-md-10 col-sm-10"
								 style="margin-top: 30px; margin-bottom: 30px">
								<div class="progress progress-striped active">
									<div class="progress-bar progress-bar-success"
										 role="progreessbar" aria-valuenow="60" aria-valuemin="0"
										 aria-valuemax="100" style="width: 100%;">
										<span class="sr-only">请稍后...</span>
									</div>
								</div>

							</div>
							<div class="col-md-1 col-sm-1"></div>
						</div>
						<div class="row">
							<div class="col-md-4 col-sm-4"></div>
							<div class="col-md-4 col-sm-4">
								<div id="import_result" class="hide">
									<div id="import_success" class="hide" style="text-align: center;">
										<img src="../../media/icons/success-icon.png" alt=""
											 style="width: 100px; height: 100px;">
									</div>
									<div id="import_error" class="hide" style="text-align: center;">
										<img src="../../media/icons/error-icon.png" alt=""
											 style="width: 100px; height: 100px;">
									</div>
								</div>
							</div>
							<div class="col-md-4 col-sm-4"></div>
						</div>
						<div class="row" style="margin-top: 10px">
							<div class="col-md-3 col-sm-3"></div>
							<div class="col-md-6 col-sm-6" style="text-align: center;">
								<h4 id="import_info"></h4>
							</div>
							<div class="col-md-3 col-sm-3"></div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button class="btn ben-default" type="button" id="previous">
						<span>上一步</span>
					</button>
					<button class="btn btn-success" type="button" id="next">
						<span>下一步</span>
					</button>
					<button class="btn btn-success hide" type="button" id="submit">
						<span>&nbsp;&nbsp;&nbsp;提交&nbsp;&nbsp;&nbsp;</span>
					</button>
					<button class="btn btn-success hide disabled" type="button"
							id="confirm" data-dismiss="modal">
						<span>&nbsp;&nbsp;&nbsp;确认&nbsp;&nbsp;&nbsp;</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="../js.jsp"></jsp:include>
	<script>
			function changePageSize() {
				//获取下拉框的值
				var pageSize = $("#changePageSize").val();
				//向服务器发送请求，改变没页显示条数
				location.href = "${pageContext.request.contextPath}/user/findAll.do?page=1&size="
						+ pageSize;
			}
			document.getElementById("delSelected").onclick=function () {
				var length=$("input[type='checkbox']:checked").length;
				if(document.getElementById("all").checked){
					length--;
				}
				if(length>0&&confirm("你确定要删除选中的"+length+"个用户吗?")) {
					document.getElementById("form").submit();
				}
			}
			//jquery写法
			function selectAll(obj){
				$(".itemSelect").prop("checked",obj.checked);
			}
			var import_step = 1;
			var import_start = 1;
			var import_end = 3;

			// 导入用户信息

				$('#importUsers').click(function() {
					$('#import_modal').modal("show");
				});

				$('#previous').click(function() {
					if (import_step > import_start) {
						var preID = "step" + (import_step - 1)
						var nowID = "step" + import_step;

						$('#' + nowID).addClass("hide");
						$('#' + preID).removeClass("hide");
						import_step--;
					}
				})

				$('#next').click(function() {
					if (import_step < import_end) {
						var nowID = "step" + import_step;
						var nextID = "step" + (import_step + 1);

						$('#' + nowID).addClass("hide");
						$('#' + nextID).removeClass("hide");
						import_step++;
					}
				})

				$('#file').on("change", function() {
					$('#previous').addClass("hide");
					$('#next').addClass("hide");
					$('#submit').removeClass("hide");
				})

				$('#submit').click(function() {
					var nowID = "step" + import_end;
					$('#' + nowID).addClass("hide");
					$('#uploading').removeClass("hide");

					// next
					$('#confirm').removeClass("hide");
					$('#submit').addClass("hide");


					// ajax
					$.ajaxFileUpload({
						url : "${pageContext.request.contextPath}/user/importUsers.do",
						secureuri: false,
						dataType: 'json',
						fileElementId:"file",
						success : function(data, status){
							var total = 0;
							var available = 0;
							var msg1 = "用户信息导入成功";
							var msg2 = "用户信息导入失败";
							var info;
							$('#import_progress_bar').addClass("hide");
							if(data.result == "success"){
								total = data.total;
								available = data.available;
								info = msg1;
								$('#import_success').removeClass('hide');
							}else{
								info = msg2
								$('#import_error').removeClass('hide');
							}
							info = info + ",总条数：" + total + ",有效条数:" + available;
							$('#import_result').removeClass('hide');
							$('#import_info').text(info);
							$('#confirm').removeClass('disabled');
						},error : function(data, status){
							// handler error
							handleAjaxError(status);
						}
					})
				})

				$('#confirm').click(function() {
					// modal dissmiss
					importModalReset();
				})

		</script>
</body>

</html>