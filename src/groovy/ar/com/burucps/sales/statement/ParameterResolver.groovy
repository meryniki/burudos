package ar.com.burucps.sales.statement

import org.apache.commons.logging.LogFactory

import ar.com.burudos.business.BussinesUnit;
import ar.com.burudos.party.Employee
import ar.com.burudos.sales.statement.Parameter

class ParameterResolver {
	
	private static final log = LogFactory.getLog(this)

	HashMap<String,Parameter> parameters = new HashMap<String,Parameter>(); 

	Parameter resolve(String parameterCode, BussinesUnit bu) {
		def hash = parameterCode + bu.id
		def parameter = parameters.get(hash)
		if ((!parameter) && (!bu.father)) {
			return null
		}
		if ((!parameter) && (bu.father)) {
			return resolve(parameterCode, bu.father)
		}
		log.debug("Resolución de parámetro: " + parameter + "Hash: " + hash)
		return parameter
	}

	void loadParameters() {
		Parameter.findAll().each() { it ->
			def hash = it.paramCode + it.bussinesUnit.id
			log.debug("Agrego un parametro al resolver: " + hash)
			parameters.put(hash, it)
		}
	}
}
