<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 页面meta -->
	<jsp:include page="../meta.jsp"></jsp:include>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,patent-scalable=no"
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

				</ol>
			</section>
			<!-- 内容头部 /-->

				<!-- 正文区域 -->
				<section class="content"> <!-- .box-body -->
				<div class="box box-primary">
					<div class="box-header with-border">
						<h3 class="box-title">专利列表</h3>
					</div>

					<div class="box-body">

						<!-- 数据表格 -->
						<div class="table-box">

							<!--工具栏-->
							<div >
								<div class="form-group form-inline">
									<div class="btn-group">
										<button type="button" class="btn btn-default" title="新建" onclick="location.href='${pageContext.request.contextPath}/pages/patent/patent-add.jsp'">
											<i class="fa fa-file-o"></i> 新建
										</button>
										<button type="button" class="btn btn-danger" title="删除" id="delSelected">
                                            <i class="fa fa-file-o"></i> 删除 
                                        </button>
									</div>
								</div>
							</div>
                            <div >
                                <form class="form-inline" action="${pageContext.request.contextPath}/patent/selectByTerms.do" method="post">
									<div class="row data-type">
										<div class="form-group">
											<label for="name">名称</label>
											<input type="text" class="form-control" id="name" name="name" value="${condition.name[0]}">
										</div>
										<div class="form-group">
											<label for="appnum">申请编号</label>
											<input type="text" class="form-control" id="appnum" name="appnum" value="${condition.appnum[0]}">
										</div>
										<div class="form-group">
											<label for="patentee">申请人</label>
											<input type="text" class="form-control" id="patentee" name="patentee" value="${condition.patentee[0]}">
										</div>
										<div class="form-group">
											<label for="status">状态</label>
											<select class="form-control" name="status" id="status">
												<option value="${condition.status[0]}" selected="selected">${condition.status[0]}</option>
												<option value=""></option>
												<option value="初审" >初审</option>
												<option value="实审">实审</option>
												<option value="授权">授权</option>
												<option value="未批准">未批准</option>
											</select>
										</div>
                                   		 <button type="submit" class="btn btn-default">搜索</button>
									</div>
                                </form>
                            </div>
							<form id="form" action="${pageContext.request.contextPath}/patent/deleteSelect.do" method="post">
							<!--数据列表-->
							<table id="dataList"
								class="table table-bordered table-striped table-hover dataTable">
								<thead>
									<tr>
										<th class="" style="padding-right: 0px">
											<input	type="checkbox" id="all" class="icheckbox_square-blue" onclick="selectAll(this)">
										</th>
										<th class="sorting_asc">id</th>
										<th class="sorting_desc">专利名称</th>
										<th class="sorting_asc sorting_asc_disabled">申请编号</th>
										<th class="sorting">专利状态</th>
										<th class="text-center">专利申请人</th>
										<th class="sorting">申请日期</th>
										<th class="sorting">实审日期</th>
										<th class="sorting">批准日期</th>
										<th class="">操作</th>
									</tr>
								</thead>
								<tbody>

									<c:forEach items="${pageInfo.list}" var="patent">
										<tr>
											<td><input class="itemSelect"  name="pid" type="checkbox" value="${patent.id}"></td>
											<td>${patent.id }</td>
											<td>${patent.name}</td>
											<td>${patent.appnum}</td>
											<td>${patent.status}</td>
											<td>${patent.patentee}</td>
											<td>${patent.applicationDate}</td>
											<td>${patent.checkDate}</td>
											<td>${patent.approvalDate}</td>
											<td class="text-center">
												<a href="${pageContext.request.contextPath}/patent/findById.do?id=${patent.id}" class="btn bg-olive btn-xs">详情</a>
												<a href="${pageContext.request.contextPath}/patent/edit.do?id=${patent.id}" class="btn bg-olive btn-xs">编辑</a>
												<a href="${pageContext.request.contextPath}/patent/deleteById.do?id=${patent.id}" class="btn bg-olive btn-xs" onclick="return confirm('你确认要删除吗？')">删除</a>
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
									<a href="${pageContext.request.contextPath}/patent/findAll.do?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
								</li>
								<li><a href="${pageContext.request.contextPath}/patent/findAll.do?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
								<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
									<li><a href="${pageContext.request.contextPath}/patent/findAll.do?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
								</c:forEach>
								<li><a href="${pageContext.request.contextPath}/patent/findAll.do?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
								<li>
									<a href="${pageContext.request.contextPath}/patent/findAll.do?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
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
	<jsp:include page="../js.jsp"></jsp:include>
	<script >

				function changePageSize() {
					//获取下拉框的值
					var pageSize = $("#changePageSize").val();

					//向服务器发送请求，改变没页显示条数
					location.href = "${pageContext.request.contextPath}/patent/findAll.do?page=1&size="
							+ pageSize;
				}
				document.getElementById("delSelected").onclick=function () {
					var length=$("input[type='checkbox']:checked").length;
					if(document.getElementById("all").checked){
						length--;
					}
					if(length>0&&confirm("你确定要删除选中的"+length+"个专利吗?")) {
						document.getElementById("form").submit();
					}
				}
				/*document.getElementById("firstCb").onclick=function() {
					var cbs=document.getElementsByName("pid");
					for(var i=0;i<cbs.length;i++){
						cbs[i].checked=this.checked;
					}
				}*/
				//jquery写法
				function selectAll(obj){
					$(".itemSelect").prop("checked",obj.checked);
				}


		</script>
</body>

</html>