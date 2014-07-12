package ar.com.burucps.drools

import java.util.Date;

class RuleSet {
	
	String ruleSetName
	String ruleSetDescription
	static hasMany = [rules: Rule]
	
	String ruleSetPackage
	String ruleSetImports
	String ruleSetGlobals
	
	// Auiditoria
	Date creationDate
	String createdBy
	Date lastUpdateDate
	String lastUpdateBy

    static constraints = {
		ruleSetName (nullable : false, unique: true)
		ruleSetDescription (nullable : true)
		ruleSetPackage(nullable : true)
		ruleSetImports(nullable : true)
		ruleSetGlobals(nullable : true)
		// Auditoria
		creationDate (nullable: true)
		createdBy (nullable: true)
		lastUpdateDate (nullable: true)
		lastUpdateBy (nullable: true)
    }
	
	static mapping = {
		ruleSetImports type: 'text'
		ruleSetGlobals type: 'text'
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
	
	@Override
	public int hashCode() {
		return this.id.intValue();
	}

	@Override
	public boolean equals(Object o) {
		if (!o)
			return false;
		if (!o instanceof RuleSet)
			return false;
		if (!this.id)
			return false;
		return this.id.equals(((RuleSet) o).id);
	}
	
	String toString() {
		"$ruleSetName";
	}
}