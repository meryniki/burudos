package ar.com.burucps.business

import ar.com.burudos.business.BussinesUnit

class BusinessUnitTree {
	Map <Long, BussinesUnit> businessUnitMap = new HashMap<Long, BussinesUnit>();
	
	void loadTree() {
		BussinesUnit.findAll().each() { it ->
			businessUnitMap.put(it.id, it)
		}
	}
	
	BussinesUnit getBusinessUnit(Long id) {
		return businessUnitMap.get(id)
	}
}
