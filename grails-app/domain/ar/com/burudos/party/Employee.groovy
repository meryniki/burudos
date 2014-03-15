package ar.com.burudos.party

import java.util.Date;

import ar.com.burudos.business.BussinesUnit

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
		list << lastname;
		if (names && names.trim())
			list << names;
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

	String toString() {
		"$name";
	}
}
