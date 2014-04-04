package ar.com.burudos.sales.statement

import ar.com.burudos.party.Employee;

class EmployeeStatement extends Statement {
	
	static belongsTo = [employee : Employee]

    static constraints = {
    }
}
