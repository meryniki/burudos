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

	
	static mapping = {
		nombre index:'NombreBu_Idx'
	}

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
		"$nombre";
	}

	def getFamily(){
		def family = []
		BussinesUnit thisone
		thisone = this
		family.add(thisone)
		while(thisone.father!=null)
		{
			thisone = thisone.father
			family.addAll(thisone.getSons())
		}
		family.addAll(thisone.getSons())
		return family
	}

	def getSons(){
		def sons=[]
		sons.add(this)
		BussinesUnit.findAllByFather(this).each() { btu->
			sons.add(btu)
			BussinesUnit.findAllByFather(btu).each { abtu->
				sons.add(abtu)
				BussinesUnit.findAllByFather(abtu).each { bbtu->
					sons.add(bbtu)
				}
			}
		}
		return sons
	}
	
	public Integer getEmployeeCount() {
		return Employee.countByBu(this)
	}
}