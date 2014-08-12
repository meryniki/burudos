package ar.com.burudos.sales
import grails.converters.JSON
import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.business.BussinesUnit
import ar.com.burudos.party.Employee
import ar.com.burudos.constants.BuruConstants
import static java.util.Calendar.MONTH

@Transactional(readOnly = true)
class SummaryController {

	static Boolean linkMe = true
	static String btnName = "summary.btnLabel"
	static String iconName = "summary.iconName"
	static String submenu1 = "Empleados"
	static String submenu2 = "Puntos de Venta"

	static allowedMethods = [save: "POST", update: "PUT"]

	def index(String employeeorbu, Integer max, Integer offset, String search) {
		/*Initialize counts and params*/
		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];

		/*Initialization*/
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = 30;
		params.max = max;

		/*Date to get index list*/
		def datemonth
		def dateyear
		if (!params.sumMonth_month) {
			String hql = "select month(max(sumMonth)) as maxMonth, year(max(sumMonth)) as maxYear  from Summary"
			def result = Summary.executeQuery(hql)
			if (!result.isEmpty() && result[0][0]!=null){
				datemonth = String.valueOf(result[0][0])
				dateyear = String.valueOf(result[0][1])
				params.sumMonth_month = String.valueOf(result[0][0])
				params.sumMonth_year = dateyear
			}else {
				def today= new Date()
				datemonth = String.valueOf(today[Calendar.MONTH])
				dateyear = String.valueOf(today[Calendar.YEAR])
				params.sumMonth_month = datemonth
				params.sumMonth_year = dateyear
			}
		}else{
			datemonth = params.sumMonth_month
			dateyear = params.sumMonth_year
		}
		
		def query
		if (params.employeeorbu=='2') {
			query = Summary.where{
				( (bu != null) &&
						(bu.nombre ==~  "%${search}%") || (
						summaryCode ==~  "%${search}%") ) && (
						month(sumMonth) == params.sumMonth_month &&
						year(sumMonth) == params.sumMonth_year)
			}
		}
		else if (params.employeeorbu=='1') {
			query = Summary.where{
				( (employee.name ==~  "%${search}%") || (
						summaryCode ==~  "%${search}%") ) && (
						month(sumMonth) == params.sumMonth_month &&
						year(sumMonth) == params.sumMonth_year)
			}
		}
		else
			query = Summary.where{
				summaryCode ==~  "%${search}%" && (
						month(sumMonth) == params.sumMonth_month &&
						year(sumMonth) == params.sumMonth_year)
			}

		lista = query.list(params)
		total = query.count()
		
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);
		mapsearch.put("employeeorbu", employeeorbu);

		respond lista, model:[summaryInstanceCount: total,
			mapsearch: mapsearch, defaultmonth:Date.parse("yyyyMM", dateyear+datemonth)]
	}

	def show(Summary summaryInstance) {
		respond summaryInstance
	}

	def create() {
		respond new Summary(params)
	}

	def sumchart() {
		totalOfSummary()
	}

	/**
	 * Obtener las transacciones totales para las liquidaciones
	 * @return
	 */
	def totalOfSummary(){
		def lista = [];
		Summary.findAllByBu(BussinesUnit.findByNombre("JAG")).each{ sum->
			def totals = [:];
			totals.put("name", sum.filter.filterCode.toString());
			totals.put("y", sum.quantity);
			if ( sum.quantity && sum.quantity != 0)
				lista.add(totals);
		}
		render (lista as JSON)
	}

	@Transactional
	def save(Summary summaryInstance) {
		if (summaryInstance == null) {
			notFound()
			return
		}

		if (summaryInstance.hasErrors()) {
			respond summaryInstance.errors, view:'create'
			return
		}

		summaryInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.created.message', args: [
					message(code: 'summaryInstance.label', default: 'Summary'),
					summaryInstance.id
				])
				redirect summaryInstance
			}
			'*' {
				respond summaryInstance, [status: CREATED]
			}
		}
	}

	def edit(Summary summaryInstance) {
		respond summaryInstance
	}

	@Transactional
	def update(Summary summaryInstance) {
		if (summaryInstance == null) {
			notFound()
			return
		}

		if (summaryInstance.hasErrors()) {
			respond summaryInstance.errors, view:'edit'
			return
		}

		summaryInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.updated.message', args: [
					message(code: 'Summary.label', default: 'Summary'),
					summaryInstance.id
				])
				redirect summaryInstance
			}
			'*'{
				respond summaryInstance, [status: OK]
			}
		}
	}

	def upload = {
		// shows info
	}

	@Transactional
	def uploadFile(Summary summaryInstace) {
		def reportOfErrors = [:]
		def mapreport = [:]
		int linea = 0
		def code

		summaryInstace.clearErrors();

		/*File management*/
		def file = request.getFile(BuruConstants.uploadFileSummary)
		def jfile = new java.io.File(BuruConstants.saveFileSummary)
		if(file && !file.empty && file.size < BuruConstants.MAX_FILE) {
			file.transferTo( jfile )
		}
		else{
			summaryInstace.errors.reject(BuruConstants.NO_VALID_FILE);
			respond summaryInstace.errors, view:'upload_result', model:[report:mapreport]
			return
		}


		jfile.splitEachLine('\t') { row ->

			BussinesUnit pdv = BussinesUnit.findByNombre(row[1])
			Employee emp = Employee.findByName(row[2])

			if (!pdv && !emp) {
				linea = linea + 1;
				summaryInstace.errors.reject(row[0], row[1]+BuruConstants.bu_exist_error+row[2]+BuruConstants.employee_exist_error);
				String sline = String.valueOf(linea);
				reportOfErrors.put(sline, row)
			}
			else{
				try {
					code = new Summary(
							summaryCode: row[0],
							employee: emp,
							bu: pdv,
							sumMonth: Date.parse("MM/yyyy",  row[4]),
							quantity: Integer.parseInt(row[3])
							).save(failOnError: true, flush: true)
				} catch (Exception e) {

					linea = linea + 1;
					summaryInstace.errors.reject(row[0], row[1]+BuruConstants.sum_create_error);
					String sline = String.valueOf(linea);
					reportOfErrors.put(sline, row)

					e.printStackTrace();
				}
			}
		}

		mapreport.put("report", reportOfErrors)

		if (summaryInstace.hasErrors()) {
			respond summaryInstace.errors, view:'upload_result', model:[report:mapreport]
			return
		}

		redirect action:"index", params:[employeeorbu:"1"];
	}

	def totals = {
	}

	def domonthly = {
	}

	String arma_where( Filter filter, BussinesUnit butmp) {
		def where_filter = ""
		if (filter.op) {

			if (filter.op=="(null)")
				where_filter += " and t.op is null"
			else if (filter.op == "(any)")
				where_filter += " and t.op is not null"
			else if ( filter.op.contains(" o ") ){
				//&& filter.op.contains("(") && filter.op.contains(")")  ){
				filter.op = filter.op.replace("(","")
				filter.op = filter.op.replace(")","")
				where_filter += " and ("
				filter.op.split(" o ").each() { ops->
					where_filter += " or t.op.code = '" + ops + "'"
				}
				where_filter += ")"
				where_filter = where_filter.replace("( or ", "( ")
			}
			else
				where_filter += " and t.op.code = '" + filter.op  + "'"
		}
		if (filter.plan) {

			if (filter.plan=="(null)")
				where_filter += " and t.plan is null"
			else if (filter.plan == "(any)")
				where_filter += " and t.plan is not null"
			else if ( filter.plan.contains(" o ") ){
				//&& filter.op.contains("(") && filter.op.contains(")")  ){
				filter.plan = filter.plan.replace("(","")
				filter.plan = filter.plan.replace(")","")
				where_filter += " and ("
				filter.plan.split(" o ").each() { ops->
					where_filter += " or t.plan = '" + ops + "'"
				}
				where_filter += ")"
				where_filter = where_filter.replace("( or ", "( ")
			}
			else
				where_filter += " and t.plan = '" + filter.plan  + "'"
		}
		if (filter.servicio) {

			if (filter.servicio=="(null)")
				where_filter += " and t.servicio is null"
			else if (filter.servicio == "(any)")
				where_filter += " and t.servicio is not null"
			else if ( filter.servicio.contains(" o ") ){
				//&& filter.op.contains("(") && filter.op.contains(")")  ){
				filter.servicio = filter.servicio.replace("(","")
				filter.servicio = filter.servicio.replace(")","")
				where_filter += " and ("
				filter.servicio.split(" o ").each() { ops->
					where_filter += " or t.servicio = '" + ops + "'"
				}
				where_filter += ")"
				where_filter = where_filter.replace("( or ", "( ")
			}
			else
				where_filter += " and t.servicio = '" + filter.servicio  + "'"
		}
		if (filter.ani)
			if (filter.ani=="(null)")
				where_filter += " and t.ani is null"
			else if (filter.ani == "(any)")
				where_filter += " and t.ani is not null"
			else
				where_filter += " and t.ani = '" + filter.ani  + "'"
		if (filter.sds)
			if (filter.sds=="(null)")
				where_filter += " and t.sds is null"
			else if (filter.sds == "(any)")
				where_filter += " and t.sds is not null"
			else
				where_filter += " and t.sds = '" + filter.sds + "'"
		if (filter.imei)
			if (filter.imei=="(null)")
				where_filter += " and (t.imei is null or t.imei == '111111111111111')"
			else if (filter.imei == "(any)")
				where_filter += " and t.imei is not null"
			else
				where_filter += " and t.imei = '" + filter.imei  + "'"
		if (filter.plan)
			if (filter.plan=="(null)")
				where_filter += " and t.plan is null"
			else if (filter.plan == "(any)")
				where_filter += " and t.plan is not null"
			else
				where_filter += " and t.plan = '" + filter.plan  + "'"
		if (filter.sim)
			if (filter.sim=="(null)")
				where_filter += " and t.sim is null"
			else if (filter.sim == "(any)")
				where_filter += " and t.sim is not null"
			else
				where_filter += " and t.sim = '" + filter.sim  + "'"
		if (filter.folio)
			if (filter.folio=="(null)")
				where_filter += " and t.folio is null"
			else if (filter.folio == "(any)")
				where_filter += " and t.folio is not null"
			else
				where_filter += " and t.folio = '" + filter.folio  + "'"
		if (filter.partida)
			if (filter.partida=="(null)")
				where_filter += " and t.partida is null"
			else if (filter.partida == "(any)")
				where_filter += " and t.partida is not null"
			else
				where_filter += " and t.partida = '" + filter.partida  + "'"
		if (filter.equipo)
			if (filter.equipo=="(null)")
				where_filter += " and t.equipo is null"
			else if (filter.equipo == "(any)")
				where_filter += " and t.equipo is not null"
			else
				where_filter += " and t.equipo like '%" + filter.equipo  + "%'"
		if (filter.solicitud)
			if (filter.solicitud=="(null)")
				where_filter += " and t.solicitud is null"
			else if (filter.solicitud == "(any)")
				where_filter += " and t.solicitud is not null"
			else
				where_filter += " and t.solicitud = '" + filter.solicitud  + "'"
		if (filter.cancel)
			if (filter.cancel=="(null)")
				where_filter += " and t.cancel is null"
			else if (filter.cancel == "(any)")
				where_filter += " and t.cancel is not null"
			else
				where_filter += " and t.cancel = '" + filter.cancel  + "'"
		if (filter.estado)
			if (filter.estado=="(null)")
				where_filter += " and t.estado is null"
			else if (filter.estado == "(any)")
				where_filter += " and t.estado is not null"
			else
				where_filter += " and t.estado = '" + filter.estado  + "'"
		if (filter.factura)
			if (filter.factura=="(null)")
				where_filter += " and t.factura is null"
			else if (filter.factura == "(any)")
				where_filter += " and t.factura is not null"
			else
				where_filter += " and t.factura = '" + filter.factura  + "'"
		if (filter.importe)
			if (filter.importe=="(null)")
				where_filter += " and t.importe is null"
			else if (filter.importe == "(any)")
				where_filter += " and t.importe is not null"
			else
				where_filter += " and t.importe = '" + filter.importe + "'"
		if (filter.cat_plan)
			if (filter.cat_plan=="(null)")
				where_filter += " and t.cat_plan is null"
			else if (filter.cat_plan == "(any)")
				where_filter += " and t.cat_plan is not null"
			else
				where_filter += " and t.cat_plan = '" + filter.cat_plan  + "'"
		if (filter.plan_promo)
			if (filter.plan_promo=="(null)")
				where_filter += " and t.plan_promo is null"
			else if (filter.plan_promo == "(any)")
				where_filter += " and t.plan_promo is not null"
			else
				where_filter += " and t.plan_promo = '" + filter.plan_promo + "'"

		return where_filter
	}

	@Transactional
	def createMonthly() {
		def code
		int counting = 0
		int counting_employes = 0
		int count_total_filter = 0
		int count_father = 0

		//BussinesUnit thisbu = BussinesUnit.findById(params.bu)
		//def bu_to_summarize = thisbu.getFamily()
		BussinesUnit thisbu = BussinesUnit.findById(params.bu)
		def bu_to_summarize = BussinesUnit.findAll(sort: 'father', order:'desc'){}

		/*
		 * Busco todos los filtros del Mes, ordenados por Tipo, para calcular al final los que son SUM
		 */
		Filter.findAll([sort: "type", order: "desc"]){}.each() { filter->
			//Filter.findAllByValidMonth(Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year), [sort: "type", order: "desc"]).each() { filter->

			count_total_filter = 0

			/*
			 * Empiezo a recorrer cada uno de los Puntos de Venta
			 */
			bu_to_summarize.each(){ butmp->

				// Reseteo contadores
				counting = 0
				def cantidad_emp = 0
				def where_filter = ""

				/*
				 * Filtros con Where
				 */
				if ( (filter.type == Filter_Type.WHERE || filter.type == Filter_Type.ADVANCED )
				&& butmp.isFamily(filter.bu))
				{

					where_filter = arma_where(filter, butmp)
					def countby = "count(t)"
					if (filter.suma && filter.suma.length()>0)
						countby = "sum(t." + filter.suma + ")"


					Employee.findAllWhere(bu:butmp).each(){ mparty ->
						def query = "select "+ countby +" from Transaction t where t.party.id = " + mparty.id  +
								where_filter +
								" and month(t.datet) = " + params.month_month +
								" and year(t.datet) = " + params.month_year

						/*
						 * Filtros ADVANCED
						 */
						if (filter.type == Filter_Type.ADVANCED)
						{
							query += " and " + filter.advance_where
						}

						cantidad_emp += 1
						Double thiscount=0;

						def res = Transaction.executeQuery(query);

						if (res[0])
							thiscount = res[0].toDouble()

						counting += thiscount.intValue()
						count_total_filter += thiscount.intValue()
						counting_employes += thiscount.intValue()

						code = Summary.findByEmployeeAndSumMonthAndFilter(mparty,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
						if (code){
							code.quantity = counting_employes
							code.save(failOnError: true, flush: true)
						}
						else{
							new Summary(
									filter: filter,
									summaryCode:filter.filterCode,
									employee: mparty,
									sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
									quantity: counting_employes
									).save(failOnError: true, flush: true)
						}
						counting_employes = 0
					}// Employees

					// Entonces es una region o JAG, busco los totales de los hijos y lo sumo
					if (cantidad_emp == 0)
					{
						butmp.getDirectSons().each(){ buson ->
							code = Summary.findByBuAndSumMonthAndFilter(buson, Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
							if (code)
								counting += code.quantity
						}
					}

					code = Summary.findByBuAndSumMonthAndFilter(butmp,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
					if (code){
						code.quantity = counting
						code.save(failOnError: true, flush: true)
					}
					else{
						code = new Summary(
								filter: filter,
								summaryCode:filter.filterCode,
								bu: butmp,
								sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
								quantity: counting
								).save(failOnError: true, flush: true)
					}


				}//if filter

				/*
				 * Filtros de SUM
				 */
				/*Ya deben estar calculados los otros filters*/
				if (filter.type == Filter_Type.SUM && butmp.isFamily(filter.bu))
				{
					int cc = 0
					int ct = 0

					// Busco todos los empleados del bu
					Employee.findAllWhere(bu:butmp).each(){ thisemp->
						cc = 0
						filter.totals.each  { ft->
							code = Summary.findByEmployeeAndSumMonthAndFilter(thisemp,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),ft);
							cc += code.quantity
						}

						code = Summary.findByEmployeeAndSumMonthAndFilter(thisemp,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
						if (code){
							code.quantity = cc
							code.save(failOnError: true, flush: true)
						}
						else{
							code = new Summary(
									filter: filter,
									summaryCode:filter.filterCode,
									employee: thisemp,
									sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
									quantity: cc
									).save(failOnError: true, flush: true)
						}
						ct += cc
					}

					// Entonces es una region o JAG, busco los totales de los hijos y lo sumo
					if (cantidad_emp == 0)
					{
						butmp.getDirectSons().each(){ buson ->
							code = Summary.findByBuAndSumMonthAndFilter(buson, Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
							if (code)
								ct += code.quantity
						}
					}
					// Summary del BU con el total de los empleados
					code = Summary.findByBuAndSumMonthAndFilter(butmp,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
					if (code){
						code.quantity = ct
						code.save(failOnError: true, flush: true)
					}
					else{
						code = new Summary(
								filter: filter,
								summaryCode:filter.filterCode,
								bu: butmp,
								sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
								quantity: ct
								).save(failOnError: true, flush: true)
					}


				}

			}//End Bu_tu_summarize

			/*Ya deben estar calculados los otros filters*/
			if (filter.type == Filter_Type.SUM && thisbu.isFamily(filter.bu))
			{
				int cc = 0
				filter.totals.each  { ft->
					code = Summary.findByBuAndSumMonthAndFilter(thisbu,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),ft);
					cc += code.quantity
				}

				code = Summary.findByBuAndSumMonthAndFilter(thisbu,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
				if (code){
					code.quantity = cc
					code.save(failOnError: true, flush: true)
				}
				else{
					code = new Summary(
							filter: filter,
							summaryCode:filter.filterCode,
							bu: thisbu,
							sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
							quantity: cc
							).save(failOnError: true, flush: true)
				}

			}


			if ( filter.type == Filter_Type.WHERE && count_total_filter!=0 && thisbu.isFamily(filter.bu) )
			{
				code = Summary.findByBuAndSumMonthAndFilter(thisbu,Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),filter)
				if (code)
				{
					code.quantity = count_total_filter
					code.save(failOnError: true, flush: true)
				}else{
					code = new Summary(
							filter: filter,
							summaryCode:filter.filterCode,
							bu: thisbu,
							sumMonth: Date.parse("MM/yyyy",  params.month_month +"/" + params.month_year),
							quantity: count_total_filter
							).save(failOnError: true, flush: true)
				}
			}


		}// End de todos los Filters encontrados

		redirect action:"totals"
	}



	@Transactional
	def delete(Summary summaryInstance) {

		if (summaryInstance == null) {
			notFound()
			return
		}

		summaryInstance.delete flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.deleted.message', args: [
					message(code: 'Summary.label', default: 'Summary'),
					summaryInstance.id
				])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

	protected void notFound() {
		request.withFormat {
			form {
				flash.message = message(code: 'default.not.found.message', args: [
					message(code: 'summaryInstance.label', default: 'Summary'),
					params.id
				])
				redirect action: "index", method: "GET"
			}
			'*'{ render status: NOT_FOUND }
		}
	}
}
