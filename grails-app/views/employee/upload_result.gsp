<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
<title><g:message code="default.create.label"
		args="[entityName]" /></title>
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
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div id="upload-employee" class="content scaffold-create" role="main">
				<h1>
					<g:message code="default.errors.label" args="[entityName]" />

					<g:uploadForm controller="Excel" method="POST"
						action="downloadExcel">
						<input type="hidden" name="report" value="${report["report"]}" />
						<input class="btn btn-info" type="submit" value="Descargar excel" />
					</g:uploadForm>
				</h1>
				<g:hasErrors bean="${employeeInstance}">
					<g:eachError bean="${employeeInstance}" var="error">
						<div class="alert alert-danger">
							<g:message error="${error}" />
						</div>
					</g:eachError>
				</g:hasErrors>
			</div>
		</div>
	</div>
</body>
</html>