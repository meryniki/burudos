package ar.com.burudos.sales



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class OperationController {
	
	static Boolean linkMe = true
	static String btnName = "operation.btnLabel"
	
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Operation.list(params), model:[operationInstanceCount: Operation.count()]
    }

    def show(Operation operationInstance) {
        respond operationInstance
    }

    def create() {
        respond new Operation(params)
    }

    @Transactional
    def save(Operation operationInstance) {
        if (operationInstance == null) {
            notFound()
            return
        }

        if (operationInstance.hasErrors()) {
            respond operationInstance.errors, view:'create'
            return
        }

        operationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.created.message', args: [message(code: 'operationInstance.label', default: 'Operation'), operationInstance.id])
                redirect operationInstance
            }
            '*' { respond operationInstance, [status: CREATED] }
        }
    }

    def edit(Operation operationInstance) {
        respond operationInstance
    }

    @Transactional
    def update(Operation operationInstance) {
        if (operationInstance == null) {
            notFound()
            return
        }

        if (operationInstance.hasErrors()) {
            respond operationInstance.errors, view:'edit'
            return
        }

        operationInstance.save flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Operation.label', default: 'Operation'), operationInstance.id])
                redirect operationInstance
            }
            '*'{ respond operationInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Operation operationInstance) {

        if (operationInstance == null) {
            notFound()
            return
        }

        operationInstance.delete flush:true

        request.withFormat {
            form {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Operation.label', default: 'Operation'), operationInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'operationInstance.label', default: 'Operation'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
