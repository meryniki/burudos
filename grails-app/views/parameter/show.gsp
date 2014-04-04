
<%@ page import="ar.com.burudos.sales.statement.Parameter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<g:set var="entityName"
	value="${message(code: 'parameter.label', default: 'Parameter')}" />

<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="employee.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="employee.show.label"
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
			</ul>

			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="show-parameter" class="content scaffold-show" role="main">
						<h1>
							<g:message code="parameter.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="parameter.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">

									<g:if test="${parameterInstance?.paramCode}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.paramCode.label" default="Parameter Code" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="paramCode" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.paramCategory}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.paramCategory.label"
													default="Parameter Category" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="paramCategory" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.paramGroup}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.paramGroup.label" default="Parameter Group" /></span>
											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="paramGroup" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.paramDescription}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.paramDescription.label" default="Parameter Description" /></span>
											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="paramDescription" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.maxValue}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.maxValue.label" default="Max Value" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="maxValue" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.minValue}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.minValue.label" default="Min Value" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${parameterInstance}" field="minValue" /></span></li>
									</g:if>

									<g:if test="${parameterInstance?.bussinesUnit}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="parameter.bussinesUnit.label" default="Bussines Unit" /></span>
											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="bussinesUnit"
													action="show" id="${parameterInstance?.bussinesUnit?.id}">
													${parameterInstance?.bussinesUnit?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

								</ul>
								<g:if test="${parameterInstance?.active}">
									<g:form url="[resource:parameterInstance, action:'deactivate']"
										method="PUT">
										<fieldset class="buttons">
											<g:link class="edit" action="edit"
												resource="${parameterInstance}">
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link>
											<g:actionSubmit class="delete" action="deactivate"
												value="${message(code: 'default.button.deactivate.label', default: 'Deactivate')}"
												onclick="return confirm('${message(code: 'default.button.deactivate.confirm.message', default: 'Are you sure?')}');" />
										</fieldset>
									</g:form>
								</g:if>
								<g:else>
									<g:form url="[resource:parameterInstance, action:'activate']"
										method="PUT">
										<fieldset class="buttons">
											<g:link class="edit" action="edit"
												resource="${parameterInstance}">
												<g:message code="default.button.edit.label" default="Edit" />
											</g:link>
											<g:actionSubmit class="save" action="activate"
												value="${message(code: 'default.button.deactivate.label', default: 'Activate')}" />
										</fieldset>
									</g:form>
								</g:else>
							</div>
						</div>
					</div>
				</div>
			</div>
</body>
</html>
