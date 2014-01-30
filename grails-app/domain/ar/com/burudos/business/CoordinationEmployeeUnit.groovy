package ar.com.burudos.business

import ar.com.burudos.party.Employee
import org.apache.commons.lang.builder.HashCodeBuilder

class CoordinationEmployeeUnit implements Serializable{
	
	Employee user;
	BussinesUnit role;

	boolean equals(other) {
		if (!(other instanceof CoordinationEmployeeUnit)) {
			return false
		}

		other.user?.id == user?.id &&
			other.role?.id == role?.id
	}

	int hashCode() {
		def builder = new HashCodeBuilder()
		if (user) builder.append(user.id)
		if (role) builder.append(role.id)
		builder.toHashCode()
	}

	static CoordinationEmployeeUnit get(long userId, long roleId) {
		find 'from CoordinationEmployeeUnit where user.id=:userId and role.id=:roleId',
			[userId: userId, roleId: roleId]
	}

	static CoordinationEmployeeUnit create(Employee user, BussinesUnit role, boolean flush = false) {
		new CoordinationEmployeeUnit(user: user, role: role).save(flush: flush, insert: true)
	}

	static boolean remove(Employee user, BussinesUnit role, boolean flush = false) {
		CoordinationEmployeeUnit instance = CoordinationEmployeeUnit.findByUserAndRole(user, role)
		if (!instance) {
			return false
		}

		instance.delete(flush: flush)
		true
	}

	static void removeAll(Employee user) {
		executeUpdate 'DELETE FROM CoordinationEmployeeUnit WHERE user=:user', [user: user]
	}

	static void removeAll(BussinesUnit role) {
		executeUpdate 'DELETE FROM CoordinationEmployeeUnit WHERE role=:role', [role: role]
	}

	static mapping = {
		id composite: ['role', 'user']
		version false
	}

}
