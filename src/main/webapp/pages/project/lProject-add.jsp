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
					项目成果管理 <small>项目添加</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="${pageContext.request.contextPath}/index.jsp"><i
							class="fa fa-dashboard"></i> 首页</a></li>
					<li><a
							href="${pageContext.request.contextPath}/project/findAll.do">项目成果管理</a></li>

					<li class="active">纵向项目添加</li>
				</ol>
			</section>
			<!-- 内容头部 /-->

			<form action="${pageContext.request.contextPath}/project/save_l.do" enctype="multipart/form-data" method="post">
				<!-- 正文区域 -->
				<section class="content">
					<div class="panel panel-default">
						<div class="panel-heading">纵向项目信息</div>
						<div class="row data-type">

							<div class="col-md-2 title">id</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control"  name="id" value="" required="required">
							</div>
							<div class="col-md-2 title">课题编号</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control"  name="number"  value="" required="required">
							</div>
							<div class="col-md-2 title">课题名称</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control"  name="name" value="" required="required">
							</div>
							<div class="col-md-2 title">课题类别</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" name="category" value="纵向" readonly="readonly">
							</div>

							<div class="col-md-2 title">课题级别</div>
							<div class="col-md-4 data">
								<select class="form-control select2" name="level" style="width: 100%;">
									<option value=""></option>
									<option value="国家级">国家级</option>
									<option value="省部级">省部级</option>
									<option value="市厅级">市厅级</option>
									<option value="学校">学校</option>
								</select>
							</div>
							<div class="col-md-2 title">课题来源</div>
							<div class="col-md-4 data">
								<select class="form-control select2" name="source" style="width: 100%;">
									<option value=""></option>
									<option value="科技类">科技类</option>
									<option value="国家自然科学基金">国家自然科学基金</option>
									<option value="国家重点研发计划">国家重点研发计划</option>
									<option value="国家重点基础研究发展计划（937计划）">国家重点基础研究发展计划（937计划）</option>
									<option value="国家重点实验室">国家重点实验室</option>
									<option value="国家科技攻关计划项目">国家科技攻关计划项目</option>
									<option value="国家软科学计划项目">国家软科学计划项目</option>
									<option value="国家科技产业化环境建设计划项目">国家科技产业化环境建设计划项目</option>
									<option value="国家八六三计划项目">国家八六三计划项目</option>
									<option value="国家发展改革委员会项目">国家发展改革委员会项目</option>
									<option value="国家级军工项目">国家级军工项目</option>
									<option value="国家级其它项目">国家级其它项目</option>
									<option value="教盲部科学技术研究项目">教盲部科学技术研究项目</option>
									<option value="留学回国人员科研启动基金">留学回国人员科研启动基金</option>
									<option value="高等学校博士点科研基金">高等学校博士点科研基金</option>
									<option value="优秀青年教师资助计划">优秀青年教师资助计划</option>
									<option value="霍英东教育基金">霍英东教育基金</option>
									<option value="教育部跨世纪人才基金">教育部跨世纪人才基金</option>
									<option value="教育部重点实验室">教育部重点实验室</option>
									<option value="中国博士后科学基金">中国博士后科学基金</option>
									<option value="国家其他部委项目">国家其他部委项目</option>
									<option value="省（自治区、直辖市）自然科学基金">省（自治区、直辖市）自然科学基金</option>
									<option value="省（自治区、直辖市）科技计划">省（自治区、直辖市）科技计划</option>
									<option value="省（自治区、直辖市）科技计划项目">省（自治区、直辖市）科技计划项目</option>
									<option value="省（自治区、直辖市）发展改革委员会项目">省（自治区、直辖市）发展改革委员会项目</option>
									<option value="省部级其他项目">省部级其他项目</option>
									<option value="地（市、州）科技计划项目">地（市、州）科技计划项目</option>
									<option value="省（自治区、直辖市）教育厅">省（自治区、直辖市）教育厅</option>
									<option value="省（自治区、直辖市）中医药局项目">省（自治区、直辖市）中医药局项目</option>
									<option value="省（自治区、直辖市）海洋渔业局项目">省（自治区、直辖市）海洋渔业局项目</option>
									<option value="省（自治区、直辖市）环保局项目">省（自治区、直辖市）环保局项目</option>
									<option value="省（自治区、直辖市）保密局项目">省（自治区、直辖市）保密局项目</option>
									<option value="省（自治区、直辖市）农业厅项目">省（自治区、直辖市）农业厅项目</option>
									<option value="省（自治区、直辖市）水利厅项目">省（自治区、直辖市）水利厅项目</option>
									<option value="省（自治区、直辖市）其他厅局项目">省（自治区、直辖市）其他厅局项目</option>
									<option value="地（市、州）农业局项目">地（市、州）农业局项目</option>
									<option value="地（市、州）其他部门项目">地（市、州）其他部门项目</option>
									<option value="厅局级其他项目">厅局级其他项目</option>
									<option value="高等学校青年教师科研启动基金">高等学校青年教师科研启动基金</option>
									<option value="技术服务合同项目">技术服务合同项目</option>
									<option value="技术开发合同项目">技术开发合同项目</option>
									<option value="技术咨询合同项目">技术咨询合同项目</option>
									<option value="技术转让项目">技术转让项目</option>
									<option value="其他项目">其他项目</option>
									<option value="社科类">社科类</option>
									<option value="国家社会科学规划基金">国家社会科学规划基金</option>
									<option value="教育部人文社会科学研究项目">教育部人文社会科学研究项目</option>
									<option value="教育部博士点人文社会科学研究基金项目">教育部博士点人文社会科学研究基金项目</option>
									<option value="教育部青年人文社会科学研究基金项目">教育部青年人文社会科学研究基金项目</option>
									<option value="高等学校古籍整理研究项目">高等学校古籍整理研究项目</option>
									<option value="中央其他部门社科研究项目">中央其他部门社科研究项目</option>
									<option value="省（自治区、直辖市）社科研究项目">省（自治区、直辖市）社科研究项目</option>
									<option value="国际合作研究项目">国际合作研究项目</option>
									<option value="与港澳台合作研究项目">与港澳台合作研究项目</option>
									<option value="企事业单位委托研究项目">企事业单位委托研究项目</option>
									<option value="学校校内人文社会科学研究项目">学校校内人文社会科学研究项目</option>
									<option value="学校校内青年人文社会科学研究项目">学校校内青年人文社会科学研究项目</option>
									<option value="外资研究项目">外资研究项目</option>
									<option value="其他研究项目">其他研究项目</option>
								</select>
							</div><div class="col-md-2 title">课题类型</div>
							<div class="col-md-4 data">
								<select class="form-control select2" name="type" style="width: 100%;">
									<option value=""></option>
									<option value="科技类">科技类</option>
									<option value="国家自然科学基金">国家自然科学基金</option>
									<option value="国家自然科学基金面上项目">国家自然科学基金面上项目</option>
									<option value="国家自然科学基金重点项目">国家自然科学基金重点项目</option>
									<option value="国家自然科学基金重大项目">国家自然科学基金重大项目</option>
									<option value="国家自然科学基金重大研究计划项目">国家自然科学基金重大研究计划项目</option>
									<option value="国家自然科学基金国家杰出青年科学基金项目">国家自然科学基金国家杰出青年科学基金项目</option>
									<option value="国家自然科学基金创新研究群体科学基金">国家自然科学基金创新研究群体科学基金</option>
									<option value="国家自然科学基金专项基金项目">国家自然科学基金专项基金项目</option>
									<option value="国家自然科学基金国际（地区）合作与交流项目">国家自然科学基金国际（地区）合作与交流项目</option>
									<option value="国家自然科学基金联合资助基金项目">国家自然科学基金联合资助基金项目</option>
									<option value="国家自然科学基金其他项目">国家自然科学基金其他项目</option>
									<option value="国家重点研发计划">国家重点研发计划</option>
									<option value="国家重点基础研究发展计划（937计划）">国家重点基础研究发展计划（937计划）</option>
									<option value="国家重点基础研究发展计划（937计划）937计划项目">国家重点基础研究发展计划（937计划）937计划项目</option>
									<option value="国家重点基础研究发展计划（937计划）937前期研究形目">国家重点基础研究发展计划（937计划）937前期研究形目</option>

									<option value="国家重点实验室">国家重点实验室</option>
									<option value="国家科技攻关计划项目">国家科技攻关计划项目</option>
									<option value="国家科技攻关计划项目重大项目">国家科技攻关计划项目重大项目</option>
									<option value="国家科技攻关计划项目重点项目">国家科技攻关计划项目重点项目</option>
									<option value="国家科技攻关计划项目引导项目">国家科技攻关计划项目引导项目</option>
									<option value="国家软科学计划项目">国家软科学计划项目</option>
									<option value="国家科技产业化环境建设计划项目">国家科技产业化环境建设计划项目</option>
									<option value="国家科技产业化环境建设计划项目火炬项目">国家科技产业化环境建设计划项目火炬项目</option>
									<option value="国家科技产业化环境建设计划项目星火项目">国家科技产业化环境建设计划项目星火项目</option>
									<option value="国家科技产业化环境建设计划项目重点新产品计划项目">国家科技产业化环境建设计划项目重点新产品计划项目</option>
									<option value="国家科技产业化环境建设计划项目科技成果重点推广项目">国家科技产业化环境建设计划项目科技成果重点推广项目</option>


									<option value="国家八六三计划项目">国家八六三计划项目</option>
									<option value="国家八六三计划项目前沿探索项目">国家八六三计划项目前沿探索项目</option>
									<option value="国家八六三计划项目面向应用项目">国家八六三计划项目面向应用项目</option>
									<option value="国家八六三计划项目青年基金项目">国家八六三计划项目青年基金项目</option>

									<option value="国家发展改革委员会项目">国家发展改革委员会项目</option>
									<option value="国家发展改革委员会项目产业化专项">国家发展改革委员会项目产业化专项</option>
									<option value="国家发展改革委员会项目示范工程">国家发展改革委员会项目示范工程</option>
									<option value="国家发展改革委员会项目工程研究中心">国家发展改革委员会项目工程研究中心</option>
									<option value="国家级军工项目">国家级军工项目</option>
									<option value="国家级其它项目">国家级其它项目</option>
									<option value="教盲部科学技术研究项目">教盲部科学技术研究项目</option>
									<option value="教盲部科学技术研究项目重点项目">教盲部科学技术研究项目重点项目</option>
									<option value="教盲部科学技术研究项目重大项目">教盲部科学技术研究项目重大项目</option>
									<option value="教盲部科学技术研究项目科技基础条件平台">教盲部科学技术研究项目科技基础条件平台</option>

									<option value="留学回国人员科研启动基金">留学回国人员科研启动基金</option>
									<option value="高等学校博士点科研基金">高等学校博士点科研基金</option>
									<option value="优秀青年教师资助计划">优秀青年教师资助计划</option>
									<option value="霍英东教育基金">霍英东教育基金</option>
									<option value="霍英东教育基金高校青年教师基金">霍英东教育基金高校青年教师基金</option>
									<option value="霍英东教育基金高校青年教师奖">霍英东教育基金高校青年教师奖</option>
									<option value="霍英东教育基金优选资助课题">霍英东教育基金优选资助课题</option>
									<option value="教育部跨世纪人才基金">教育部跨世纪人才基金</option>
									<option value="教育部重点实验室">教育部重点实验室</option>
									<option value="中国博士后科学基金">中国博士后科学基金</option>
									<option value="国家其他部委项目">国家其他部委项目</option>
									<option value="省（自治区、直辖市）自然科学基金">省（自治区、直辖市）自然科学基金</option>
									<option value="省（自治区、直辖市）自然科学基金自由申请项目">省（自治区、直辖市）自然科学基金自由申请项目</option>
									<option value="省（自治区、直辖市）自然科学基金重点项目">省（自治区、直辖市）自然科学基金重点项目</option>
									<option value="省（自治区、直辖市）自然科学基金博士研究启动基金项目">省（自治区、直辖市）自然科学基金博士研究启动基金项目</option>
									<option value="省（自治区、直辖市）自然科学基金研究团队项目">省（自治区、直辖市）自然科学基金研究团队项目</option>

									<option value="省（自治区、直辖市）科技计划">省（自治区、直辖市）科技计划</option>
									<option value="省（自治区、直辖市）科技计划科研条件建设项目（重点实验室）">省（自治区、直辖市）科技计划科研条件建设项目（重点实验室）</option>
									<option value="省（自治区、直辖市）科技计划科研条件建设项目（非重点实验室）">省（自治区、直辖市）科技计划科研条件建设项目（非重点实验室）</option>

									<option value="省（自治区、直辖市）科技计划项目">省（自治区、直辖市）科技计划项目</option>
									<option value="省（自治区、直辖市）科技计划项目重大专项项目">省（自治区、直辖市）科技计划项目重大专项项目</option>
									<option value="省（自治区、直辖市）科技计划项目面上项目">省（自治区、直辖市）科技计划项目面上项目</option>
									<option value="省（自治区、直辖市）科技计划项目软科学项目">省（自治区、直辖市）科技计划项目软科学项目</option>
									<option value="省（自治区、直辖市）科技计划项目其他项目">省（自治区、直辖市）科技计划项目其他项目</option>
									<option value="省（自治区、直辖市）发展改革委员会项目">省（自治区、直辖市）发展改革委员会项目</option>
									<option value="省部级其他项目">省部级其他项目</option>
									<option value="地（市、州）科技计划项目">地（市、州）科技计划项目</option>
									<option value="地（市、州）科技计划项目应用基础研究项目">地（市、州）科技计划项目应用基础研究项目</option>
									<option value="地（市、州）科技计划项目科研攻关重点项目">地（市、州）科技计划项目科研攻关重点项目</option>
									<option value="地（市、州）科技计划项目科技攻关重大项目">地（市、州）科技计划项目科技攻关重大项目</option>
									<option value="地（市、州）科技计划项目科技攻关引导项目">地（市、州）科技计划项目科技攻关引导项目</option>
									<option value="地（市、州）科技计划项目软科学项目">地（市、州）科技计划项目软科学项目</option>
									<option value="地（市、州）科技计划项目成果转换项目">地（市、州）科技计划项目成果转换项目</option>
									<option value="地（市、州）科技计划项目其他项目">地（市、州）科技计划项目其他项目</option>
									<option value="省（自治区、直辖市）教育厅">省（自治区、直辖市）教育厅</option>
									<option value="省（自治区、直辖市）中医药局项目">省（自治区、直辖市）中医药局项目</option>
									<option value="省（自治区、直辖市）海洋渔业局项目">省（自治区、直辖市）海洋渔业局项目</option>
									<option value="省（自治区、直辖市）环保局项目">省（自治区、直辖市）环保局项目</option>
									<option value="省（自治区、直辖市）保密局项目">省（自治区、直辖市）保密局项目</option>
									<option value="省（自治区、直辖市）农业厅项目">省（自治区、直辖市）农业厅项目</option>
									<option value="省（自治区、直辖市）水利厅项目">省（自治区、直辖市）水利厅项目</option>
									<option value="省（自治区、直辖市）其他厅局项目">省（自治区、直辖市）其他厅局项目</option>
									<option value="地（市、州）农业局项目">地（市、州）农业局项目</option>
									<option value="地（市、州）其他部门项目">地（市、州）其他部门项目</option>
									<option value="厅局级其他项目">厅局级其他项目</option>
									<option value="高等学校青年教师科研启动基金">高等学校青年教师科研启动基金</option>
									<option value="技术服务合同项目">技术服务合同项目</option>
									<option value="技术开发合同项目">技术开发合同项目</option>
									<option value="技术开发（合作）合同项目">技术开发（合作）合同项目</option>
									<option value="技术开发（委托）合同项目">技术开发（委托）合同项目</option>
									<option value="技术咨询合同项目">技术咨询合同项目</option>
									<option value="技术转让（技术秘密）项目">技术转让（技术秘密）项目</option>
									<option value="技术转让（专利权）项目">技术转让（专利权）项目</option>
									<option value="技术转让（专利申请权）项目">技术转让（专利申请权）项目</option>
									<option value="技术转让（专利实施许可）项目">技术转让（专利实施许可）项目</option>
									<option value="其他项目">其他项目</option>

								</select>
							</div>


							<div class="col-md-2 title">课题负责人</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" name="leader" value="">
							</div>

							<div class="col-md-2 title">填报人课题排名</div>
							<div class="col-md-4 data">
								<input type="text" class="form-control" name="rank" value="">
							</div>

							<div class="col-md-2 title">开始日期</div>
							<div class="col-md-4 data">
								<input type="date" class="form-control pull-right" name="startDate" id="startDate">
							</div>
							<div class="col-md-2 title">结束日期</div>
							<div class="col-md-4 data">
								<input type="date" class="form-control pull-right" name="endDate" id="endDate">
							</div>
							<div class="col-md-2 title">课题总经费</div>
							<div class="col-md-4 data">
								<input type="text"  class="form-control" name="totalFund">
							</div>

						</div>
					</div>
			 <!--工具栏-->
				<div class="box-tools text-center">
					<button type="submit" class="btn bg-maroon">保存</button>
					<button type="button" class="btn bg-default"
						onclick="history.back(-1);">返回</button>
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

	</script>


</body>

</html>