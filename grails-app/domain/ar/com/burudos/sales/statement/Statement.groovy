package ar.com.burudos.sales.statement

class Statement {
	
	static hasMany = [lines : StatementLine]

    static constraints = {
    }
}
