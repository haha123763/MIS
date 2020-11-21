<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<!-- 页面meta -->
	<jsp:include page="../meta.jsp"></jsp:include>

	<style type="text/css">
		div.title {
			border-bottom: 1px solid #CCC;
			margin-bottom: 25px;
			text-align: left;
		}
		div.subtitle {
			background: #f5f5f5;
			border-left: 3px solid #ccc;
			margin-bottom: 26px;
			text-align: left;
			padding: 6px 5px 6px 15px;
		}
		table {
			border-spacing: 0px;
			font-size: 12px;
		}

		table.infotable {
			width: 100%;
			margin: 15px auto;
			text-align: center;
			background: #fcfcfc;
			border-left: 1px solid #e3e3e3;
			border-top: 1px solid #e3e3e3;
		}


		table.infotable th {
			text-align: left;
			font-weight: normal;
			line-height: 24px;
			border-bottom: 1px solid #e3e3e3;
			border-right: 1px solid #e3e3e3;
			padding: 6px 20px;
			word-break: keep-all;
		}
		table.infotable td {
			line-height: 24px;
			padding: 6px 20px;
			border-bottom: 1px solid #e3e3e3;
			border-right: 1px solid #e3e3e3;
			background: #FFF;
			text-align: left;
		}
		.explain {
			color: #e15a00;
			letter-spacing: 1px;
		}
		div.subtitle span {
			color: #333;
			font-weight: bold;
			font-size: 14px;
			letter-spacing: 2px;
			line-height: 26px;
		}

		div.title h1 {
			padding: 5px 20px;
		}
		div.title h1 span {
			color: #333;
			font-size: 14px;
			font-weight: bold;
			letter-spacing: 2px;
			line-height: 26px;
		}
	</style>

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

			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a
						href="${pageContext.request.contextPath}/user/findAll.do">用户管理</a></li>
				<li class="active">修改密码</li>
			</ol>
		</section>
		<!-- 内容头部 /-->

		<form class="form-inline" action="#" method="post">
			<!-- 正文区域 -->
			<section class="content">
					<body style="overflow-x: hidden;">
					<div>
						<div class="title">
							<h1><span>修改密码</span></h1>
						</div>
						<div class="subtitle">
							<span>密码由6-20个字符组成，只能包含数字和字母</span>
						</div>
						<form name="f1" id="f1" onsubmit="return save()" action="" method="post">
							<table class="infotable" cellspacing="0" cellpadding="0">
								<input name="uid" type="hidden" value="92192">
								<tbody>
									<tr>
										<th width="20%">旧密码</th>
										<td width="80%">
											<input name="oldpass" id="oldpass" type="password" size="30" maxlength="31">
										</td>
									</tr>
									<tr>
										<th>新密码</th>
										<td>
											<input name="newpass" id="password" onkeyup="checkLength(this.value)" onblur="checkfirstPwd(this.value)" type="password" size="30" maxlength="20">
											<br>
											<span class="explain" id="passstrength"></span>
										</td>
									</tr>
									<tr>
										<th>确认新密码</th>
										<td><input name="rnewpass" id="confirmpass" onblur="checkSecondPwd(this.value)" type="password" size="30" maxlength="20">
											<br><span class="explain" id="checkPwd"></span></td>
									</tr>
								</tbody>
							</table>


						</form>
					</div>


					</body>


					<!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon" >确定</button>
					<button  type="Reset" class="btn bg-default" onclick="window.location.reload()" >重填</button>
					<button type="button" class="btn bg-default" onclick="history.back(-1);">返回</button>
				</div>

				<!--工具栏/-->
			</section>
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
	function checkfirstPwd(pwd){
		var rightPwd =/^[\dA-Za-z]{6,20}$/;

		if(pwd.trim()!='') {
			if (!rightPwd.test(pwd)) {
				$('#passstrength').html('密码由6-20个字符组成，只能包含数字和字母');
				$('#password').focus();
				return false;
			}
			$('#passstrength').html("");
		}else{
			alert('密码不能为空！');
			$('#passstrength').html("");
			return false;
		}
		return true;
	}
	function checkLength(pwd){
		if(pwd.trim()!='') {
			if(pwd.length>=21) {
				confirm('密码的长度不能超过20位！');
			}
		}
	}

	function checkSecondPwd(pwd){
		var firstPasswd = $("input[name=newpass]").val();
		var pwd = pwd.trim();
		if(pwd!=''&&pwd!=firstPasswd){
			$("#checkPwd").html('两次输入的密码不一致！');
			return false;
		}else{
			$("#checkPwd").html('');
			return true;
		}
	}

	function save() {
		if (document.getElementById("oldpass").value.length == 0) {
			alert("请输入旧密码！");
			document.getElementById("oldpass").focus();
			return false;
		}else{
			if(checkfirstPwd($("input[name=newpass]").val())){
				return checkSecondPwd($("input[name=rnewpass]").val());
			}else{
				return false;
			}
		}
	}
</script>


</body>

</html>