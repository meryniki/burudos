package ar.com.burudos.sales.statement

import ar.com.burudos.party.Subcontractor;

class SubcontractorStatement extends Statement {
	
	static belongsTo = [subcontractor : Subcontractor]

    static constraints = {
		subcontractor (nullable : true)
    }
}
