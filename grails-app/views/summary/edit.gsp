<%@ page import="ar.com.burudos.sales.Summary"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
					<li class="active"><g:message code="summary.list.label"
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
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>


			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">


					<div id="edit-summary" class="content scaffold-edit" role="main">
						<h1>
							<g:message code="default.edit.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:hasErrors bean="${summaryInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${summaryInstance}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									<span><g:message code="employee.edit.heading" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:form url="[resource:summaryInstance, action:'update']"
									class="form-horizontal"  method="PUT">
									<g:hiddenField name="version"
										value="${summaryInstance?.version}" />
									<fieldset>
										<g:render template="form" />
									</fieldset>
									<fieldset>
										<div class="form-group">
											<g:actionSubmit class="save" action="update"
												value="${message(code: 'default.button.update.label', default: 'Update')}" />
										</div>
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>

