package ar.com.burudos.sales.statement

import ar.com.burudos.party.Subcontractor;

class SubcontractorStatement {
	
	static hasOne = [subcontractor : Subcontractor]

    static constraints = {
    }
}
