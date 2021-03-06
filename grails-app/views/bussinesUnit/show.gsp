
<%@ page import="ar.com.burudos.business.BussinesUnit"%>

<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'bussinesUnit.label', default: 'bussinesUnit')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="bussinesUnit.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="bussinesUnit.show.label"
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

					<div id="show-bussinesUnit" class="content scaffold-show"
						role="main">
						<h1>
							<g:message code="bussinesUnit.show.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>

						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="bussinesUnit.show.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body">

								<ul class="col-lg-12">

									<g:if test="${bussinesUnitInstance?.code}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.code.label" default="Code" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="code" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.nombre}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.nombre.label" default="Nombre" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="nombre" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.father}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.father.label" default="Father" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="bussinesUnit"
													action="show" id="${bussinesUnitInstance?.father?.id}">
													${bussinesUnitInstance?.father?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.provincia}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.provincia.label" default="Provincia" />
										</span> <span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="provincia" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.departamento}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.departamento.label"
													default="Departamento" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="departamento" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.localidad}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.localidad.label" default="Localidad" />
										</span> <span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="localidad" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.calle}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.calle.label" default="Calle" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="calle" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.altura}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.altura.label" default="Altura" /> </span> <span
											class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:fieldValue
													bean="${bussinesUnitInstance}" field="altura" /></span></li>
									</g:if>

									<g:if test="${bussinesUnitInstance?.coordinator}">
										<li style="display: block;"><span class="blue col-lg-3"><g:message
													code="bussinesUnit.coordinator.label" default="Coordinator" />
										</span> <span class="icon12 icomoon-icon-arrow-right-5 blue col-lg-1"></span><span
											class="col-lg-6"><g:link controller="employee"
													action="show" id="${bussinesUnitInstance?.coordinator?.id}">
													${bussinesUnitInstance?.coordinator?.encodeAsHTML()}
												</g:link></span></li>
									</g:if>
								</ul>

								<ul class="bigBtnIcon" style="display: -webkit-box;">
									<li><g:link class="edit" action="edit"
											resource="${bussinesUnitInstance}">
											<span class="icon icomoon-icon-pencil"></span>
											<g:message code="default.button.edit.label" default="Edit" />
										</g:link></li>
									<li><g:link class="delete" action="delete"
											value="${message(code: 'default.button.delete.label', default: 'Delete')}"
											resource="${bussinesUnitInstance}"
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
