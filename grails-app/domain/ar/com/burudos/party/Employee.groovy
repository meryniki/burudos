package ar.com.burudos.party

import java.util.Date;

import ar.com.burudos.business.BussinesUnit

class Employee extends Party{

		String employeenro;
		String names;
		String lastname;
		Date dofbirth;
		int  basic;
		BussinesUnit bu;
		boolean isworker;
		boolean iscoordinator;

		static constraints = {
			uid (nullable: false);
			name (nullable: false);
			email (email : true, nullable: true);
			dofbirth (max : new Date(), nullable: false);
			bu (nullable: true);
			isworker (nullable: false);
			iscoordinator (nullable: false);
			basic( nullable: true);
			
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
}
