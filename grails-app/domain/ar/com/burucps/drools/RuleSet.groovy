package ar.com.burucps.drools

import java.util.Date;

class RuleSet {
	
	String ruleSetName
	String ruleSetDescription
	static hasMany = [rules: Rule]
	
	// Auiditoria
	Date creationDate
	String createdBy
	Date lastUpdateDate
	String lastUpdateBy

    static constraints = {
		ruleSetName (nullable : false, unique: true)
		ruleSetDescription (nullable : true)
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
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
	
	Integer ruleCount() {
		rules.size()
	}
}
