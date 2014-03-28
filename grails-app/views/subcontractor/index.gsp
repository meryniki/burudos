
<%@ page import="ar.com.burudos.party.Subcontractor"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'subcontractor.label', default: 'Subcontractor')}" />
<title><g:message code="subcontractor.btnLabel" args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="subcontractor.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="employee.list.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>

			<div id="list-subcontractor" class="content scaffold-list"
				role="main">
				<h1>
					<g:message code="default.list.label" args="[entityName]" />
				</h1>
				<g:if test="${flash.message}">
					<div class="message" role="status">
						${flash.message}
					</div>
				</g:if>
				<table>
					<thead>
						<tr>

							<g:sortableColumn property="uid"
								title="${message(code: 'subcontractor.uid.label', default: 'Uid')}" />

							<g:sortableColumn property="name"
								title="${message(code: 'subcontractor.name.label', default: 'Name')}" />

							<g:sortableColumn property="email"
								title="${message(code: 'subcontractor.email.label', default: 'Email')}" />

							<g:sortableColumn property="dofbeg"
								title="${message(code: 'subcontractor.dofbeg.label', default: 'Dofbeg')}" />

							<th><g:message code="subcontractor.bu.label" default="Bu" /></th>

							<g:sortableColumn property="creationDate"
								title="${message(code: 'subcontractor.creationDate.label', default: 'Creation Date')}" />

						</tr>
					</thead>
					<tbody>
						<g:each in="${subcontractorInstanceList}" status="i"
							var="subcontractorInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

								<td><g:link action="show" id="${subcontractorInstance.id}">
										${fieldValue(bean: subcontractorInstance, field: "uid")}
									</g:link></td>

								<td>
									${fieldValue(bean: subcontractorInstance, field: "name")}
								</td>

								<td>
									${fieldValue(bean: subcontractorInstance, field: "email")}
								</td>

								<td><g:formatDate date="${subcontractorInstance.dofbeg}" /></td>

								<td>
									${fieldValue(bean: subcontractorInstance, field: "bu")}
								</td>

								<td><g:formatDate
										date="${subcontractorInstance.creationDate}" /></td>

							</tr>
						</g:each>
					</tbody>
				</table>
				<div class="pagination">
					<g:paginate total="${subcontractorInstanceCount ?: 0}" />
				</div>
			</div>
		</div>
	</div>
</body>
</html>
