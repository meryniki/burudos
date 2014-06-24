
<%@ page import="ar.com.burudos.sales.Summary"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="summary.btnLabel" args="[entityName]" />
				</h3>

				<div class="resBtnSearch">
					<a href="#"><span class="icon16 icomoon-icon-search-3"></span></a>
				</div>

				<ul class="breadcrumb">
					<li>You are here:</li>
					<li><a href="#" class="tip" title="" data-hasqtip="true">
							<span class="icon16 icomoon-icon-screen-2"></span>
					</a> <span class="divider"> <span
							class="icon16 icomoon-icon-arrow-right-3"></span>
					</span></li>
					<li class="active"><g:message code="summary.show.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="domonthly" action="domonthly">
						<span class="icon icomoon-icon-calculate-2"></span>
						<g:message code="summary.domonthly.label" args="[entityName]" />
					</g:link></li>
			</ul>



			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-summary" class="content scaffold-show" role="main">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="summary.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">
								
									<g:if test="${summaryInstance?.summaryCode}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.summaryCode.label" default="Codigo" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${summaryInstance}" field="summaryCode" /></span></li>
									</g:if>
									
									<g:if test="${summaryInstance?.filter}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.summaryCode.label" default="Filtro" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="filter" action="show" id="${summaryInstance?.filter?.id}" ><g:fieldValue
													bean="${summaryInstance}" field="filter" /></g:link></span></li>
									</g:if>
									
									<g:if test="${summaryInstance?.bu}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.bu.label" default="Punto de Venta" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="bussinesUnit"
													action="show" id="${summaryInstance?.bu?.id}">
													${summaryInstance?.bu?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>
									
									<g:if test="${summaryInstance?.employee}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.employee.label" default="Empleado" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="employee"
													action="show" id="${summaryInstance?.employee?.id}">
													${summaryInstance?.employee?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${summaryInstance?.sumMonth}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.month.label" default="Mes" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${summaryInstance}" field="sumMonth" /></span></li>
									</g:if>

									<g:if test="${summaryInstance?.quantity}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="summary.quantity.label" default="Quantity" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${summaryInstance}" field="quantity" /></span></li>
									</g:if>

								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${summaryInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${summaryInstance}"
											onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
											<span class="icon icomoon-icon-backspace"></span>
											<g:message code="default.button.delete.label"
												default="Delete" />
										</g:link></li>
								</ul>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>
</body>
</html>
