<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="secuity" uri="http://www.springframework.org/security/tags" %>
<aside class="main-sidebar">
	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel -->
		<div class="user-panel">
			<div class="pull-left image">
				<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p><security:authentication property="principal.username"/></p>
				<span sec:authentication="principal.authorities"></span>
			</div>
		</div>

		<!-- sidebar menu: : style can be found in sidebar.less -->
		<ul class="sidebar-menu">
			<li class="header">菜单</li>

			<li id="admin-index"><a
				href="${pageContext.request.contextPath}/pages/main.jsp"><i
					class="fa fa-dashboard"></i> <span>首页</span></a></li>


			<li class="treeview">
				<a href="">
					<i class="fa fa-folder"></i> <span>用户管理</span>
					<span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
				</a>
				<ul class="treeview-menu">
					<secuity:authorize access="hasRole('ROLE_ADMIN')">
						<li id="user-list">
							<a href="${pageContext.request.contextPath}/user/findAllAdmin.do">
								<i class="fa fa-circle-o"></i> 管理员管理
							</a>
						</li>
						<li id="user-list">
							<a href="${pageContext.request.contextPath}/user/findAllUser.do">
								<i class="fa fa-circle-o"></i> 普通用户管理
							</a>
						</li>

					</secuity:authorize>
					<secuity:authorize access="hasRole('ROLE_USER')">
						<li id="user-list">
							<a href="${pageContext.request.contextPath}/user/findAll.do">
								<i class="fa fa-circle-o"></i>个人信息管理
							</a>
						</li>
					</secuity:authorize>


				</ul>
			</li>

			<li class="treeview">
				<a href="#">
					<i class="fa fa-folder"></i> <span>成果管理</span>
					<span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
				</a>
				<ul class="treeview-menu">
					<secuity:authorize access="hasRole('ROLE_ADMIN')">
						<li id="">
							<a href="${pageContext.request.contextPath}/paper/findAll.do">
								<i class="fa fa-circle-o"></i> 论文成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/project/findAll.do">
								<i class="fa fa-circle-o"></i> 项目成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/patent/findAll.do">
								<i class="fa fa-circle-o"></i> 专利成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/softWork/findAll.do">
								<i class="fa fa-circle-o"></i> 软著成果管理
							</a>
					</li>
					</secuity:authorize>
					<secuity:authorize access="hasRole('ROLE_USER')">
						<li id="">
							<a href="${pageContext.request.contextPath}/paper/findById.do">
								<i class="fa fa-circle-o"></i> 论文成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/project/findById.do">
								<i class="fa fa-circle-o"></i> 项目成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/patent/findById.do">
								<i class="fa fa-circle-o"></i> 专利成果管理
							</a>
						</li>
						<li id="">
							<a href="${pageContext.request.contextPath}/softWork/findById.do">
								<i class="fa fa-circle-o"></i> 软著成果管理
							</a>
						</li>
					</secuity:authorize>
				</ul>
			</li>


		</ul>
	</section>
	<!-- /.sidebar -->
</aside>