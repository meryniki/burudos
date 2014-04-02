package ar.com.burudos.sales.statement

import ar.com.burucps.sales.statement.StatementLineGroup;
import ar.com.burudos.business.BussinesUnit;

class Parameters {

	String paramCode
	StatementLineGroup paramCategory
	String paramGroup
	String paramDescription
	Double maxValue
	Double minValue
	BussinesUnit bussinesUnit

	static constraints = {
		paramCode (nullable : false)
		paramCategory (nullable : false)
		paramGroup (nullable : true)
		paramDescription (nullable : false)
		maxValue (nullable : false)
		minValue (nullable : true)
		bussinesUnit (nullable : false, validator: { val, obj ->
			def paramForSameBU = Parameters.findByParamCodeAndBussinesUnit(obj.paramCode, obj.bussinesUnit)
			return !paramForSameBU
		})
	}

}