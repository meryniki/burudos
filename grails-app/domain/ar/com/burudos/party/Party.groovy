package ar.com.burudos.party

class Party {

	String uid;
	String name;
	String email;

	// Auiditoria
	Date creationDate;
	String createdBy;
	Date lastUpdateDate;
	String lastUpdateBy;
	
	static mapping = {
		name index:'NameParty_Idx'
	}
	
	
	static constraints = {
		uid (nullable: true)
		name (nullable: false)
		email (email : true, nullable: true)
		// Auditoria
		creationDate (nullable: true);
		createdBy (nullable: true);
		lastUpdateDate (nullable: true);
		lastUpdateBy (nullable: true);
	}

	String toString() {
		"$name";
	}
}
