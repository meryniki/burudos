package ar.com.burudos.party

class Client {

	String ndoc;
	String cname;
	
    static constraints = {
		cname (nullable: false);
		ndoc (nullable: true);
    }
}
