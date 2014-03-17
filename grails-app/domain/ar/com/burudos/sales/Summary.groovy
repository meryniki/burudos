package ar.com.burudos.sales

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee;

class Summary {
	BussinesUnit bu;
	Integer quantity;
	Operation op;
	Integer month;

	static constraints = {
		bu(nullable:false)
		op(nullable:false)
		month (nullable: false)
		quantity (nullable: true)
	}

	def beforeValidate() {
		quantity = 0;
		//Employee.findAllWhere(bu=bu.id).each{ mparty ->
		Employee.list().each{ mparty->
			if (mparty.bu.id == bu.id){
				//Transaction.findAllWhere(party=mparty.id,op=op.id).each{ tx->
				Transaction.list().each{ tx->
					if ( tx.party.id == mparty.id && tx.op.id == op.id )
						quantity = quantity + 1;
				}
			}
		}
	}

}