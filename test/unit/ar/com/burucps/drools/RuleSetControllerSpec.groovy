package ar.com.burucps.drools



import grails.test.mixin.*
import spock.lang.*

@TestFor(RuleSetController)
@Mock(RuleSet)
class RuleSetControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.ruleSetInstanceList
            model.ruleSetInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.ruleSetInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def ruleSet = new RuleSet()
            ruleSet.validate()
            controller.save(ruleSet)

        then:"The create view is rendered again with the correct model"
            model.ruleSetInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            ruleSet = new RuleSet(params)

            controller.save(ruleSet)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/ruleSet/show/1'
            controller.flash.message != null
            RuleSet.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def ruleSet = new RuleSet(params)
            controller.show(ruleSet)

        then:"A model is populated containing the domain instance"
            model.ruleSetInstance == ruleSet
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def ruleSet = new RuleSet(params)
            controller.edit(ruleSet)

        then:"A model is populated containing the domain instance"
            model.ruleSetInstance == ruleSet
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/ruleSet/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def ruleSet = new RuleSet()
            ruleSet.validate()
            controller.update(ruleSet)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.ruleSetInstance == ruleSet

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            ruleSet = new RuleSet(params).save(flush: true)
            controller.update(ruleSet)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/ruleSet/show/$ruleSet.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/ruleSet/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def ruleSet = new RuleSet(params).save(flush: true)

        then:"It exists"
            RuleSet.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(ruleSet)

        then:"The instance is deleted"
            RuleSet.count() == 0
            response.redirectedUrl == '/ruleSet/index'
            flash.message != null
    }
}
