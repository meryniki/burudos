package ar.com.burudos.sales.statement



import grails.test.mixin.*
import spock.lang.*

@TestFor(EmployeeStatementController)
@Mock(Statement)
class StatementControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.statementInstanceList
            model.statementInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.process()

        then:"The model is correctly created"
            model.statementInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def statement = new Statement()
            statement.validate()
            controller.save(statement)

        then:"The create view is rendered again with the correct model"
            model.statementInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            statement = new Statement(params)

            controller.save(statement)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/statement/show/1'
            controller.flash.message != null
            Statement.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def statement = new Statement(params)
            controller.show(statement)

        then:"A model is populated containing the domain instance"
            model.statementInstance == statement
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def statement = new Statement(params)
            controller.edit(statement)

        then:"A model is populated containing the domain instance"
            model.statementInstance == statement
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/statement/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def statement = new Statement()
            statement.validate()
            controller.update(statement)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.statementInstance == statement

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            statement = new Statement(params).save(flush: true)
            controller.update(statement)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/statement/show/$statement.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/statement/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def statement = new Statement(params).save(flush: true)

        then:"It exists"
            Statement.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(statement)

        then:"The instance is deleted"
            Statement.count() == 0
            response.redirectedUrl == '/statement/index'
            flash.message != null
    }
}
