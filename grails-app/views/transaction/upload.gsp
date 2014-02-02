<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'Transaction.label', default: 'Transaction')}" />
<title><g:message code="default.upload.label"
		args="[entityName]" /></title>
</head>
<body>
	<a href="#upload-transaction" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="upload">
					<g:message code="default.upload.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="#upload-transaction" class="content scaffold-create" role="main">
		<h1>
			<g:message code="default.upload.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<g:hasErrors bean="${transactionInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${transactionInstance}" var="error">
					<li
						<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
							error="${error}" /></li>
				</g:eachError>
			</ul>
		</g:hasErrors>
		<g:uploadForm action="uploadFile">
			<fieldset class="buttons">
				<fieldset class="form">
					<div>
						<input type="file" name="myFile" />
						<g:submitButton name="uploadFile" class="uploadFile"
							value="${message(code: 'default.button.create.label', default: 'uploadFile')}" />
					</div>
				</fieldset>
			</fieldset>
		</g:uploadForm>
	</div>
</body>
</html>



