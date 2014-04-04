package ar.com.burudos.sales.statement

import ar.com.burudos.party.Subcontractor;

class SubcontractorStatement {
	
	static belongsTo = [subcontractor : Subcontractor]

    static constraints = {
    }
}
