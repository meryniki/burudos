<%@ page import="ar.com.burudos.sales.statement.Parameter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'parameter.label', default: 'Parameter')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>
					<g:message code="parameter.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="parameter.list.label"
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
					<div id="edit-parameter" class="content scaffold-edit" role="main">
						<h1>
							<g:message code="parameter.edit.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:hasErrors bean="${parameterInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${parameterInstance}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<div class="panel panel-default">
							<div class="panel-heading">
								<h4>
									<span><g:message code="parameter.edit.heading" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:form url="[resource:parameterInstance, action:'update']"
									method="PUT" class="form-horizontal" role="form">
									<g:hiddenField name="version"
										value="${parameterInstance?.version}" />
									<fieldset class="form">
										<g:render template="form" />
									</fieldset>
									<fieldset>
										<div class="form-group">
											<div class="col-lg-offset-3 col-lg-9">
												<g:actionSubmit class="btn btn-info save" action="update"
													value="${message(code: 'default.button.update.label', default: 'Update')}" />
											</div>
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
