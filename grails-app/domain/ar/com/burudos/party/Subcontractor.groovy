package ar.com.burudos.party

import ar.com.burudos.business.BussinesUnit

import java.util.Date;

class Subcontractor extends Party {
	
	Date dofbeg;
	BussinesUnit bu;

	static constraints = {
		uid (nullable: false);
		name (nullable: false);
		email (email : true, nullable: true);
		dofbeg (max : new Date(), nullable: false);
		bu (nullable: true);
		
		// Auditoria
		creationDate (nullable: true);
		createdBy (nullable: true);
		lastUpdateDate (nullable: true);
		lastUpdateBy (nullable: true);
	}
	
	def beforeInsert() {
		//createdBy = securityService.currentAuthenticatedUsername()
		//lastUpdatedBy = securityService.currentAuthenticatedUsername()
		creationDate = new Date();
		lastUpdateDate = new Date();
	 }
	
	def beforeUpdate() {
		//lastUpdatedBy = securityService.currentAuthenticatedUsername()
		lastUpdateDate = new Date();
	 }
	
	String toString() {
		"$name";
	}

}
