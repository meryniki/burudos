<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.upload.label"
		args="[entityName]" /></title>
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
					<li class="active"><g:message code="summary.upload.label"
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

			<div id="#upload-summary" class="content scaffold-create"
				role="main">
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
							<li><g:if
									test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
									error="${error}" /></li>
						</g:eachError>
					</ul>
				</g:hasErrors>


				<div class="row">

					<div class="col-lg-3"></div>

					<div class="col-lg-6">

						<g:uploadForm action="uploadFile" class="form-horizontal"
							role="form">
							<div class="form-group">
								<label class="col-lg-3 control-label" for="fileinput"><g:message
										code="default.upload.file" /></label>
								<div class="col-lg-5">
									<div class="uploader" id="uniform-file">
										<input type="file" class="form-control" name="FileSummary"
											id="file"> <span class="filename"
											style="-webkit-user-select: none;">Click <strong>here</strong>
											to Select
										</span><span class="action" style="-webkit-user-select: none;">Choose
											File</span>
									</div>
								</div>
								<g:submitButton name="uploadFile" type="submit"
									class="btn btn-info"
									value="${message(code: 'default.button.upload.label', default: 'uploadFile')}"
									onclick="showThinking()" />
							</div>
						</g:uploadForm>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="thinking" style="display: none">
		<img src="../static/images/ajax-loader.gif" alt="" style="width:100px;">
	</div>
</body>
</html>



