
<%@ page import="ar.com.burudos.party.Employee"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'employee.label', default: 'Employee')}" />
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
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>



			<div class="row">

				<div class="col-lg-2"></div>

				<div class="col-lg-8">

					<div id="create-employee" class="content scaffold-create"
						role="main">
						<h1>
							<g:message code="default.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>

						<g:hasErrors bean="${employeeInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${employeeInstance}" var="error">
									<li><g:if
											test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>
										<g:message error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>
						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="employee.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:if test="${flash.message}">
									<div class="message" role="status">
										${flash.message}
									</div>
								</g:if>
								<ul class="col-lg-12">
									<g:if test="${employeeInstance?.uid}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.uid.label" default="Uid" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="uid" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.name}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.name.label" default="Name" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="name" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.email}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.email.label" default="Email" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="email" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.creationDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.creationDate.label" default="Creation Date" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.creationDate}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.createdBy}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.createdBy.label" default="Created By" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="createdBy" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastUpdateDate}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastUpdateDate.label"
													default="Last Update Date" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.lastUpdateDate}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastUpdateBy}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastUpdateBy.label" default="Last Update By" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="lastUpdateBy" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.legajo}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.legajo.label" default="Legajo" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="legajo" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.fullname}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.fullname.label" default="Fullname" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="fullname" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.names}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.names.label" default="Names" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="names" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.lastname}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.lastname.label" default="Lastname" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="lastname" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.dofingreso}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.dofingreso.label" default="Dofingreso" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.dofingreso}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.bu}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.bu.label" default="Bu" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="bussinesUnit"
													action="show" id="${employeeInstance?.bu?.id}">
													${employeeInstance?.bu?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${employeeInstance?.dofbirth}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.dofbirth.label" default="Dofbirth" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatDate
													date="${employeeInstance?.dofbirth}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.isworker}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.isworker.label" default="Isworker" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:formatBoolean
													boolean="${employeeInstance?.isworker}" /></span></li>
									</g:if>

									<g:if test="${employeeInstance?.iscoordinator}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.iscoordinator.label" default="Iscoordinator" /></span>

											<span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span>
											<g:formatBoolean boolean="${employeeInstance?.iscoordinator}" /></li>
									</g:if>

									<g:if test="${employeeInstance?.basic}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="employee.basic.label" default="Basic" /></span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${employeeInstance}" field="basic" /></span></li>
									</g:if>
							</ul>
						
							<ul class="bigBtnIcon" style="display: -webkit-box;">
								<li><g:link class="edit" action="edit"
										resource="${employeeInstance}">
										<span class="icon icomoon-icon-pencil"></span>
										<g:message code="default.button.edit.label" default="Edit" />
									</g:link></li>
									 <li><g:link class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}"
										resource="${employeeInstance}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');">
										<span class="icon icomoon-icon-backspace"></span>
										<g:message code="default.button.delete.label" default="Delete" />
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
