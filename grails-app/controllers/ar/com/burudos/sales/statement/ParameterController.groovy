package ar.com.burudos.sales.statement



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ParameterController {
	
	static Boolean linkMe = true
	static String btnName = "parameter.btnLabel"
	static String iconName = "parameter.iconName"

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

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
		def query = "from Parameter p where p.paramCode like '%%" + search +
				"%%' or p.paramCategory like '%%" + search +
				"%%' or p.paramGroup like '%%" + search +
				"%%' or p.paramDescription like '%%" + search +
				"%%'"

		/* Use counting to have both values total and counting with only one query */
		Parameter.findAll(query,[offset: offset]).each{ trx->
			if ( counting < max) {
				lista.add(trx);
				counting += 1;
			}
			total += 1;
		}
		/*The map will be passed as param in g:sorteable and g:paginate*/
		mapsearch.put("search", search);

		respond lista, model:[parameterInstanceCount: total,
			mapsearch: mapsearch]
	}

    def show(Parameter parameterInstance) {
        respond parameterInstance
    }

    def create() {
        respond new Parameter(params)
    }

    @Transactional
    def save(Parameter parameterInstance) {
        if (parameterInstance == null) {
            notFound()
            return
        }
		
        if (parameterInstance.hasErrors()) {
            respond parameterInstance.errors, view:'create'
            return
        }

        parameterInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'parameterInstance.label', default: 'Parameter'), parameterInstance.id])
                redirect parameterInstance
            }
            '*' { respond parameterInstance, [status: CREATED] }
        }
    }

    def edit(Parameter parameterInstance) {
        respond parameterInstance
    }

    @Transactional
    def update(Parameter parameterInstance) {
        if (parameterInstance == null) {
            notFound()
            return
        }

        if (parameterInstance.hasErrors()) {
            respond parameterInstance.errors, view:'edit'
            return
        }

        parameterInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Parameter.label', default: 'Parameter'), parameterInstance.id])
                redirect parameterInstance
            }
            '*'{ respond parameterInstance, [status: OK] }
        }
    }

    @Transactional
    def deactivate(Parameter parameterInstance) {

        if (parameterInstance == null) {
            notFound()
            return
        }

        parameterInstance.active = false
		parameterInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deactivated.message', args: [message(code: 'Parameter.label', default: 'Parameter'), parameterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }
	
	@Transactional
	def activate(Parameter parameterInstance) {

		if (parameterInstance == null) {
			notFound()
			return
		}

		parameterInstance.active = true
		parameterInstance.save flush:true

		request.withFormat {
			form {
				flash.message = message(code: 'default.activated.message', args: [message(code: 'Parameter.label', default: 'Parameter'), parameterInstance.id])
				redirect action:"index", method:"GET"
			}
			'*'{ render status: NO_CONTENT }
		}
	}

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'parameterInstance.label', default: 'Parameter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
