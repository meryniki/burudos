
<%@ page import="ar.com.burudos.sales.Operation"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'operation.label', default: 'operation')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="operation.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="operation.show.label"
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

					<div id="show-operation" class="content scaffold-show" role="main">
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
									<span><g:message code="operation.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">

									<g:if test="${operationInstance?.code}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="operation.code.label" default="Code" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
										<g:fieldValue bean="${operationInstance}" field="code" /></li>
									</g:if>

		
									<g:if test="${operationInstance?.description}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="operation.description.label" default="Description" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
										<g:fieldValue bean="${operationInstance}" field="description" /></li>
									</g:if>

									
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="operation.active.label" default="Activo" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
										<g:fieldValue bean="${operationInstance}" field="active" /></li>
									
								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${operationInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${operationInstance}"
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
