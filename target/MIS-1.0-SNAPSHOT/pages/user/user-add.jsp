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
				用户管理 <small>用户表单</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
					href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
				<li class="active">用户表单</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<form name="userform"   onSubmit="return doSubmit()" action="${pageContext.request.contextPath}/user/save.do"
				method="post">
				<!-- 正文区域 -->
				<section class="content">
					<div class="panel panel-default">
						<div class="panel-heading">用户信息</div>
						<div class="row data-type">


							<div class="col-md-2 title">用户id</div>
							<div class="col-md-4 data">
								<input type="text" id="input_id"  class="form-control" placeholder="用户id" name="id" value="" required="required"  >
							</div>
							<div class="col-md-2 title">用户名</div>
							<div class="col-md-4 data">
								<input type="text" id="input_username" class="form-control" placeholder="用户名" name="username" value=""  >
								<span class="explain" id="passstrength"></span>
							</div>
							<div class="col-md-2 title">密码</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" placeholder="密码" name="password" value="" required="required" >
							</div>
							<div class="col-md-2 title">用户角色</div>
							<div class="col-md-4 data">
								<input type="text" value="ROLE_USER" class="form-control" readonly="readonly" name="role">
							</div>
							<div class="col-md-2 title">中文名</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" placeholder="中文名" name="Chinese_name" value="">
							</div>

							<div class="col-md-2 title">英文名</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" placeholder="英文名" name="English_name" value="">
							</div>

							<div class="col-md-2 title">职称</div>
							<div class="col-md-4 data">
								<select class="form-control select2" name="job_title" style="width: 100%;">
									<option value="教授" selected="selected">教授</option>
									<option value="副教授">副教授</option>
									<option value="讲师">讲师</option>
									<option value="研究员">研究员</option>
									<option value="副研究员">副研究员</option>
									<option value="助教">助教</option>
								</select>
							</div>
							<div class="col-md-2 title">所在系</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" placeholder="所在系" name="department" value="">
							</div>


							<div class="col-md-2 title rowHeight2x">邮箱</div>
							<div class="col-md-10 data rowHeight2x">
								<textarea class="form-control" rows="3" placeholder="邮箱" name="email"></textarea>
							</div>
							<div class="col-md-2 title rowHeight2x">电话</div>
							<div class="col-md-10 data rowHeight2x">
								<textarea class="form-control" rows="3" placeholder="电话" name="phone"></textarea>
							</div>

						</div>
					</div>
			 <!--工具栏-->
				<div class="box-tools text-center">
					<button id="sumbitForm" type="submit" class="btn bg-maroon">保存</button>
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


		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}
		function doSumbit() {
			/*获取表单中的input的name为title的value--*/
			var val = document.userform.username.value;
			var username=$("#input_username").value;

			/*判断表单中的input的name为title的value值是否为空*/
			if(username=="" || username==null){
/*
				alert("用户名不能为空！")
*/
				$('#passstrength').html('用户名不能为空！');
				$('#input_username').focus();
				return false;
			}
			if($("#sumbitForm").attr("ajax")=="error"){
				return false;
			}


		}
		$("#input_username").change(function () {
			//发送ajax请求校验用户名是否重复
			var username=this.value;
			$.ajax({
				url:"${pageContext.request.contextPath}/user/checkUsername.do",
				date:"username="+username,
				type:"post",
				sucess:function (result) {
					if(result.code==200){
						$('#passstrength').html('用户名重复');
						$('#input_username').focus();
						$("#sumbitForm").attr("ajax","success");
					}else{
						$("#sumbitForm").attr("ajax","error");
					}
				}
			});
		});
	</script>


</body>

</html>