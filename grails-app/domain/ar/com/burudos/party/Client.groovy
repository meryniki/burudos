package ar.com.burudos.party

class Client {

	String ndoc;
	String cname;
	
	
	static mapping = {
		ndoc index:'NDoc_Idx'
	}
	
    static constraints = {
		cname (nullable: false);
		ndoc (nullable: true);
    }
}
