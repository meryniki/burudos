<%@ page import="ar.com.burudos.sales.Filter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'filter.label', default: 'filter')}" />
<title><g:message code="default.edit.label" args="[entityName]" /></title>
</head>
<body>

	<div id="content" class="clearfix">
		<div class="contentwrapper">
			<div class="heading">

				<h3>
					<g:message code="filter.btnLabel" args="[entityName]" />
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
					<li class="active"><g:message code="filter.list.label"
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
				<div class="col-lg-12">

					<div id="edit-filter" class="content scaffold-edit" role="main">
						<h1>
							<g:message code="default.edit.label" args="[entityName]" />
						</h1>
						<g:if test="${flash.message}">
							<div class="message" role="status">
								${flash.message}
							</div>
						</g:if>
						<g:hasErrors bean="${filterInstance}">
							<ul class="errors" role="alert">
								<g:eachError bean="${filterInstance}" var="error">
									<li
										<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
											error="${error}" /></li>
								</g:eachError>
							</ul>
						</g:hasErrors>

						<div class="panel panel-default">

							<div class="panel-heading">
								<h4>
									<span><g:message code="filter.edit.heading" /></span>
								</h4>
							</div>
							<div class="panel-body">
								<g:form url="[resource:filterInstance, action:'update']"
									method="PUT" class="form-horizontal">
									<g:hiddenField name="version"
										value="${filterInstance?.version}" />
									<fieldset class="form">
										<g:render template="form" />
									</fieldset>
									<fieldset class="buttons">
										<div class="form-group">
											<div class="col-lg-offset-3 col-lg-9">
												<g:actionSubmit class="save" action="update"
													value="${message(code: 'default.button.update.label', default: 'Update')}" />
											</div>
										</div>
									</fieldset>
								</g:form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var ifilter = document.getElementById("type");

		var itipowhere1 = document.getElementsByClassName("tipo_where");
		var itipowhere2 = document.getElementsByClassName("tipo_sum");
		var itipowhere3 = document.getElementsByClassName("tipo_advanced");
		var itipowhere4 = document.getElementsByClassName("tipo_query");

		for (var i = 0; i < itipowhere1.length; i++) {
			itipowhere1[i].style.display = "none";
		}
		for (var i = 0; i < itipowhere2.length; i++) {
			itipowhere2[i].style.display = "none";
		}
		for (var i = 0; i < itipowhere3.length; i++) {
			itipowhere3[i].style.display = "none";
		}
		for (var i = 0; i < itipowhere4.length; i++) {
			itipowhere4[i].style.display = "none";
		}

		if (ifilter.value == "WHERE") {
			for (var i = 0; i < itipowhere1.length; i++) {
				itipowhere1[i].style.display = "block";
			}
		}

		else if (ifilter.value == "SUM") {
			for (var i = 0; i < itipowhere2.length; i++) {
				itipowhere2[i].style.display = "block";
			}
		} else if (ifilter.value == "ADVANCED") {
			for (var i = 0; i < itipowhere3.length; i++) {
				itipowhere3[i].style.display = "block";
			}
			for (var i = 0; i < itipowhere1.length; i++) {
				itipowhere1[i].style.display = "block";
			}
		} else if (ifilter.value == "QUERY") {
			for (var i = 0; i < itipowhere4.length; i++) {
				itipowhere4[i].style.display = "block";
			}
		}

		/* Add event listeners to the two range filtering inputs */
		ifilter.addEventListener("change", function() {

			var elements = document.getElementsByClassName("classname");

			var itipowhere1 = document.getElementsByClassName("tipo_where");
			var itipowhere2 = document.getElementsByClassName("tipo_sum");
			var itipowhere3 = document.getElementsByClassName("tipo_advanced");
			var itipowhere4 = document.getElementsByClassName("tipo_query");

			for (var i = 0; i < itipowhere1.length; i++) {
				itipowhere1[i].style.display = "none";
			}
			for (var i = 0; i < itipowhere2.length; i++) {
				itipowhere2[i].style.display = "none";
			}
			for (var i = 0; i < itipowhere3.length; i++) {
				itipowhere3[i].style.display = "none";
			}
			for (var i = 0; i < itipowhere4.length; i++) {
				itipowhere4[i].style.display = "none";
			}

			if (ifilter.value == "WHERE") {
				for (var i = 0; i < itipowhere1.length; i++) {
					itipowhere1[i].style.display = "block";
				}
			}

			else if (ifilter.value == "SUM") {
				for (var i = 0; i < itipowhere2.length; i++) {
					itipowhere2[i].style.display = "block";
				}
			} else if (ifilter.value == "ADVANCED") {
				for (var i = 0; i < itipowhere3.length; i++) {
					itipowhere3[i].style.display = "block";
				}
				for (var i = 0; i < itipowhere1.length; i++) {
					itipowhere1[i].style.display = "block";
				}
			} else if (ifilter.value == "QUERY") {
				for (var i = 0; i < itipowhere4.length; i++) {
					itipowhere4[i].style.display = "block";
				}
			}

		});
	</script>
</body>
</html>
