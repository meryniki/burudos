
<%@ page import="ar.com.burudos.sales.Transaction"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'transaction.label', default: 'Transaction')}" />
<title><g:message code="transaction.btnLabel"
		args="[entityName]" /></title>
</head>
<body>
	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="transaction.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="transaction.list.label"
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

			<div id="list-uploads" class="content scaffold-list" role="main">
				<g:if test="${uploadsCount == 0}">
					<h4>No hay uploads registrados</h4>
				</g:if>

				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default gradient">
							<div class="panel-heading">
								<h4>
									<span><g:message code="uploads.list.label"
											args="[entityName]" /></span>
								</h4>
							</div>
							<div class="panel-body noPad clearfix">
								<div class="responsive" tabindex="5001"
									style="overflow: hidden; outline: none;">
									<div id="DataTables_Table_1_wrapper"
										class="dataTables_wrapper form-inline" role="grid">
									
										<table id="thetable" cellpadding="0" cellspacing="0"
											border="0"
											class="tableTools display table table-bordered dataTable"
											width="100%" id="DataTables_Table_1"
											aria-describedby="DataTables_Table_1_info">

											<!--Titulos con posibilidad de ordenar por-->
											<thead>
												<tr role="row">
													<g:sortableColumn params="${mapsearch}" property="type"
														title="${message(code: 'upload.type.label', default: 'Tipo')}" />
													<g:sortableColumn params="${mapsearch}" property="date"
														title="${message(code: 'upload.date.label', default: 'Fecha')}" />
													<g:sortableColumn params="${mapsearch}" property="cant"
														title="${message(code: 'upload.cant.label', default: 'Cantidad')}" />
													<g:sortableColumn params="${mapsearch}" property="delete"
														title="${message(code: 'upload.delete.label', default: 'Borrar')}" />
												</tr>
											</thead>
											<!--Data-->
											<tbody role="alert" aria-live="polite" aria-relevant="all">
												<g:each in="${uploadsList}" status="i" var="upload">
													<tr class="gradeA ${(i % 2) == 0 ? 'even' : 'odd'}">

														<td class=" ">
															${upload[0]}
														</td>

														<td class=" ">
															${upload[1]}
														</td>
														<td class=" ">
															${upload[2]}
														</td>
														<td><g:link class="delete_upload" action="delete_upload"
																resource="${transactionInstance}">
																<span class="icon icomoon-icon-remove-4"></span>
														</g:link></td>
														
													</tr>
												</g:each>
											</tbody>
										</table>
										<div class="row">
											<div class="col-lg-10">
												<div class="dataTables_paginate paging_bootstrap pagination">
													<ul class="pagination">
														<li><g:paginate total="${uploadsCount ?: 0}"
																params="${mapsearch}" /></li>
													</ul>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="../static/plugins/tables/dataTables/jquery.dataTables.js"></script>

	<script type="text/javascript">
		var isearch = document.getElementById("search");

		/* Add event listeners to the two range filtering inputs */
		isearch.addEventListener("change", function() {
			var vmax = document.getElementById("max");
			var voff = document.getElementById("offset");
			var vser = document.getElementById("search");
			var url = "./uploads?search=" + vser.value;
			if (vmax)
				url += "&max=" + vmax.value;
			if (voff)
				url += "&offset=" + voff.value;

			window.location.replace(url);
		});
	</script>
</body>
</html>