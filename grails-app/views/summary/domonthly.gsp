<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="summary.btnLabel" args="[entityName]" /></title>
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
					<li><a href="#" class="tip" oldtitle="back to dashboard"
						title="" data-hasqtip="true"> <span
							class="icon16 icomoon-icon-screen-2"></span>
					</a> <span class="divider"> <span
							class="icon16 icomoon-icon-arrow-right-3"></span>
					</span></li>
					<li class="active"><g:message code="summary.domonthly.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="list" action="index">
						<span class="icon icomoon-icon-menu"></span>
						<g:message code="default.list.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">
					<div id="edit-transaction" class="content scaffold-edit"
						role="main">
						<h1>
							<g:message code="summary.domonthly.label" args="[entityName]" />
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
									<span><g:message code="summary.domonthly.heading" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:uploadForm action="createMonthly" class="form-horizontal">
										<fieldset class="form">
											<div
												class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'month', 'error')} required">
												<label class="col-lg-3 control-label" for="month"> <g:message
														code="summary.month.label" default="Mes a totalizar" /> <span
													class="required-indicator">*</span>
												</label>
												<g:datePicker name="month" precision="month" />
												<a
													onmouseover="nhpup.popup('<g:message code="summary.month.help"/>');">?</a>
											</div>
											<div
												class=" form-group fieldcontain ${hasErrors(bean: summaryInstance, field: 'bu', 'error')} required">
												<label class="col-lg-3 control-label" for="bu"> <g:message code="summary.bu.label"
														default="Punto de Venta" /> <span class="required-indicator">*</span>
												</label>
												<g:select id="bu" name="bu"
													from="${ar.com.burudos.business.BussinesUnit.list()}"
													optionKey="id" required=""
													value="${summaryInstance?.bu?.id}" class="many-to-one" />
											</div>
											<div class="center form-group">
											<g:actionSubmit class="save btn btn-info" action="createMonthly" 
													value="${message(code: 'default.button.create.label', default: 'uploadFile')}" />
											</div>
										</fieldset>
									
								</g:uploadForm>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>



