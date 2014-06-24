package ar.com.burudos.party

import java.util.Date;

import ar.com.burudos.sales.Summary;
import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.sales.Transaction;
import ar.com.burudos.sales.Operation;

import ar.com.burucps.drools.RuleSet;

class Employee extends Party{

	String legajo;
	String fullname;
	String names;
	String lastname;
	Date dofbirth;
	Date dofingreso;
	int  basic;
	BussinesUnit bu;
	boolean isworker;
	boolean iscoordinator;
	RuleSet statementRules;

	static constraints = {
		legajo (nullable: false);
		name (nullable: false);
		fullname(nullable:true)
		names (nullable: true);
		lastname (nullable: true);
		dofingreso (max : new Date(), nullable: false);
		uid (nullable: false);
		bu(nullable: true);
		email (email : true, nullable: true);
		dofbirth (max : new Date(), nullable: true);
		isworker (nullable: false);
		iscoordinator (nullable: false);
		basic( nullable: true);
		statementRules(nullable:true);

		// Auditoria
		creationDate (nullable: true);
		createdBy (nullable: true);
		lastUpdateDate (nullable: true);
		lastUpdateBy (nullable: true);
	}

	def beforeValidate() {
		if (fullname!=null) {
			names = getMyNames();
			lastname = getMyLastName();
		}
		if (name==null)
			name = getMyName();
	}

	public String getMyName() {
		def list = []
		if (lastname && lastname.trim())
			list << lastname.trim();
		if (names && names.trim())
			list << names.trim();
		if (list.size() > 0)
			return list.join(' ');
		return null;
	}

	public String getMyLastName() {
		def last = []
		last = fullname.split(",")
		return last[0];
	}

	public String getMyNames() {
		def list = []
		def last = []
		last = fullname.split(",")
		list = last[1].split(" ")
		return list[1];
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
	
	@Override
	public int hashCode() {
		return this.id.intValue();
	}

	@Override
	public boolean equals(Object o) {
		if (!o)
			return false;
		if ((!o instanceof Employee) || (!o instanceof Party))
			return false;
		if (!this.id)
			return false;
		return this.id.equals(((Party) o).getId());
	}

	String toString() {
		"$name";
	}

}
