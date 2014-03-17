<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'Summary')}" />
<title><g:message code="default.upload.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#domonthly-summary" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="domonthly">
					<g:message code="default.domonthly.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="#domonthly-summary" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.upload.label" args="[entityName]" />
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
		<g:uploadForm action="createMonthly">
			<fieldset class="buttons">
				<fieldset class="form">
					<div class="fieldcontain ${hasErrors(bean: summaryInstance, field: 'month', 'error')} required">
						<label for="month">
							<g:message code="summary.month.label" default="Month" />
							<span class="required-indicator">*</span>
						</label>
						<g:field name="month" type="number" value="" required=""/>
							<a onmouseover="nhpup.popup('<g:message code="summary.month.help"/>');">?</a>
					</div>
					<div class="fieldcontain ${hasErrors(bean: summaryInstance, field: 'bu', 'error')} required">
						<label for="bu">
							<g:message code="summary.bu.label" default="Bu" />
							<span class="required-indicator">*</span>
						</label>
						<g:select id="bu" name="bu" from="${ar.com.burudos.business.BussinesUnit.list()}" optionKey="id" required="" value="${summaryInstance?.bu?.id}" class="many-to-one"/>
					</div>
					<g:submitButton name="uploadFile" class="uploadFile"
							value="${message(code: 'default.button.create.label', default: 'uploadFile')}" />
				</fieldset>
			</fieldset>
		</g:uploadForm>
	</div>
</body>
</html>



