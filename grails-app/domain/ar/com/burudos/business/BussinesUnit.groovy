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
	
	def getDirectSons(){
		def sons=[]
		BussinesUnit.findAllByFather(this).each() { btu->
			sons.add(btu)
		}
		return sons
	}
	

	/*
	 * Busca si es hijo o nieto de t
	 */
	Boolean isFamily(BussinesUnit t){
		if (this.id == t.id)
			return true
		BussinesUnit tf = this.father
		if (tf)
		{
			if (tf.id == t.id)
			return true
			BussinesUnit nf = tf.father
			if (nf)
			{
				if (nf.id == t.id)
				return true
				if (nf.father.id && nf.father.id == t.id)
				return true // Es el bisnieto
			}
		}

		return false
	}

	public Integer getEmployeeCount() {
		def query = Employee.where{
			bu ==  this && name != "NO INGRESADO"
		}

		return query.count()
	}
}