modules = {
	application { resource url:'js/application.js' }

	jquery{
		resource url:'/js/jquery.js', disposition: 'head'
		resource url:'/js/jquery.min.js', disposition: 'head'
	}
	
	bootstrap{
		resource url:'/js/bootstrap/bootstrap.js'
		resource url:'/css/bootstrap/bootstrap.css'
		resource url:'/css/bootstrap/bootstrap.min.css'
		resource url:'/css/bootstrap/bootstrap-theme.css'
	}

	core {
		dependsOn 'jquery,bootstrap'
		
		resource url:'/js/libs/jRespond.min.js'
		resource url:'/js/libs/modernizr.js', disposition:'head'
		resource url:'/css/mobile.css'
		resource url:'/css/supr-theme/jquery.ui.supr.css'
		resource url:'/css/icons.css'
		resource url:'/js/main.js'
		resource url:'/css/main.css'
		resource url:'/css/custom.css'
		resource url:'/css/begin.css'
		resource url:'/css/burucps.css'
		resource url:'/js/mi.js'
		resource url:'/js/dashboard.js'
		resource url:'/js/nhpup_1.1.js'
	}
	
	highcharts{
		dependsOn 'jquery'
		resource url:'/js/highcharts.js'
	}
	
	jsontable{
		dependsOn 'jquery'
		resource url:'/js/jsonTable.js'
	}
	
	plugins{
		dependsOn 'core,jquery'
		
		resource url:'plugins/charts/flot/jquery.flot.js'
		resource url:'plugins/charts/flot/jquery.flot.grow.js'
		resource url:'plugins/charts/flot/jquery.flot.pie.js'
		resource url:'plugins/charts/flot/jquery.flot.resize.js'
		resource url:'plugins/charts/flot/jquery.flot.tooltip_0.4.4.js'
		resource url:'plugins/charts/flot/jquery.flot.orderBars.js'
		resource url:'plugins/charts/knob/jquery.knob.js'
		resource url:'plugins/misc/qtip/jquery.qtip.min.js'
		resource url:'plugins/misc/totop/jquery.ui.totop.min.js'
		resource url:'plugins/tables/dataTables/jquery.dataTables.min.js'
		resource url:'plugins/tables/dataTables/TableTools.min.js'
		resource url:'plugins/jquery.placeholder.min.js'
		resource url:'plugins/forms/uniform/jquery.uniform.min.js'
		
		resource url:'plugins/misc/qtip/jquery.qtip.css'
		resource url:'plugins/forms/uniform/uniform.default.css'
		resource url:'plugins/tables/dataTables/jquery.dataTables.css'
		resource url:'plugins/tables/dataTables/TableTools.css'
	}

}