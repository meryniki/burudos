package ar.com.burucps.drools



import grails.test.mixin.*
import spock.lang.*

@TestFor(RuleController)
@Mock(Rule)
class RuleControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.ruleInstanceList
            model.ruleInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.ruleInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            def rule = new Rule()
            rule.validate()
            controller.save(rule)

        then:"The create view is rendered again with the correct model"
            model.ruleInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            rule = new Rule(params)

            controller.save(rule)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/rule/show/1'
            controller.flash.message != null
            Rule.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def rule = new Rule(params)
            controller.show(rule)

        then:"A model is populated containing the domain instance"
            model.ruleInstance == rule
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def rule = new Rule(params)
            controller.edit(rule)

        then:"A model is populated containing the domain instance"
            model.ruleInstance == rule
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/rule/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def rule = new Rule()
            rule.validate()
            controller.update(rule)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.ruleInstance == rule

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            rule = new Rule(params).save(flush: true)
            controller.update(rule)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/rule/show/$rule.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/rule/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def rule = new Rule(params).save(flush: true)

        then:"It exists"
            Rule.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(rule)

        then:"The instance is deleted"
            Rule.count() == 0
            response.redirectedUrl == '/rule/index'
            flash.message != null
    }
}
