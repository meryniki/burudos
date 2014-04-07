<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'statement.label', default: 'Statement')}" />
<title><g:message code="statement.process.label"
		args="[entityName]" /></title>
<script type="text/javascript"
	src="${resource(dir: 'static/js', file: 'nhpup_1.1.js')}"></script>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">
				<h3>
					<g:message code="statement.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="statement.process.label"
							args="[entityName]" /></li>
				</ul>
			</div>
			<ul class="bigBtnIcon">
				<li><g:link class="create" action="">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>
			<div class="row">
				<div class="col-lg-2"></div>
				<div class="col-lg-8">
					<div id="create-statement" class="content scaffold-create"
						role="main">
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:hasErrors bean="${statementInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${statementInstance}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="statement.process.heading" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:form action="doProcess" class="form-horizontal">
									<fieldset class="form">
										<div
											class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'month', 'error')} required">
											<label class="col-lg-3 control-label" for="month"> <g:message
													code="statement.statementPeriod.label" default="Período" />
												<span class="required-indicator">*</span>
											</label>
											<div class="col-lg-9">
												<g:datePicker name="month" precision="month" />
												<a
													onmouseover="nhpup.popup('<g:message code="statement.process.statementPeriod.help"/>');">?</a>
											</div>
										</div>
										<div class="form-group">
											<div class="col-lg-offset-3 col-lg-9">
												<g:actionSubmit class="save btn btn-info"
													action="doProcess"
													value="${message(code: 'default.button.process.label', default: 'Process')}" />
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
