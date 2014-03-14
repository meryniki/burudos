package ar.com.burudos.business

import ar.com.burudos.party.Employee;
import ar.com.burudos.party.Party;

class BussinesUnit {

	String code; //Es el IdPDR o codigo de canal
	String provincia;
	String departamento;
	String localidad;
	String calle;
	String altura;
	String nombre;
	BussinesUnit father;
	Employee coordinator;
	
	static constraints = {
		code(nullable: false);
		provincia(nullable: true);
		departamento(nullable: true);
		localidad(nullable: true);
		calle(nullable: true);
		altura(nullable: true);
		nombre(nullable: true);
		coordinator (nullable: true);
		father(nullable: true);
	}
	
	String toString() {
		"$code-$nombre";
	}
	
}
