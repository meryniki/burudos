
<%@ page import="ar.com.burudos.sales.Summary"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">

<r:require module="highcharts" />
<r:require module="jsontable" />

<g:set var="entityName"
	value="${message(code: 'summary.label', default: 'summary')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>

	<script type="text/javascript" src="../../static/js/jsonTable.js"></script>

	<script type='text/javascript'>
		var chart;

		function requestData() {

			$.ajax({
				url : './sumchart',
				datatype : "json",
				success : function(data) {
					chart.series[0].setData(data);
				},
			});
		}

		function makechart() {
			$(document).ready(function() {
				Highcharts.setOptions({
					global : {
						useUTC : false
					}
				});
				chart = new Highcharts.Chart({
					chart : {
						renderTo : 'graph',
						type : 'pie',
						events : {
							load : requestData
						}
					},
					series : [ {
						type : 'pie',
						data : []
					} ],
					title : {
						text : 'Totales de JAG'
					}
				});
			});
		}
		window.onload = makechart();
	</script>

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
					<li class="active"><g:message code="summary.list.label"
							args="[entityName]" /></li>
				</ul>

			</div>

			<ul class="bigBtnIcon">
				<li><g:link controller="filter" class="create" action="create">
						<span class="icon icomoon-icon-plus-circle"></span>
						<g:message code="filter.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link controller="filter" class="index" action="index">
						<span class="icon icomoon-icon-list"></span>
						<g:message code="filter.list.label" args="[entityName]" />
					</g:link></li>
				<li></li>
				<li></li>
				<li></li>
				<li><g:link class="create" action="create">
						<span class="icon icomoon-icon-plus"></span>
						<g:message code="default.new.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="domonthly" action="domonthly">
						<span class="icon icomoon-icon-calculate-2"></span>
						<g:message code="summary.domonthly.label" args="[entityName]" />
					</g:link></li>
				<li><g:link class="create" action="upload">
						<span class="icon icomoon-icon-table"></span>
						<g:message code="default.upload.label" args="[entityName]" />
					</g:link></li>
			</ul>



			<div id="graph" style="width: 100%; height: 400px;"></div>
</body>
</html>
