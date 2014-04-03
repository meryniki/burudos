package ar.com.burudos.sales



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import ar.com.burudos.business.BussinesUnit

@Transactional(readOnly = true)
class SummaryController {
	
	static Boolean linkMe = true
	static String btnName = "summary.btnLabel"
	static String iconName = "summary.iconName"

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max, Integer offset, String search) {
		/*Initialize counts and params*/
		def counting = 0;
		def total = 0;
		def lista = [];
		def mapsearch = [:];
		if (!search)
			search = "";
		if (!offset)
			offset = 0;
		if (!max)
			max = 20;
		
		params.max = max;
			
		/*query depends on fields to filter*/
		def query = "from Summary s where s.bu.nombre like '%%" + search + 
		                         "%%' or s.op.cat_plan like '%%" + search +
								 "%%' or s.op.plan_promo like '%%" + search +
								 "%%' or s.op.code like '%%" + search +
								 "%%'"

		/* Use counting to have both values total and counting with only one query */
		Summary.findAll(query,[offset: offset]).each{ trx->
			if ( counting < max) {
				lista.add(trx);
				counting += 1;
			}
			total += 1;
		}
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[summaryInstanceCount: total,
			mapsearch: mapsearch]
		
	}

    def show(Summary summaryInstance) {
        respond summaryInstance
    }

    def create() {
        respond new Summary(params)
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
                flash.message = message(code: 'default.created.message', args: [message(code: 'summaryInstance.label', default: 'Summary'), summaryInstance.id])
                redirect summaryInstance
            }
            '*' { respond summaryInstance, [status: CREATED] }
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

        summaryInstance.create

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Summary.label', default: 'Summary'), summaryInstance.id])
                redirect summaryInstance
            }
            '*'{ respond summaryInstance, [status: OK] }
        }
    }
	
	def domonthly = {
	}

@Transactional
def createMonthly() {
	def code
	Operation.getAll().each() { op ->
		code = new Summary(
				op: op,
				bu: BussinesUnit.findById(params.bu).id,
				month: params.month
				).save(failOnError: true, flush: true)
	}

	redirect action:"index"
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
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Summary.label', default: 'Summary'), summaryInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'summaryInstance.label', default: 'Summary'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
