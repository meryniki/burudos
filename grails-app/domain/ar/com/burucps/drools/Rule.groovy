package ar.com.burucps.drools

import java.util.Date;

import ar.com.burucps.sales.statement.StatementLineGroup;

class Rule {
	
	String ruleName
	RuleDialect dialect
	Integer salience
	String ruleCondition
	String ruleConsequence
	StatementLineGroup ruleGroup
	Boolean active
	// Auiditoria
	Date creationDate
	String createdBy
	Date lastUpdateDate
	String lastUpdateBy
	
	static hasMany = [ruleSets : RuleSet]
	static belongsTo = RuleSet
	

    static constraints = {
		ruleName (nullable : false, unique: true)
		dialect(nullable: false)
		salience(nullable:true)
		ruleCondition(nullable:false)
		ruleConsequence(nullable:false)
		ruleGroup(nullable:false)
		active(nullable:false)
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
    }
	
	static mapping = {
		ruleCondition type: 'text'
		ruleConsequence type: 'text'
	 }
	
	def beforeInsert() {
		//createdBy = securityService.currentAuthenticatedUsername();
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		creationDate = new Date();
		lastUpdateDate = new Date();
	}

	def beforeUpdate() {
		//lastUpdatedBy = securityService.currentAuthenticatedUsername();
		lastUpdateDate = new Date();
	}
	
	String toString() {
		"$ruleName";
	}
	 
	
}
